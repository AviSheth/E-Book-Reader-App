import 'package:e_book_reader/Database/DatabaseHelper.dart';
import 'package:e_book_reader/Database/Model/ebook.dart';
import 'package:e_book_reader/Database/sharedPrefeHelper.dart';
import 'package:e_book_reader/Home%20Screen/ebookdetails.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart'; // Import localization package
import 'package:carousel_slider/carousel_slider.dart';

class HomePage extends StatefulWidget {
  final List<Ebook>? ebooks;
  const HomePage({super.key, this.ebooks});

  @override
  State<HomePage> createState() => _HomePageContentState();
}

class _HomePageContentState extends State<HomePage> {
  List<Ebook> recommendedBooks = [];
  List<Ebook> newReleases = [];

  @override
  void initState() {
    super.initState();
    fetchEbooks();
  }

  Future<void> fetchEbooks() async {
    final db = DatabaseHelper.instance;

    // Get current user's email
    final prefHelper = await SharedPrefHelper.getInstance();
    final email = prefHelper.getUserEmail();
    if (email == null) return;

    final user = await db.getCurrentUser(email);
    if (user == null) return;

    final userId = user.id;

    // Fetch ebooks and favorites
    List<Map<String, dynamic>> ebookMaps = await db.newEbooks();
    List<Ebook> ebooks = ebookMaps.map((ebookMap) => Ebook.fromMap(ebookMap)).toList();

  //  bool favoriteBookIds = await db.isFavorite(userId!);

  /*  ebooks.sort((a, b) {
      if (a.lastOpened != null && b.lastOpened != null) {
        return DateTime.parse(b.lastOpened!).compareTo(DateTime.parse(a.lastOpened!));
      }
      if (a.lastOpened == null) return 1;
      if (b.lastOpened == null) return -1;
      return 0;
    });*/

    setState(() {
   //   recommendedBooks = ebooks.where((book) => favoriteBookIds.contains(book.bookid)).toList();
      newReleases = ebooks;
    });
  }


  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context)!; // Localized strings

    return SingleChildScrollView(
      child: Column(
        children: [
          _buildSlider(newReleases),
        // _buildBookSection(loc.recommendedBooks, recommendedBooks, isGrid: false),
          _buildBookSection(loc.newReleases, newReleases, isGrid: true),
        ],
      ),
    );
  }

  Widget _buildSlider(List<Ebook> books) {
    if (books.isEmpty) return const SizedBox.shrink(); // No books, no slider

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: CarouselSlider(
        options: CarouselOptions(
          height: 200,
          autoPlay: true,
          enlargeCenterPage: true,
          viewportFraction: 0.8,
          aspectRatio: 16/9,
          autoPlayInterval: const Duration(seconds: 3),
        ),
        items: books.take(4).map((ebook) {
          return Builder(
            builder: (BuildContext context) {
              return GestureDetector(
                onTap: () {
                  Navigator.push(
                    context , MaterialPageRoute(builder: (context) => EbookDetailPage(ebook: ebook))
                  );
                },

                child: Hero(
                    tag: 'cover_${ebook.bookid}',
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: ebook.coverpage != null
                      ? Image.network(
                    ebook.coverpage,
                    fit: BoxFit.cover,
                    width: double.infinity,
                    errorBuilder: (context, error, stackTrace) =>
                    const Icon(Icons.book, size: 50),
                  )
                      : const Icon(Icons.book, size: 50),
                ),
              )
              );
            },
          );
        }).toList(),
      ),
    );
  }

  Widget _buildBookSection(String title, List<Ebook> books, {bool isGrid = false}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _sectionHeader(context, title),
        isGrid
            ? Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: GridView.builder(
            itemCount: books.length >= 6 ? 4 : books.length,
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
              childAspectRatio: 0.8,
            ),
            itemBuilder: (context, index) {
              final ebook = books[index];
              return _buildBookCard(context, ebook);
            },
          ),
        )
            : SizedBox(
          height: 250,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: books.length,
            itemBuilder: (itemcontext, index) {
              final ebook = books[index];
              return Container(
                width: 180,
                margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                child: _buildBookCard(itemcontext, ebook),
              );
            },
          ),
        ),
      ],
    );
  }

  Widget _buildBookCard(BuildContext context, Ebook ebook) {

    return InkWell(
      onTap: () async{
       // await DatabaseHelper.instance.updateLastOpened(ebook.bookid);
        Navigator.push(
          context,
          PageRouteBuilder(
            pageBuilder: (context, animation, secondaryAnimation) => EbookDetailPage(ebook: ebook),
            transitionsBuilder: (context, animation, secondaryAnimation, child) {
              final tween = Tween(begin: 0.0, end: 1.0);
              final fadeAnimation = animation.drive(CurveTween(curve: Curves.easeIn)).drive(tween);
              return FadeTransition(opacity: fadeAnimation, child: child);
            },
            transitionDuration: const Duration(milliseconds: 500),
          ),
        );
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ebook.coverpage != null
              ? ClipRRect(
            borderRadius: BorderRadius.circular(4),
            child: Image.network(
              ebook.coverpage,
              width: double.infinity,
              height: 160,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) =>
              const Icon(Icons.book, size: 50),
            ),
          )
              : const Icon(Icons.book, size: 40),
          const SizedBox(height: 8),
          Text(
            ebook.title,
            style: const TextStyle(fontWeight: FontWeight.bold),
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
          ),
          Text(
            'Author: ${ebook.author}',
            style: const TextStyle(fontSize: 12),
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
          ),
        ],
      ),
    );
  }

  Widget _sectionHeader(BuildContext context, String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      child: Row(
        children: [
          Text(
            title,
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const Spacer(),
        ],
      ),
    );
  }
}


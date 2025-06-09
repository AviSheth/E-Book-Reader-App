import 'package:e_book_reader/Database/DatabaseHelper.dart';
import 'package:e_book_reader/Database/Model/ebook.dart';
import 'package:e_book_reader/Database/sharedPrefeHelper.dart';
import 'package:e_book_reader/Home%20Screen/ebookdetails.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class FavoritePage extends StatefulWidget {
  const FavoritePage({Key? key, /*required this.userDB*/}) : super(key: key);
 // final userDB;

  @override
  FavoritePageState createState() => FavoritePageState();
}

class FavoritePageState extends State<FavoritePage> {
  List<Map<String, dynamic>> favoriteBooks = [];
  bool isLoading = true;
  var userDB;


  @override
  void initState() {
    super.initState();
    loadFavorites();
  }

  Future<void> loadFavorites() async {
    setState(() => isLoading = true);
    final prefs = await SharedPrefHelper.getInstance();
    final email = prefs.getUserEmail();
    if( email == null){
      setState(() => false == isLoading );
      return;
    }

    final db = DatabaseHelper.instance;
    final user = await db.getCurrentUser(email);
   if (user == null){
     setState(() {
       isLoading = false;
     });
     return;
   }

   final favorites = await db.getFavoriteBooksForUser(user.id!);
   setState(() {
     favoriteBooks = favorites;
     isLoading =false;
   });


  }

  Future<void> toggleFavorite(int bookId) async {
    final db = DatabaseHelper.instance;

    final prefHelper = await SharedPrefHelper.getInstance();
    final email = prefHelper.getUserEmail(); // Corrected usage
    if (email == null) return;
    final user = await db.getCurrentUser(email);
    if (user == null) return;

    final userId = user.id;
    final isCurrentlyFavorite = favoriteBooks.any((book) => book['bookid'] == bookId);

    await db.setFavorite(userId!, bookId, !isCurrentlyFavorite);
    await loadFavorites(); // Refresh the favorites list
  }
  Future<bool?> confirmDelete(BuildContext context, int bookId, String title) async {
    final loc = AppLocalizations.of(context)!; // Localized strings
    return showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(loc.removeFavorite),
        content: Text(loc.removeFavoriteConfirmation(title)),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, false),
            child: Text(loc.cancel),
          ),
          TextButton(
            onPressed: () async {
              await toggleFavorite(bookId);
              Navigator.pop(context, true);
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(loc.removedFromFavorites)),
              );
            },
            child: Text(loc.remove, style: TextStyle(color: Colors.red)),
          ),
        ],
      ),
    );
  }

  Widget _buildBookItem(BuildContext context, Map<String, dynamic> book) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      elevation: 5,
      child: ListTile(
        contentPadding: const EdgeInsets.all(12),
        leading: ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: book['coverpage'] != null
              ? Image.network(
            book['coverpage'],
            width: 50,
            height: 70,
            fit: BoxFit.cover,
            errorBuilder: (context, error, stackTrace) =>
            const Icon(Icons.broken_image, size: 50),
          )
              : const Icon(Icons.book, size: 50),
        ),
        title: Text(
          book['title'] ?? 'Unknown Title',
          style: const TextStyle(fontWeight: FontWeight.bold),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        subtitle: Text(book['author'] ?? 'Unknown Author'),
        trailing: IconButton(
          icon: const Icon(Icons.favorite, color: Colors.red),
          onPressed: () => confirmDelete(context, book['bookid'], book['title'] ?? ''),
        ),
        onTap: () {
          final ebook = Ebook.fromMap(book); // Convert to Ebook model
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => EbookDetailPage(ebook: ebook),
              ));
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context)!; // Localized strings

    return Scaffold(

      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : favoriteBooks.isEmpty
          ? Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.favorite_border, size: 64, color: Colors.grey),
            const SizedBox(height: 16),
            Text(loc.noFavoriteBooks),
            TextButton(
              onPressed: loadFavorites,
              child: Text(loc.refresh),
            ),
          ],
        ),
      )
          : ListView.separated(
        itemCount: favoriteBooks.length,
        separatorBuilder: (context, index) => const SizedBox(height: 8),
        padding: const EdgeInsets.all(16),
        itemBuilder: (context, index) {
          final book = favoriteBooks[index];
          return Dismissible(
            key: Key(book['bookid'].toString()),
            direction: DismissDirection.endToStart,
            background: Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              alignment: Alignment.centerRight,
              color: Colors.red,
              child: const Icon(Icons.delete, color: Colors.white, size: 30),
            ),
            confirmDismiss: (direction) =>
                confirmDelete(context, book['bookid'], book['title'] ?? ''),
            child: _buildBookItem(context, book),
          );
        },
      ),
    );
  }
}




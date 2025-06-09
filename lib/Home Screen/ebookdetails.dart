import 'package:e_book_reader/Database/DatabaseHelper.dart';
import 'package:e_book_reader/Database/Model/ebook.dart';
import 'package:e_book_reader/Database/Model/lastopened.dart';
import 'package:e_book_reader/Database/sharedPrefeHelper.dart';
import 'package:e_book_reader/PdfViewer/pdfViewer_Screen.dart';
import 'package:e_book_reader/menu/subscription/subscription_plan.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class EbookDetailPage extends StatefulWidget {
  final Ebook ebook;
  const EbookDetailPage({super.key, required this.ebook});

  @override
  State<EbookDetailPage> createState() => _EbookDetailPageState();
}

class _EbookDetailPageState extends State<EbookDetailPage> {
  late bool isFavorite = false;
  int? userId;
  late SharedPrefHelper _sharedPrefHelper;

  @override
  void initState() {
    super.initState();
    _loadUserDataAndFavorite();

  }


  Future<void> _loadUserDataAndFavorite() async {
  _sharedPrefHelper = await SharedPrefHelper.getInstance();
  final email = _sharedPrefHelper.getUserEmail();
    if (email != null) {
      final user = await DatabaseHelper.instance.getCurrentUser(email);
      if (user != null) {
        userId = user.id;
        bool favoriteStatus = await DatabaseHelper.instance.isFavorite(userId!, widget.ebook.bookid);
        setState(() {
          isFavorite = favoriteStatus;
        });
      }
    }
  }

  Future<void> toggleFavorite() async {
    if (userId == null) return;
    setState(() {
      isFavorite = !isFavorite;
    });
    await DatabaseHelper.instance.setFavorite(userId!, widget.ebook.bookid, isFavorite);
    final loc = AppLocalizations.of(context)!;
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(isFavorite ? loc.addedToFavorites : loc.removedFromFavorites),
      ),
    );
  }

  Future<void> _updateLastRead() async {
    if (userId == null) return;
    final lastRead = LastRead(
      userId: userId!,
      bookId: widget.ebook.bookid,
      lastOpened: DateTime.now().toIso8601String(),
    );
    await DatabaseHelper.instance.updateLastOpened(lastRead);
  }

  Future<void> _checkSubscriptionAndProceed(Function onSuccess) async {
    _sharedPrefHelper = await SharedPrefHelper.getInstance();
    final email = _sharedPrefHelper.getUserEmail();
    if (email != null) {
      bool isSubscribed = await DatabaseHelper.instance.isUserSubscribed(email);
      if (isSubscribed) {
        onSuccess();
      } else {
        _showSubscriptionDialog();
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('User email not found. Please login again.')),
      );
    }
  }



  void _showSubscriptionDialog() {
    final loc = AppLocalizations.of(context)!;
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(loc.subscriptionRequired),
        content: Text(loc.subscribeToContinue),
        actions: [
          TextButton(onPressed: () => Navigator.pop(context), child: Text(loc.cancel)),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const SubscriptionPage()),
              );
            },
            child: Text(loc.subscribeNow),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context)!;
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppBar(
        title: Text(loc.bookDetails),
        actions: [
          IconButton(
            icon: Icon(
              isFavorite ? Icons.favorite : Icons.favorite_border,
              color: isFavorite ? Colors.red : Colors.white,
            ),
            onPressed: toggleFavorite,
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Hero(
                tag: 'cover_${widget.ebook.bookid}', // Must match the tag used in HomePage
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: Image.network(
                    widget.ebook.coverpage,
                    height: 250,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) =>
                    const Icon(Icons.broken_image, size: 150),
                  ),
                ),
              ),

            ),
            const SizedBox(height: 20),
            Chip(
              label: Text(widget.ebook.category, style: const TextStyle(color: Colors.white)),
              backgroundColor: Colors.blue,
            ),
            const SizedBox(height: 10),
            Text(
              widget.ebook.title,
              style: textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 5),
            Text(
              loc.byAuthor(widget.ebook.author),
              style: textTheme.titleMedium?.copyWith(color: isDark ? Colors.grey[400] : Colors.grey[700]),
            ),
            const SizedBox(height: 10),
            Text(
              '${widget.ebook.pagecount} ${loc.pageCount}',
              style: textTheme.bodyMedium?.copyWith(color: isDark ? Colors.grey[500] : Colors.grey[600]),
            ),
            const SizedBox(height: 20),
            Text(widget.ebook.description, style: textTheme.bodyLarge?.copyWith(height: 1.5)),
            const SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton.icon(
                  onPressed: () async {
                    _checkSubscriptionAndProceed((){
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text(loc.downloading)),
                      );
                    });
                    },
                  icon: const Icon(Icons.download),
                  label: Text(loc.download, style: const TextStyle(fontSize: 18)),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                  ),
                ),
                ElevatedButton.icon(
                  onPressed: () async {
                    await _updateLastRead(); // Save the last read info before opening the book
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => PdfViewerScreen(ebookurl: widget.ebook.ebookurl),
                      ),
                    );
                  },
                  icon: const Icon(Icons.menu_book),
                  label: Text(loc.readBook, style: const TextStyle(fontSize: 18)),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

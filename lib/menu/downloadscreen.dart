import 'package:e_book_reader/Database/DatabaseHelper.dart';
import 'package:e_book_reader/Database/Model/ebook.dart';
import 'package:e_book_reader/Home%20Screen/ebookdetails.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart'; // Import localization package

class DownloadPage extends StatefulWidget {
  const DownloadPage({Key? key}) : super(key: key);

  @override
  DownloadPageState createState() => DownloadPageState();
}

class DownloadPageState extends State<DownloadPage> {
  List<Map<String, dynamic>> downloadedBooks = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    loadDownloads();
  }

  Future<void> loadDownloads() async {
    setState(() => isLoading = true);
    final db = DatabaseHelper.instance;
    final allBooks = await db.getAllEbooks();
    setState(() {
      downloadedBooks = allBooks.where((book) => book['downloadUrl'] != null && book['downloadUrl'].isNotEmpty).toList();
      isLoading = false;
    });
  }

  Future<void> deleteDownload(int bookId) async {
    final db = DatabaseHelper.instance;
    await db.removeDownload(bookId);
    await loadDownloads(); // Refresh the download list
  }

  Future<bool?> confirmDelete(BuildContext context, int bookId, String title) async {
    final loc = AppLocalizations.of(context)!;
    return showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(loc.removeDownload),
        content: Text(loc.removeDownloadConfirmation(title)),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, false),
            child: Text(loc.cancel),
          ),
          TextButton(
            onPressed: () async {
              await deleteDownload(bookId);
              Navigator.pop(context, true);
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(loc.removedFromDownloads)),
              );
            },
            child: Text(loc.remove, style: const TextStyle(color: Colors.red)),
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
          icon: const Icon(Icons.download_done, color: Colors.green),
          onPressed: () => confirmDelete(context, book['bookid'], book['title'] ?? ''),
        ),
        onTap: () {
          final ebook = Ebook.fromMap(book);
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => EbookDetailPage(ebook: ebook),
            ),
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context)!;

    return Scaffold(
      appBar: AppBar(
        title: Text('Downloads' ),
      ),
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : downloadedBooks.isEmpty
          ? Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.download_for_offline, size: 64, color: Colors.grey),
            const SizedBox(height: 16),
            Text(loc.noDownloadedBooks),
            TextButton(
              onPressed: loadDownloads,
              child: Text(loc.refresh),
            ),
          ],
        ),
      )
          : ListView.separated(
        itemCount: downloadedBooks.length,
        separatorBuilder: (context, index) => const SizedBox(height: 8),
        padding: const EdgeInsets.all(16),
        itemBuilder: (context, index) {
          final book = downloadedBooks[index];
          return Dismissible(
            key: Key(book['bookid'].toString()),
            direction: DismissDirection.endToStart,
            background: Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              alignment: Alignment.centerRight,
              color: Colors.red,
              child: const Icon(Icons.delete, color: Colors.white, size: 30),
            ),
            confirmDismiss: (direction) => confirmDelete(context, book['bookid'], book['title'] ?? ''),
            child: _buildBookItem(context, book),
          );
        },
      ),
    );
  }
}

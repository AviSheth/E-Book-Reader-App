import 'package:e_book_reader/AdminPannel/add_update_screen.dart';
import 'package:e_book_reader/Database/DatabaseHelper.dart';
import 'package:e_book_reader/Database/Model/ebook.dart';
import 'package:flutter/material.dart';

class EbookManagePage extends StatefulWidget {
  @override
  _EbookManagePageState createState() => _EbookManagePageState();
}

class _EbookManagePageState extends State<EbookManagePage> {
  List<Ebook> _ebooks = [];
  bool _isLoaderVisible = false;

  @override
  void initState() {
    super.initState();
    getAllEbooks();
  }

  Future<void> getAllEbooks() async {
    setState(() {
      _isLoaderVisible = true;
    });

    final data = await DatabaseHelper.instance.getAllEbooks();
    setState(() {
      _ebooks = data.map((e) => Ebook.fromMap(e)).toList();
      _isLoaderVisible = false;
    });
  }

  void _navigateToForm({Ebook? ebook}) async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => EbookFormPage(ebook: ebook),
      ),
    );

    if (result == true) {
      // Refresh only if ebook was added/updated
      await getAllEbooks();
    }
  }

  Future<void> deleteEbook(int index) async {
    final ebook = _ebooks[index];

    // Show confirmation dialog before delete
    final confirm = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Delete Ebook'),
        content: const Text('Are you sure you want to delete this ebook?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, false),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () => Navigator.pop(context, true),
            child: const Text('Delete', style: TextStyle(color: Colors.red)),
          ),
        ],
      ),
    );

    if (confirm == true) {
      await DatabaseHelper.instance.deleteEbook(ebook.bookid);
      await getAllEbooks();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Ebook Manage Page')),
      body: _isLoaderVisible
          ? const Center(child: CircularProgressIndicator())
          : _ebooks.isEmpty
          ? const Center(child: Text('No ebooks added yet.'))
          : ListView.builder(
        itemCount: _ebooks.length,
        itemBuilder: (context, index) {
          final ebook = _ebooks[index];
          return Card(
              margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
          child: ListTile(
          leading: ebook.coverpage != null
          ? ClipRRect(
          borderRadius: BorderRadius.circular(4),
          child: Image.network(
          width: 80,
          height: 70,
          fit: BoxFit.cover,
          ebook.coverpage,
          errorBuilder: (context, error, stackTrace) =>
          Icon(Icons.book, size: 100),
          ),
          )
              : Icon(Icons.book, size: 100),
          title: Text(ebook.title),
          subtitle: Text(ebook.author),
          trailing: Row(
          mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  icon: const Icon(Icons.edit, color: Colors.blue),
                  onPressed: () => _navigateToForm(ebook: ebook),
                ),
                IconButton(
                  icon: const Icon(Icons.delete, color: Colors.red),
                  onPressed: () => deleteEbook(index),
                ),
              ],
            ),
          ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _navigateToForm(),
        child: const Icon(Icons.add),
      ),
    );
  }
}

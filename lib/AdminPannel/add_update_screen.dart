import 'package:e_book_reader/Database/DatabaseHelper.dart';
import 'package:flutter/material.dart';
import 'package:e_book_reader/Database/Model/ebook.dart';


class EbookFormPage extends StatefulWidget {
  final Ebook? ebook;

  const EbookFormPage({Key? key, this.ebook}) : super(key: key);

  @override
  _EbookFormPageState createState() => _EbookFormPageState();
}

class _EbookFormPageState extends State<EbookFormPage> {
  final _formKey = GlobalKey<FormState>();


  final TextEditingController _bookidController = TextEditingController();
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _authorController = TextEditingController();
  final TextEditingController _ebookurlController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _coverpageController = TextEditingController();
  final TextEditingController _downloadUrlController = TextEditingController();
  final TextEditingController _categoryController = TextEditingController();
  final TextEditingController _pagecountController = TextEditingController();
  final TextEditingController _languageController = TextEditingController();

  @override
  void initState() {
    super.initState();
    if (widget.ebook != null) {
      // Editing existing ebook
      _populateFields(widget.ebook!);
    } else {
      // Adding new ebook
    }
  }

  void _populateFields(Ebook ebook) {
    _bookidController.text = ebook.bookid.toString();
    _titleController.text = ebook.title;
    _authorController.text = ebook.author;
    _ebookurlController.text = ebook.ebookurl;
    _descriptionController.text = ebook.description!;
    _coverpageController.text = ebook.coverpage!;
    _downloadUrlController.text = ebook.downloadUrl!;
    _categoryController.text = ebook.category;
    _pagecountController.text = ebook.pagecount.toString();
    _languageController.text = ebook.language;

  }


  void _saveForm() async {
    if (_formKey.currentState!.validate()) {
      final ebook = Ebook(
        bookid : widget.ebook ?.bookid ?? 0,
        title: _titleController.text.trim(),
        author: _authorController.text.trim(),
        ebookurl: _ebookurlController.text.trim(),
        description: _descriptionController.text.trim(),
        coverpage: _coverpageController.text.trim(),
        downloadUrl: _downloadUrlController.text.trim(),
        category: _categoryController.text.split(',').map((c) => c.trim().toUpperCase()).join(','),
        language: _languageController.text.trim(),
        pagecount: int.tryParse(_pagecountController.text.trim()) ?? 0,
      );

      if (widget.ebook == null) {
        // ADD new ebook
        await DatabaseHelper.instance.insertEbook(ebook);
      } else {
        // UPDATE existing ebook
        await DatabaseHelper.instance.updateEbook(ebook);
      }
      if(mounted){
        Navigator.pop(context, true);
      }
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.ebook == null ? 'Add Ebook' : 'Edit Ebook'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              if (widget.ebook != null) ...[
                Text(
                  'Book ID: ${widget.ebook!.bookid}',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ],
              const SizedBox(height: 30),

              TextFormField(
                controller: _titleController,
                decoration: const InputDecoration(
                  labelText: 'Title',
                  border: OutlineInputBorder(),
                ),
                validator: (value) => null, // No validation error
                onSaved: (value) => value = value?.trim().isEmpty ?? true ? 'unknown' : value!,
              ),
              const SizedBox(height: 15),

              TextFormField(
                controller: _authorController,
                decoration: const InputDecoration(
                  labelText: 'Author',
                  border: OutlineInputBorder(),
                ),
                validator: (value) => null, // No validation error
                onSaved: (value) => value = value?.trim().isEmpty ?? true ? 'unknown' : value!,
              ),

              const SizedBox(height: 15),
              TextFormField(
                controller: _categoryController,
                decoration: const InputDecoration(
                  labelText: 'Category',
                  border: OutlineInputBorder(),
                ),
                validator: (value) => value!.isEmpty ? 'Category is required' : null,
              ),
              const SizedBox(height: 15),

              TextFormField(
                controller: _languageController,
                decoration: const InputDecoration(
                  labelText: 'Language',
                  border: OutlineInputBorder(),
                ),
                validator: (value) => value!.isEmpty ? 'Language is required' : null,
              ),
              const SizedBox(height: 15),

              TextFormField(
                controller: _descriptionController,
                decoration: const InputDecoration(
                  labelText: 'Description',
                  border: OutlineInputBorder(),
                ),
                maxLines: 3,
              ),
              const SizedBox(height: 15),

              TextFormField(
                controller: _ebookurlController,
                decoration: const InputDecoration(
                  labelText: 'Book URL',
                  border: OutlineInputBorder(),
                ),
                validator: (value) => value!.isEmpty ? 'URL is required' : null,
              ),
              const SizedBox(height: 15),


              TextFormField(
                controller: _coverpageController,
                decoration: const InputDecoration(
                  labelText: 'Cover Image URL',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 15),

              TextFormField(
                controller: _downloadUrlController,
                decoration: const InputDecoration(
                  labelText: 'Download URL',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 30),

              TextFormField(
                controller: _pagecountController,
                decoration: const InputDecoration(
                  labelText: 'Page Count',
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.number,
              ),
              const SizedBox(height: 30),



              ElevatedButton.icon(
                onPressed: _saveForm,
                icon: Icon(Icons.save),
                label: Text(widget.ebook == null ? 'Add Ebook' : 'Update Ebook'),
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

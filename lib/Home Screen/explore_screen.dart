import 'package:e_book_reader/Database/DatabaseHelper.dart';
import 'package:e_book_reader/Database/Model/ebook.dart';
import 'package:e_book_reader/Home%20Screen/ebookdetails.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ExploreScreen extends StatefulWidget {
  const ExploreScreen({super.key});

  @override
  _ExploreScreenState createState() => _ExploreScreenState();
}

class _ExploreScreenState extends State<ExploreScreen> {
  String _searchQuery = '';
  String _selectedCategory = 'All';
  String _selectedLanguage = 'All';
  List<Ebook> ebooks = [];
  List<String> categories = ['All'];
  List<String> languages = ['All'];
  late DatabaseHelper dbHelper;

  @override
  void initState() {
    super.initState();
    dbHelper = DatabaseHelper.instance;
    _loadPreferences();
    _fetchEbooks();
    _fetchFilters();
  }

  Future<void> _loadPreferences() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _selectedCategory = prefs.getString('selectedCategory') ?? 'All';
      _selectedLanguage = prefs.getString('selectedLanguage') ?? 'All';
    });
  }

  Future<void> _savePreferences() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString('selectedCategory', _selectedCategory);
    prefs.setString('selectedLanguage', _selectedLanguage);
  }

  void _resetFilters() async {
    setState(() {
      _selectedCategory = 'All';
      _selectedLanguage = 'All';
    });
    await _savePreferences();
    Navigator.pop(context);
  }

  Future<void> _fetchEbooks() async {
    List<Map<String, dynamic>> ebookMaps = await dbHelper.getAllEbooks();
    setState(() {
      ebooks = ebookMaps.map((ebookMap) => Ebook.fromMap(ebookMap)).toList();
    });
  }

  Future<void> _fetchFilters() async {
    List<String> dbCategories = await dbHelper.getAllCategories();
    List<String> dbLanguages = await dbHelper.getAllLanguages();

    setState(() {
      categories = ['All'] + dbCategories.toSet().toList();
      languages = ['All'] + dbLanguages.toSet().toList();
    });
  }

  void _showFilterSheet() {
    final loc = AppLocalizations.of(context)!;
    String tempCategory = _selectedCategory;
    String tempLanguage = _selectedLanguage;
    final theme = Theme.of(context);

    showModalBottomSheet(
      context: context,
      backgroundColor: theme.colorScheme.background,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        return Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                loc.filterOptions,
                style: theme.textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 12),
              DropdownButtonFormField<String>(
                value: tempCategory,
                decoration: InputDecoration(
                  labelText: loc.category,
                  filled: true,
                  fillColor: theme.colorScheme.surface,
                  border: OutlineInputBorder(),
                ),
                items: categories.map((cat) => DropdownMenuItem(
                  value: cat,
                  child: Text(cat),
                )).toList(),
                onChanged: (value) {
                  if (value != null) tempCategory = value;
                },
              ),
              SizedBox(height: 12),
              DropdownButtonFormField<String>(
                value: tempLanguage,
                decoration: InputDecoration(
                  labelText: loc.language,
                  filled: true,
                  fillColor: theme.colorScheme.surface,
                  border: OutlineInputBorder(),
                ),
                items: languages.map((lang) => DropdownMenuItem(
                  value: lang,
                  child: Text(lang),
                )).toList(),
                onChanged: (value) {
                  if (value != null) tempLanguage = value;
                },
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                    onPressed: _resetFilters,
                    child: Text(loc.resetFilters),
                  ),
                  ElevatedButton(
                    child: Text(loc.apply),
                    onPressed: () {
                      setState(() {
                        _selectedCategory = tempCategory;
                        _selectedLanguage = tempLanguage;
                      });
                      _savePreferences();
                      Navigator.pop(context);
                    },
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context)!;
    final theme = Theme.of(context);

    List<Ebook> filteredEbooks = ebooks.where((ebook) {
      final matchesSearch = ebook.title.toLowerCase().contains(_searchQuery);
      final matchesCategory = _selectedCategory == 'All' ||
          ebook.category.toLowerCase() == _selectedCategory.toLowerCase();
      final matchesLanguage = _selectedLanguage == 'All' ||
          ebook.language.toLowerCase() == _selectedLanguage.toLowerCase();
      return matchesSearch && matchesCategory && matchesLanguage;
    }).toList();

    return Scaffold(
      backgroundColor: theme.colorScheme.background,
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(8.0),
            child: TextField(
              decoration: InputDecoration(
                hintText: loc.searchEbooks,
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                filled: true,
                fillColor: theme.colorScheme.surface,
              ),
              style: theme.textTheme.bodyLarge,
              onChanged: (value) {
                setState(() {
                  _searchQuery = value.toLowerCase();
                });
              },
            ),
          ),
          Expanded(
            child: filteredEbooks.isEmpty
                ? Center(
              child: Text(
                loc.noEbooksFound,
                style: theme.textTheme.titleMedium,
              ),
            )
                : ListView.builder(
              itemCount: filteredEbooks.length,
              itemBuilder: (context, index) {
                final ebook = filteredEbooks[index];
                return Card(
                  color: theme.colorScheme.surface,
                  margin: EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                  child: ListTile(
                    leading: ebook.coverpage != null
                        ? ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Image.network(
                        ebook.coverpage,
                        width: 70,
                        height: 100,
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) =>
                            Icon(Icons.book, size: 50, color: theme.colorScheme.onSurface),
                      ),
                    )
                        : Icon(Icons.book, size: 50, color: theme.colorScheme.onSurface),
                    title: Text(
                      ebook.title,
                      style: theme.textTheme.titleMedium,
                    ),
                    subtitle: Text(
                      '${loc.author}: ${ebook.author}\n${loc.category}: ${ebook.category}, ${loc.page}: ${ebook.pagecount}',
                      style: theme.textTheme.bodySmall,
                    ),
                    isThreeLine: true,
                    onTap: () {
                      Navigator.push(
                        context,
                        PageRouteBuilder(
                          pageBuilder: (context, animation, secondaryAnimation) => EbookDetailPage(ebook: ebook),
                          transitionsBuilder: (context, animation, secondaryAnimation, child) {
                            const begin = Offset(1.0, 0.0);
                            const end = Offset.zero;
                            const curve = Curves.ease;

                            final tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
                            return SlideTransition(position: animation.drive(tween), child: child);
                          },
                          transitionDuration: const Duration(milliseconds: 400),
                        ),
                      );
                    },

                  ),
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _showFilterSheet,
        child: Icon(Icons.filter_list),
        tooltip: loc.filter,
      ),
    );
  }
}

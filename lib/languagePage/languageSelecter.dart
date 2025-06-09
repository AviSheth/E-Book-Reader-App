import 'package:e_book_reader/languagePage/languageService.dart';
import 'package:flutter/material.dart';


class LanguagePage extends StatefulWidget {
  @override
  _LanguagePageState createState() => _LanguagePageState();
}

class _LanguagePageState extends State<LanguagePage> {
  final LocalizationService _local = LocalizationService();
  String _selectedLanguageCode = 'en';

  @override
  void initState() {
    super.initState();
    _loadSavedLanguage();
  }

  void _loadSavedLanguage() async {
    await LocalizationService.loadLanguage();
    setState(() {
      _selectedLanguageCode = LocalizationService.locale.languageCode;
    });
  }

  void _changeLanguage(String languageCode) async {
    await LocalizationService.setLanguage(languageCode);
    setState(() {
      _selectedLanguageCode = languageCode;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Select language for the app')),
      body:Center(
          child: ListView(
            children: [
              _buildLanguageTile('English', 'en'),
              _buildLanguageTile('Hindi', 'hi'),
              _buildLanguageTile('Gujarati', 'gu'),
              _buildLanguageTile('Français', 'fr'),
            ],
          )
      ) ,
    );
  }

  Widget _buildLanguageTile(String language, String code) {
    return ListTile(
      title: Text(language),
      trailing: _selectedLanguageCode == code
          ? const Icon(Icons.check, color: Colors.green)
          : null,
      onTap: () => _changeLanguage(code),
    );
  }
}




import 'package:e_book_reader/languagePage/languageSelecter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeService {
  static const _key = 'isDarkMode';

  Future<bool> getTheme() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool(_key) ?? false;
  }

  Future<void> saveTheme(bool isDark) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_key, isDark);
  }

  ThemeMode getThemeModeFromBool(bool isDark) {
    return isDark ? ThemeMode.dark : ThemeMode.light;
  }
}

class SettingsScreen extends StatefulWidget {
  final Function(ThemeMode) changeTheme;
  const SettingsScreen({super.key, required this.changeTheme});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  final ThemeService _themeService = ThemeService();
  bool _isDarkMode = false;

  List<Map<String, dynamic>> items = [];

  @override
  void initState() {
    super.initState();

    _themeService.getTheme().then((value) {
      setState(() {
        _isDarkMode = value;
      });
    });

    items = [
      {
        'icon': FeatherIcons.globe,
        'title': 'Language',
        'function': () => _pushPage(LanguagePage()),
      },
      {
        'icon': FeatherIcons.info,
        'title': 'About',
        'function': () => showAbout(),
      },
      {
        'icon': FeatherIcons.fileText,
        'title': 'Open Source Licenses',
        'function': () => _pushPage(LicensePage()),
      },
    ];

    WidgetsBinding.instance.addPostFrameCallback((_) {
      showSettingsPopup(context);
    });
  }

  void showSettingsPopup(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: true,
      barrierColor: Colors.grey.withOpacity(0.5),
      builder: (context) {
        return WillPopScope(
          onWillPop: () async {
            Navigator.pop(context);
            Navigator.pop(context);
            return false;
          },
          child: Dialog(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            child: Container(
              width: MediaQuery.of(context).size.width * 0.8,
              padding: const EdgeInsets.all(20),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text('Settings', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 10),
                  ListView(
                    shrinkWrap: true,
                    children: [
                      SwitchListTile(
                        secondary: const Icon(FeatherIcons.moon),
                        title: const Text('Dark Mode'),
                        value: _isDarkMode,
                        onChanged: (value) async {
                          setState(() => _isDarkMode = value);
                          await _themeService.saveTheme(value);
                          widget.changeTheme(_themeService.getThemeModeFromBool(value));
                        },
                      ),
                      const Divider(),
                      ...items.map((item) => Column(
                        children: [
                          ListTile(
                            onTap: item['function'] != null ? () => item['function']!() : null,
                            leading: Icon(item['icon']),
                            title: Text(item['title']),
                          ),
                          const Divider(),
                        ],
                      )),
                    ],
                  ),
                  const SizedBox(height: 10),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                      Navigator.pop(context);
                    },
                    child: const Text("Close"),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Future<void> _pushPage(Widget page) async {
    Navigator.push(context, MaterialPageRoute(builder: (context) => page));
  }

  Future<void> showAbout() async {
    showDialog(
      context: context,
      builder: (_) {
        return AlertDialog(
          title: const Text('About'),
          content: const Text('E-Book Reader is a modern and lightweight app built with Flutter, '
              'designed to give you a smooth and distraction-free reading experience.'
              '📚 Key Features:'
              '- Read ePub and PDF files'
              '- Dark mode support'
              '- Bookmark and resume where you left off'
              '- Simple and elegant interface'
              'Whether you’re reading for fun or learning, '
              'E-Book Reader aims to be your go-to app for all your digital books.'),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              style: TextButton.styleFrom(
                  foregroundColor: Colors.blueAccent),
              child: const Text('Close '),
            ),

          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return const SizedBox.shrink();
  }
}

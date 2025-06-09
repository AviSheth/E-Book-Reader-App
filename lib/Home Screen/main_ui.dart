import 'dart:io';
import 'package:e_book_reader/Database/DatabaseHelper.dart';
import 'package:e_book_reader/Database/sharedPrefeHelper.dart';
import 'package:e_book_reader/Home%20Screen/favorites_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:e_book_reader/Home%20Screen/explore_screen.dart';
import 'package:e_book_reader/Home%20Screen/home.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';
import 'package:e_book_reader/Firebase_Services/firebase_auth.dart';



class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key });

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  File? _profileImage;
  String? _username;

  late SharedPrefHelper _sharedPrefHelper;
  final ImagePicker _picker= ImagePicker();
  final authService = Authserices();

  final List<Widget> _screen = <Widget>[
    HomePage(),
    ExploreScreen(),
    FavoritePage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void _logout(BuildContext context) async {
    final prefs = await SharedPrefHelper.getInstance();
    await prefs.clearLoginData();

    try {
      // Sign out from Google
      await GoogleSignIn().signOut();

      // Sign out from Firebase
      await FirebaseAuth.instance.signOut();
    } catch (e) {
      print('Error during logout: $e');
    }

    // Navigate to login screen
    Navigator.pushNamedAndRemoveUntil(context, '/LoginPage', (route) => false);
  }

  Future<void> _loadUserName() async {
    _sharedPrefHelper = await SharedPrefHelper.getInstance();
    final email = _sharedPrefHelper.getUserEmail(); // assuming email is saved
    final dbHelper = DatabaseHelper.instance;
    final user = await dbHelper.getCurrentUser(email ?? '');

    if (mounted && user != null) {
      setState(() {
        _username = user.name;
      });
    }
  }


  void _confirmLogout(BuildContext context) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Logout'),
        content: const Text('Are you sure you want to logout?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () async {
              Navigator.pushReplacementNamed(context, '/LoginPage');
              _logout(context);
            },

            child: const Text(
              'Logout',
              style: TextStyle(color: Colors.red),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _pickImage() async {
    final pickedFile = await _picker .pickImage(source: ImageSource.gallery);
    if(pickedFile!= null){
      final directory = await getApplicationDocumentsDirectory();
      final name = basename(pickedFile.path);
      final savedImage = await File(pickedFile.path).copy('${directory.path}/$name');
      setState(() {
        _profileImage = savedImage;
      });
    }
  }

@override
  void initState(){
    super.initState();
    _loadUserName();
}
  @override
Widget build(BuildContext context) {
  final localizations = AppLocalizations.of(context)!;

  return Scaffold(
    appBar: AppBar(
      title: Text('E-Book Reader' ), // "E-Book Reader"
      backgroundColor: Theme.of(context).primaryColorDark
    ),
    drawer: _buildDrawer(context, localizations),
    body: _screen[_selectedIndex],
    bottomNavigationBar: BottomNavigationBar(
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: const Icon(Icons.home),
          label: localizations.home, // "Home"
        ),
        BottomNavigationBarItem(
          icon: const Icon(Icons.explore_rounded),
          label: localizations.explore, // "Explore"
        ),
        BottomNavigationBarItem(
          icon: const Icon(Icons.favorite),
          label: localizations.favoriteBooks
        ),
      ],
      currentIndex: _selectedIndex,
      selectedItemColor: Theme.of(context).primaryColor,
      onTap: _onItemTapped,
    ),
  );
}

Widget _buildDrawer(BuildContext context, AppLocalizations localizations) {
  return Drawer(
    child: ListView(
      padding: EdgeInsets.zero,
      children: [
        DrawerHeader(
          decoration: BoxDecoration(color: Theme.of(context).primaryColor),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: _pickImage,
                  child: Stack(
                    children: [
                      CircleAvatar(
                        radius: 50,
                        backgroundImage: _profileImage != null
                            ? FileImage(_profileImage!)
                            : const AssetImage('assets/images/Sample_User_Icon.png') as ImageProvider,
                      ),
                      Positioned(
                        bottom: 0,
                        right: 0,
                        child: CircleAvatar(
                          radius: 14,
                          backgroundColor: Colors.white,
                          child: Icon(
                            Icons.camera_alt,
                            size: 16,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Text(_username ??'', style: const TextStyle(fontSize: 16, color: Colors.white), )
              ],
            )
        ),

        ListTile(
          leading: const Icon(Icons.person),
          title: Text(localizations.profile),
          onTap: () {
            Navigator.pop(context);
            Navigator.pushNamed(context, '/profile');
          },
        ),
        ListTile(
          leading: const Icon(Icons.download),
          title: Text(localizations.download),
          onTap: () {
            Navigator.pop(context);
            Navigator.pushNamed(context, '/download');
          },
        ),
        ListTile(
          leading: const Icon(Icons.settings),
          title: Text(localizations.settings),
          onTap: () {
            Navigator.pop(context);
            Navigator.pushNamed(context, '/settings');
          },
        ),
        ListTile(
          leading: const Icon(Icons.payment),
          title: Text(localizations.subscriptionPlans),
          onTap: () {
            Navigator.pop(context);
            Navigator.pushNamed(context, '/subscription');
          },
        ),
        ListTile(
          leading: const Icon(Icons.lock_reset),
          title: Text(localizations.resetPassword),
          onTap: () {
            Navigator.pop(context);
            Navigator.pushNamed(context, '/ForgotPassword');
          },
        ),
        ListTile(
          leading: const Icon(Icons.logout, color: Colors.red),
          title: Text(
            localizations.logout,
            style: const TextStyle(color: Colors.red),
          ),
          onTap: () =>_confirmLogout(context),
        ),
        const Divider(),
        ListTile(
          leading: const Icon(Icons.close),
          title: Text(localizations.close),
          onTap: () => Navigator.pop(context),
        ),
      ],
    ),
  );
}
}

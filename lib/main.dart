import 'package:e_book_reader/AdminPannel/admin_screen.dart';
import 'package:e_book_reader/AdminPannel/ebookmanage.dart';
import 'package:e_book_reader/AdminPannel/userlist.dart';
import 'package:e_book_reader/Authentication/ForgotPassword.dart';
import 'package:e_book_reader/Authentication/signup_Screen.dart';
import 'package:e_book_reader/Database/Model/userDB.dart';
import 'package:e_book_reader/Home Screen/main_ui.dart';
import 'package:e_book_reader/Home%20Screen/favorites_screen.dart';
import 'package:e_book_reader/Splash%20screen/appIntro.dart';
import 'package:e_book_reader/languagePage/languageService.dart';
import 'package:e_book_reader/menu/Settings/setting.dart';
import 'package:e_book_reader/menu/downloadscreen.dart';
import 'package:e_book_reader/menu/profilepage/profile_screen.dart';
import 'package:e_book_reader/menu/subscription/subscription_plan.dart';
import 'package:firebase_auth/firebase_auth.dart' as firebaseauth;
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'Authentication/LoginScreen.dart';
import 'Splash screen/Splash_screen.dart';
import 'Database/DatabaseHelper.dart';
import 'menu/Settings/license.dart';
import 'package:e_book_reader/Firebase_Services/firebase_messaging.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

final GlobalKey<NavigatorState> navKey = GlobalKey<NavigatorState>();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPreferences.getInstance();
  final dbHelper = DatabaseHelper.instance;
  await dbHelper.getDB();
  await LocalizationService.loadLanguage();

  await Firebase.initializeApp();
  setupFCM();

  String languageCode = LocalizationService.locale.languageCode;
  runApp(EBookReaderApp());
}
class EBookReaderApp extends StatefulWidget {
  const EBookReaderApp({super.key});

  @override
  State<EBookReaderApp> createState() => _EBookState();
}

class _EBookState extends State<EBookReaderApp> {
// _razorpay = Razorpay();
  ThemeMode _themeMode = ThemeMode.system;

  final ThemeData _lightTheme = ThemeData(
    brightness: Brightness.light,
    primaryColor: Colors.blue,
    colorScheme: ColorScheme.light(
      primary: Colors.blue,
      secondary: Colors.blueAccent,
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.blue,
      foregroundColor: Colors.white,
    ),
  );

  final ThemeData _darkTheme = ThemeData(
    brightness: Brightness.dark,
    primaryColor: Colors.indigo,
    colorScheme: ColorScheme.dark(
      primary: Colors.indigo,
      secondary: Colors.indigoAccent,
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.indigo,
    ),
  );


  void changeTheme(ThemeMode themeMode) {
    setState(() {
      _themeMode = themeMode;
    });
  }

  @override
  Widget build(BuildContext context) => MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: _lightTheme,
    darkTheme: _darkTheme,
    themeMode: _themeMode,

   locale: LocalizationService.locale,
    supportedLocales: LocalizationService.supportedLocales,
    navigatorKey: navKey,

    localizationsDelegates: [
      AppLocalizations.delegate,        // <-- This one comes from your generated file
      GlobalMaterialLocalizations.delegate,
      GlobalWidgetsLocalizations.delegate,
      GlobalCupertinoLocalizations.delegate,
    ],

    home:firebaseauth.FirebaseAuth.instance.currentUser !=null ? HomeScreen() : SplashScreen(),
    routes: <String, WidgetBuilder>{
      '/introscreen': (context) => IntroScreen(),
      '/signpage': (context)=> SignUpPage(),
      '/LoginPage': (context) => LoginPage(),
      '/ForgotPassword': (context) =>  ForgotPasswordPage(),
     '/home': (context) =>  HomeScreen(),
      '/userdata': (context) =>  UserList(),
      '/admin': (context) =>  DashboardScreen(changeTheme: changeTheme),
      '/settings': (context) => SettingsScreen(changeTheme: changeTheme),
      '/licence': (context) =>  licence(),
    '/profile': (context) =>  ProfileScreen(userDB:User(name: '', email: '', password: '', contact: 0)),
      '/subscription': (context) => SubscriptionPage(),
      '/manageEbook': (context) => EbookManagePage(),
      '/favorite' :(context)=> FavoritePage(),
      '/download' :(context) => DownloadPage()
    },
  );
}

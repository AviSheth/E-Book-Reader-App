import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefHelper {
  static SharedPrefHelper? _instance;
  static late SharedPreferences _prefs;

  SharedPrefHelper._internal();

  static Future<SharedPrefHelper> getInstance() async {
    if (_instance == null) {
      _instance = SharedPrefHelper._internal();
      _prefs = await SharedPreferences.getInstance();
    }
    return _instance!;
  }

  static const String _keyUserEmail = 'UserEmail';
  static const String _keyIsLoggedIn = 'isLoggedIn';


  Future<void> saveUserEmail(String email) async {
    await _prefs.setString(_keyUserEmail, email);
  }

  String? getUserEmail() {
    return _prefs.getString(_keyUserEmail);
  }

  Future<void> setIsLoggedIn(bool value) async {
    await _prefs.setBool('isLoggedIn', value);
  }

  bool getIsLoggedIn() {
    return _prefs.getBool('isLoggedIn') ?? false;
  }

  Future<void> setLoggedInUserId(int userId) async {
    await _prefs.setInt('LoggedInUserId', userId);
  }

  int? getLoggedInUserId() {
    return _prefs.getInt('LoggedInUserId');
  }

 Future<String?> IsSubscribedEmail(String Email) async{
  return _prefs.getString('email');
  }

  Future<void> saveFavoriteBooks(List<int> favoriteBookIds) async {
    List<String> favoriteStrings = favoriteBookIds.map((id) => id.toString()).toList();

    await _prefs.setStringList('favoriteBooks', favoriteStrings);
  }

  Future<List<int>> loadFavoriteBooks() async {
    List<String>? favoriteStrings = _prefs.getStringList('favoriteBooks');
    if (favoriteStrings == null) {
      return []; // No favorites saved
    }
    return favoriteStrings.map((id) => int.parse(id)).toList();
  }

  Future<void> addFavoriteBook(int bookId) async {
    List<int> currentFavorites = await loadFavoriteBooks();
    if (!currentFavorites.contains(bookId)) {
      currentFavorites.add(bookId);
      await saveFavoriteBooks(currentFavorites);
    }
  }

  Future<void> removeFavoriteBook(int bookId) async {
    List<int> currentFavorites = await loadFavoriteBooks();
    currentFavorites.remove(bookId);
    await saveFavoriteBooks(currentFavorites);
  }

  Future<void> clearLoginData() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_keyIsLoggedIn);
    await prefs.remove(_keyUserEmail);
    await prefs.remove('LoggedInUserId');
    await prefs.remove('favoriteBooks');

  }

}

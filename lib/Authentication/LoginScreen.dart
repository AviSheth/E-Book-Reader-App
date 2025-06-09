import 'package:e_book_reader/Database/sharedPrefeHelper.dart';
import 'package:e_book_reader/Firebase_Services/firebase_auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import '../Database/DatabaseHelper.dart';

class LoginPage extends StatefulWidget {
  final DatabaseHelper dbHelper = DatabaseHelper.instance;
  final authService = Authserices();

  @override
  _LoginPage createState() => _LoginPage();
}

class _LoginPage extends State<LoginPage> {
  static const String adminEmail = "admin";
  static const String adminPassword = "admin";

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool _isLoading = false;
  bool _obscurePassword = true;
  late SharedPrefHelper _sharedPrefHelper;

  Future<void> _login() async {
    final email = emailController.text.trim();
    final password = passwordController.text.trim();

    if (email.isEmpty || password.isEmpty) {
      _showSnackBar("Please enter both email and password");
      return;
    }

    setState(() => _isLoading = true);

    try {
      _sharedPrefHelper = await SharedPrefHelper.getInstance();
      // Admin login
      if (email == adminEmail && password == adminPassword) {
        await _sharedPrefHelper.setIsLoggedIn(true);
        await _sharedPrefHelper.saveUserEmail(email);
        if (mounted) Navigator.pushReplacementNamed(context, '/admin');
        return;
      }

      final user = await widget.dbHelper.loginUser(email, password);
      if (user != null && user['password'] == password) {
        await _saveLoginState(userId: user['id'], email: email);
        if (mounted) Navigator.pushReplacementNamed(context, '/home');
      } else {
        _showSnackBar("Invalid email or password");
      }
    } catch (e) {
      _showSnackBar("Login error: ${e.toString()}");
    } finally {
      if (mounted) setState(() => _isLoading = false);
    }
  }


  Future<void> _saveLoginState({required int userId, required String email}) async {
    await _sharedPrefHelper.setLoggedInUserId(userId);
    await _sharedPrefHelper.saveUserEmail(email);
    await _sharedPrefHelper.setIsLoggedIn(true);
  }

  void _showSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message)),
    );
  }

  @override
  Widget build(BuildContext context) {
    final authService = Authserices();
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/loginscreen.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.85),
                  borderRadius: BorderRadius.circular(30),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black26,
                      blurRadius: 10,
                      offset: Offset(0, 5),
                    )
                  ],
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Text(
                      "Login",
                      style: TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue,
                      ),
                    ),
                    const SizedBox(height: 30),
                    TextField(
                      controller: emailController,
                      decoration: InputDecoration(
                        labelText: "Email",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        filled: true,
                        fillColor: Colors.white,
                      ),
                      keyboardType: TextInputType.emailAddress,
                    ),
                    const SizedBox(height: 20),
                    TextField(
                      controller: passwordController,
                      obscureText: _obscurePassword,
                      decoration: InputDecoration(
                        labelText: "Password",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        filled: true,
                        fillColor: Colors.white,
                        suffixIcon: IconButton(
                          icon: Icon(
                            _obscurePassword
                                ? Icons.visibility
                                : Icons.visibility_off,
                          ),
                          onPressed: () => setState(
                                  () => _obscurePassword = !_obscurePassword),
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Align(
                      alignment: Alignment.centerRight,
                      child: TextButton(
                        onPressed: () =>
                            Navigator.pushNamed(context, '/ForgotPassword'),
                        child: const Text(
                          "Forgot Password?",
                          style: TextStyle(fontSize: 16, color: Colors.blue),
                        ),
                      ),
                    ),

                    const SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: _isLoading ? null : _login,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue,
                        minimumSize: const Size(double.infinity, 50),
                        textStyle: const TextStyle(fontSize: 20),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      child: _isLoading
                          ? const SizedBox(
                        width: 24,
                        height: 24,
                        child: CircularProgressIndicator(
                          color: Colors.white,
                          strokeWidth: 2,
                        ),
                      )
                          : const Text(
                        "Login",
                        style: TextStyle(
                            color: Colors.white, fontSize: 22),
                      ),
                    ),
                    const SizedBox(height: 20),

                    SizedBox(height: 10),
                    Text("Or sign up with", style: TextStyle(fontSize: 16)),

                    SizedBox(height: 10),
                    IconButton(
                      icon: Image.asset(
                        'assets/logo/google-logo.png',
                        height: 24,
                        width: 24,
                      ),
                      onPressed: () => authService.signInWithGoogle(context),
                    ),

                    RichText(
                      text: TextSpan(
                        children: [
                          const TextSpan(
                           text:  "Don't have an account?",
                            style: TextStyle(fontSize: 16, color: Colors.black),
                          ),
                          TextSpan(
                         text:    "Sign Up",
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                           Navigator.pushNamed(context, '/signpage');
                              },
                            style: const TextStyle(fontSize: 18, color: Colors.blue),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

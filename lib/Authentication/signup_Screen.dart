import 'package:e_book_reader/Database/databasehelper.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:e_book_reader/Database/sharedPrefeHelper.dart';
import 'package:e_book_reader/Firebase_Services/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class SignUpPage extends StatefulWidget {
  final String check;

  const SignUpPage({super.key, this.check = ""});

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final _formKey = GlobalKey<FormState>();
  final authService = Authserices();


  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _contactController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();


  Future<void> _registerUser() async {
    if (_formKey.currentState!.validate()) {

      var db = DatabaseHelper.instance;
      var result = await db.registerUser(
        name: _nameController.text,
        contact: int.parse(_contactController.text),
        email: _emailController.text,
        password: _passwordController.text,
      );

      print('Result: $result');

      if (result != null) {
        final prefs = await SharedPrefHelper.getInstance();
        await prefs.saveUserEmail(_emailController.text);
        await prefs.setIsLoggedIn(true);
        await prefs.setLoggedInUserId(result);

      try {
        await FirebaseFirestore.instance.collection('user').doc(_emailController.text).set({
          'name': _nameController.text,
          'email': _emailController.text,
          'contact': int.parse(_contactController.text),
          'password' : _passwordController.text,
          'createdAt': FieldValue.serverTimestamp(),

        });
        print("User data added to Firestore");
      } catch (e) {
        print("Failed to add user to Firestore: $e");
      }
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text('Success'),
          content: Text('Account created successfully!'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context); // Close dialog
                Navigator.pushReplacementNamed(context, '/home'); // Go to login page
              },
              child: Text('OK'),
            ),
          ],
        ),
      );

      // Optionally clear form fields
      _nameController.clear();
      _contactController.clear();
      _emailController.clear();
      _passwordController.clear();
    } else {
      // Handle failure
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Registration failed!')),
      );
      }
    }
  }

  /*Future<void> _registerUser() async {
    if (_formKey.currentState!.validate()) {
      try {
        await FirebaseFirestore.instance.collection('user').doc(_emailController.text).set({
          'name': _nameController.text,
          'email': _emailController.text,
          'contact': int.parse(_contactController.text),
          'password': _passwordController.text,
          'createdAt': FieldValue.serverTimestamp(),
        });

        print("User data added to Firestore");

        // Show success dialog
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text('Success'),
            content: Text('Account created successfully!'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context); // Close dialog
                  Navigator.pushReplacementNamed(context, '/home'); // Go to home/login screen
                },
                child: Text('OK'),
              ),
            ],
          ),
        );

        // Clear form fields
        _nameController.clear();
        _contactController.clear();
        _emailController.clear();
        _passwordController.clear();

      } catch (e) {
        print("Failed to add user to Firestore: $e");

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Registration failed. Please try again.')),
        );
      }
    }
  }

*/
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    
    return Scaffold(

      backgroundColor: Colors.blueGrey[200],
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          child: Form(
            key: _formKey,
            child: Container(
              width: size.width > 600 ? 500 : double.infinity,
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 20,
                    spreadRadius: 5,
                    offset: Offset(0, 10),
                  ),
                ],
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    "Create Account",
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: Colors.blueAccent,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    "Sign up to get started!",
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.grey[700],
                    ),
                  ),
                  const SizedBox(height: 30),
                  _buildTextField(
                    controller: _nameController,
                    label: "Full Name",
                    icon: Icons.person,
                    validator: (value) {
                      if (value!.isEmpty) return 'Please enter your full name';
                      if (value.length > 40) return 'Name cannot exceed 40 characters';
                      return null;
                    },
                  ),
                  const SizedBox(height: 20),
                  _buildTextField(
                    controller: _contactController,
                    label: "Contact",
                    icon: Icons.phone,
                    keyboardType: TextInputType.phone,
                    validator: (value) {
                      if (value!.length != 10) return 'Please enter a valid contact number';
                      if (value!.isEmpty) return 'Please enter your contact number';
                      return null;
                    },
                  ),
                  const SizedBox(height: 20),
                  _buildTextField(
                    controller: _emailController,
                    label: "Email",
                    icon: Icons.email,
                    keyboardType: TextInputType.emailAddress,
                    validator: (value) {
                      if (value!.isEmpty) return 'Please enter your email';
                      if (!RegExp(r"^[a-zA-Z0-9._%+-]+@[a-zA-Z.-]+\.[a-zA-Z]{2,}$")
                          .hasMatch(value)) {
                        return 'Enter a valid email';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 20),
                  _buildTextField(
                    controller: _passwordController,
                    label: "Password",
                    icon: Icons.lock,
                    obscureText: true,
                    validator: (value) {
                      if (value!.length < 6) return 'Password must be at least 6 characters';
                      return null;
                    },
                  ),
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

                  SizedBox(height: 30),
                  const SizedBox(height: 30),
                  ElevatedButton(
                    onPressed: _registerUser,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blueAccent,
                      minimumSize: Size(double.infinity, 50),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      elevation: 8,
                    ),
                    child: Text(
                      'Sign Up',
                      style: TextStyle(fontSize: 20, color: Colors.white),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Already have an account?", style: TextStyle(fontSize: 16)),
                      TextButton(
                        onPressed: () {
                          Navigator.pushNamed(context, '/LoginPage');
                        },
                        child: Text(
                          "Login",
                          style: TextStyle(fontSize: 18, color: Colors.blueAccent),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                 TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/admin');
                    },
                    child: Text(
                      'Admin Dashboard',
                      style: TextStyle(fontSize: 18, color: Colors.redAccent),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }


  Widget _buildTextField({
    required TextEditingController controller,
    required String label,
    required IconData icon,
    TextInputType keyboardType = TextInputType.text,
    bool obscureText = false,
    String? Function(String?)? validator,
  }) {
    return TextFormField(
      controller: controller,
      keyboardType: keyboardType,
      obscureText: obscureText,
      validator: validator,
      decoration: InputDecoration(
        prefixIcon: Icon(icon, color: Colors.blueAccent),
        labelText: label,
        filled: true,
        fillColor: Colors.blueGrey[50],
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
        ),
      ),
    );
  }
}

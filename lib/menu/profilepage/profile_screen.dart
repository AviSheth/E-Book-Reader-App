import 'package:e_book_reader/Database/DatabaseHelper.dart';
import 'package:e_book_reader/Database/Model/userDB.dart';
import 'package:e_book_reader/Database/sharedPrefeHelper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';


class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key, required this.userDB}) : super(key: key);
  final User userDB;

  @override
  _ProfileUpdatePageState createState() => _ProfileUpdatePageState();
}

class _ProfileUpdatePageState extends State<ProfileScreen> {
  final _formKey = GlobalKey<FormState>();
   late DatabaseHelper _dbHelper;
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();

  bool _isLoading = true;
  bool _isUpdating = false;
  User? _currentUser;
  late SharedPrefHelper _sharedPrefHelper;

  @override
  void initState() {
    super.initState();
    _initialize();
  }

  Future<void> _initialize() async {
    _dbHelper = DatabaseHelper.instance;
    _sharedPrefHelper = await SharedPrefHelper.getInstance();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      _loadUserData();
    });
  }


  Future<void> _loadUserData() async {
    try {
      final String? userEmail = _sharedPrefHelper.getUserEmail();

      if (userEmail == null || userEmail.isEmpty) {
        throw Exception("No user email found in SharedPreferences");
      }

      final user = await _dbHelper.getCurrentUser(userEmail);

      if (user == null) {
        throw Exception("User not found in database");
      }

      setState(() {
        _currentUser = user;
        _emailController.text = user.email;
        _nameController.text = user.name;
        _phoneController.text = user.contact.toString();
        _isLoading = false;
      });
    } catch (e) {
      if (mounted) {
        setState(() => _isLoading = false);
        _showSnackBar('Error loading user data: ${e.toString()}');
      }
    }
    }

  Future<void> _updateProfile() async {
    if (!_formKey.currentState!.validate() || _isUpdating) {
      return;
    }

    setState(() => _isUpdating = true);

    try {
      final updatedUser = User(
        id: _currentUser?.id,
        name: _nameController.text.trim(),
        email: _emailController.text.trim(),
        contact: int.tryParse(_phoneController.text.trim()) ?? 0,
        password: _currentUser?.password ?? '', // Preserve existing password
      );

      final rowsAffected = await _dbHelper.updateUser(updatedUser);

      if (mounted) {
        if (rowsAffected > 0) {
          // Update email in SharedPreferences if it was changed
          if (_emailController.text.trim() != _currentUser?.email) {
            await _sharedPrefHelper.saveUserEmail( _emailController.text.trim());
          }

          _showSnackBar(AppLocalizations.of(context)!.profileUpdated);
          setState(() => _currentUser = updatedUser);
        } else {
          _showSnackBar(AppLocalizations.of(context)!.noChangesMade);
        }
        setState(() => _isUpdating = false);
      }
    } catch (e) {
      if (mounted) {
        _showSnackBar('${AppLocalizations.of(context)!.errorUpdatingProfile}: ${e.toString()}');
        setState(() => _isUpdating = false);
      }
    }
  }

  void _showSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message)),
    );
  }

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context)!;

    return Scaffold(
      appBar: AppBar(
        title: Text(loc.updateProfile),
        centerTitle: true,
        backgroundColor: Colors.deepPurple,
      ),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Form(
          key: _formKey,
          child: Card(
            elevation: 8,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const SizedBox(height: 10),
                  _buildDisabledField(
                    initialValue: _emailController.text,
                    label: loc.email,
                    icon: Icons.email,
                  ),
                  const SizedBox(height: 20),
                  _buildTextField(
                    controller: _nameController,
                    label: loc.fullName,
                    icon: Icons.person,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return loc.enterName;
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 20),
                  _buildTextField(
                    controller: _phoneController,
                    label: loc.phoneNumber,
                    icon: Icons.phone,
                    keyboardType: TextInputType.phone,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return loc.enterPhoneNumber;
                      }
                      if (!RegExp(r'^\d{10,15}$').hasMatch(value)) {
                        return loc.validPhoneNumber;
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 30),
                  SizedBox(
                    height: 50,
                    child: ElevatedButton(
                      onPressed: _isUpdating ? null : _updateProfile,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.deepPurple,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: _isUpdating
                          ? const CircularProgressIndicator(color: Colors.white)
                          : Text(
                        loc.updateProfileButton,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
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
    String? Function(String?)? validator,
    TextInputType keyboardType = TextInputType.text,
  }) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        labelText: label,
        prefixIcon: Icon(icon),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
      ),
      keyboardType: keyboardType,
      validator: validator,
    );
  }

  Widget _buildDisabledField({
    required String initialValue,
    required String label,
    required IconData icon,
  }) {
    return TextFormField(
      initialValue: initialValue,
      decoration: InputDecoration(
        labelText: label,
        prefixIcon: Icon(icon),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
      ),
      enabled: false,
    );
  }

  @override
  void dispose() {
    _emailController.dispose();
    _nameController.dispose();
    _phoneController.dispose();
    super.dispose();
  }
}
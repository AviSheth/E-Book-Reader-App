import 'package:e_book_reader/AdminPannel/userlist.dart';
import 'package:e_book_reader/AdminPannel/ebookmanage.dart';
import 'package:e_book_reader/Database/sharedPrefeHelper.dart';
import 'package:e_book_reader/menu/Settings/setting.dart';
import 'package:flutter/material.dart';

class DashboardScreen extends StatelessWidget {
  final Function(ThemeMode) changeTheme;

  const DashboardScreen({super.key, required this.changeTheme});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Admin Dashboard'),
        backgroundColor: Colors.indigo,
      ),
      body: Column(
        children: [
          Expanded(
            child: GridView.count(
              padding: const EdgeInsets.all(20),
              crossAxisCount: 2,
              crossAxisSpacing: 15,
              mainAxisSpacing: 15,
              children: [
                _buildMenuItem(
                  context,
                  icon: Icons.book,
                  label: 'Manage Ebooks',
                  color: Colors.blue,
                  page: EbookManagePage(),
                ),
                _buildMenuItem(
                  context,
                  icon: Icons.people,
                  label: 'User List',
                  color: Colors.green,
                  page: UserList(),
                ),
                _buildMenuItem(
                  context,
                  icon: Icons.analytics,
                  label: 'Statistics',
                  color: Colors.orange,
                  page: null,
                ),
                _buildMenuItem(
                  context,
                  icon: Icons.settings,
                  label: 'Settings',
                  color: Colors.purple,
                  page: SettingsScreen(changeTheme: changeTheme),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                icon: const Icon(Icons.logout, color: Colors.white,),
                label: const Text('Logout', style: TextStyle(color: Colors.white),),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  textStyle: const TextStyle(fontSize: 18),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                onPressed: () {
                  Navigator.pushNamed(context, '/LoginPage');
                }
              ),
            ),
          ),
        ],
      ),
    );
  }


  Widget _buildMenuItem(BuildContext context, {
    required IconData icon,
    required String label,
    required Color color,
    Widget? page,
  }) {
    return Card(
      child: InkWell(
        onTap: page != null ? () {
          Navigator.push(context, MaterialPageRoute(builder: (_) => page));
        } : null,
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(icon, size: 40, color: color),
              const SizedBox(height: 10),
              Text(label, style: const TextStyle(fontSize: 16)),
            ],
          ),
        ),
      ),
    );
  }
}
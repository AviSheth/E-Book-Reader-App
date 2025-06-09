import 'package:e_book_reader/Database/DatabaseHelper.dart';
import 'package:flutter/material.dart';
import 'package:e_book_reader/Database/Model/userDB.dart';



class UserList extends StatefulWidget {
  @override
  _UserListState createState() => _UserListState();
}

class _UserListState extends State<UserList> {
  List<User> users = [];
 late DatabaseHelper dbHelper;

  @override
  void initState() {
    super.initState();
    dbHelper = DatabaseHelper.instance;
    _fetchUsers();
  }

  Future<void> _fetchUsers() async {
    List<Map<String, dynamic>> userMaps = await dbHelper.fetchUserData();
    setState(() {
      users = userMaps.map((userMap) => User.fromMap(userMap)).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('User List'),
        actions: [
          IconButton(icon: Icon(Icons.refresh), onPressed: _fetchUsers),
        ],
      ),
      body:
      users.isNotEmpty
          ? ListView.builder(
        itemCount: users.length,
        itemBuilder: (context, index) {
          final user = users[index];
          return ListTile(
            title: Text(user.name),
            subtitle: Column(
              children: [
                Text("Email: ${user.email}"),
                Text("Password: ${user.password}"),
                Text("Contact: ${user.contact}"),
              ],
            ),
            trailing: IconButton(
              icon: Icon(Icons.delete),
              onPressed: () async {
                bool? confirmed = await showDialog<bool>(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: Text('Confirm Delete'),
                    content: Text('Are you sure you want to delete this user?'),
                    actions: [
                      TextButton(
                        onPressed: () => Navigator.pop(context, false),
                        child: Text('Cancel'),
                      ),
                      TextButton(
                        onPressed: () => Navigator.pop(context, true),
                        child: Text('Delete', style: TextStyle(color: Colors.red)),
                      ),
                    ],
                  ),
                );

                if (confirmed == true) {
                  await dbHelper.deleteUser(user.id!);
                  _fetchUsers(); // Refresh list after deletion
                }
              },
            ),

          );
        },
      )
          : Center(child: Text("No users found")),

    );
  }
}

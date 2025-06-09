class User {
  final int? id;
  final String name;
  final String email;
  late final String password;
  final int contact;


  User({
    this.id,
    required this.name,
    required this.email,
    required this.password,
    required this.contact,
  });

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      id: map['id'],
      name: map['name'],
      email: map['email'] ?? '',
      password: map['password'] ?? '',
      contact: map['contact'] ?? 0,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'password': password,
      'contact': contact,
    };
  }

  Map<String, dynamic> toUpdateMap() {
    return {
      'name': name,
      'password': password,
      'contact': contact,
    };
  }
}

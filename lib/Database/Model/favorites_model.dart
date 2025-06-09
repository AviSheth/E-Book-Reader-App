class Favorite {
  final int? id;
  final int userid;
  final int bookid;

  Favorite({
    this.id,
    required this.userid,
    required this.bookid,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'userId': userid,
      'bookId': bookid,
    };
  }

  // Create a Favorite object from a map
  factory Favorite.fromMap(Map<String, dynamic> map) {
    return Favorite(
      id: map['id'],
      userid: map['userId'],
      bookid: map['bookId'],
    );
  }
}

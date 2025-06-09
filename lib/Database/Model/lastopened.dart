class LastRead {
  final int? id;           // Optional for new inserts
  final int userId;        // References user(id)
  final int bookId;        // References ebook(bookid)
  final String lastOpened; // ISO-formatted datetime string

  LastRead({
    this.id,
    required this.userId,
    required this.bookId,
    required this.lastOpened,
  });

  // Convert LastRead to Map
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'userId': userId,
      'bookId': bookId,
      'lastOpened': lastOpened,
    };
  }

  // Construct LastRead from Map
  factory LastRead.fromMap(Map<String, dynamic> map) {
    return LastRead(
      id: map['id'],
      userId: map['userId'],
      bookId: map['bookId'],
      lastOpened: map['lastOpened'],
    );
  }
}

import 'dart:convert';

class Ebook {
  final int bookid;
  final String title;
  final String author;
  final String category;
  final String description;
  final String ebookurl;
  final String coverpage;
  final String? downloadUrl;
  final int pagecount;
  final String language;


  Ebook({
    required this.bookid,
    required this.title,
    required this.author,
    required this.category,
    required this.description,
    required this.ebookurl,
    required this.coverpage,
    this.downloadUrl,
    required this.pagecount,
    required this.language,

  });

  Map<String, dynamic> toMapInsert() {
    return {
      'title': title,
      'author': author,
      'category': category,
      'description': description,
      'ebookurl': ebookurl,
      'coverpage': coverpage,
      'downloadUrl': downloadUrl,
      'pagecount': pagecount,
      'language': language,
    };
  }
  Map<String, dynamic> toMapUpdate() {
    return {
      'bookid': bookid,
      'title': title,
      'author': author,
      'category': category,
      'description': description,
      'ebookurl': ebookurl,
      'coverpage': coverpage,
      'downloadUrl': downloadUrl,
      'pagecount': pagecount,
      'language': language,
    };
  }
  Map<String, dynamic> toMap() {
    return {

      'title': title,
      'author': author,
      'ebookurl': ebookurl,
      'description': description,
      'coverpage': coverpage,
      'downloadUrl': downloadUrl,
      'category': category,
      'pagecount': pagecount,
      'language': language,

    };
  }

  factory Ebook.fromMap(Map<String, dynamic> map) {
    return Ebook(
      bookid: map['bookid'],
      title: map['title'],
      author: map['author'],
      category: map['category'],
      description: map['description'],
      ebookurl: map['ebookurl'],
      coverpage: map['coverpage'],
      downloadUrl: map['downloadUrl'],
      pagecount: map['pagecount'],
      language: map['language'],
    );
  }
}

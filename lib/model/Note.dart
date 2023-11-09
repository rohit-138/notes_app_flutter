class Note {
  final String id;
  final String title;
  final String description;
  // final String createdAt;
  final String? updatedAt;

  Note(
      {required this.id,
      required this.title,
      required this.description,
      // required this.createdAt,
      required this.updatedAt});

  factory Note.fromJson(Map<String, dynamic> json) {
    return Note(
        id: json['_id'],
        title: json['title'],
        description: json['description'],
        // createdAt: json['createdAt'],
        updatedAt: json['updatedAt']);
  }
}

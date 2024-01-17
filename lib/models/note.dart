class Note {
  const Note(
    this.title,
    this.content,
    this.createdAt,
    this.modifiedAt,
  );

  final String title;
  final String content;
  final DateTime createdAt;
  final DateTime modifiedAt;
}

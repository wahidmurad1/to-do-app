class Note {
  String titleText;
  String noteText;
  Note({required this.titleText, required this.noteText});
  Map<String, dynamic> toJson() {
    return {
      'title': titleText,
      'note': noteText,
    };
  }

  factory Note.fromJson(Map<String, dynamic> json) {
    return Note(
      titleText: json['titleText'],
      noteText: json['noteText'],
    );
  }
}

class Note {
  String? titleText;
  String? noteText;
  String? startDate;
  String? endDate;
  String? startTime;
  String? endTime;

  Note({
    required this.titleText,
    required this.noteText,
    required this.startDate,
    required this.endDate,
    required this.startTime,
    required this.endTime,
  });
  Map<String, dynamic> toJson() {
    return {
      'title': titleText,
      'note': noteText,
      'startDate': startDate,
      'endDate': endDate,
      'startTime': startTime,
      'endTime': endTime,
    };
  }

  factory Note.fromJson(Map<String, dynamic> json) {
    return Note(
      titleText: json['titleText'] ?? '',
      noteText: json['noteText'] ?? '',
      startDate: json['startDate'] ?? '',
      endDate: json['endDate'] ?? '',
      startTime: json['startTime'] ?? '',
      endTime: json['endTime'] ?? '',
    );
  }
}

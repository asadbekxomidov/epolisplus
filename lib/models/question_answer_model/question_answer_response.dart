class QuestionAnswerResponse {
  final String title;
  final String summary;

  QuestionAnswerResponse({required this.title, required this.summary});

  factory QuestionAnswerResponse.fromJson(Map<String, dynamic> json) {
    return QuestionAnswerResponse(
      title: json['title'],
      summary: json['summary'],
    );
  }
}

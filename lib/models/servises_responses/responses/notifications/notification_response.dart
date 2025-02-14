class NotificationResponse {
  int id;
  String? title;
  String? summary;
  String? description;
  String? created_at;
  String? image;
  bool? is_read;
  int type;

  NotificationResponse({
    this.id = 0,
    this.title = "",
    this.summary = "",
    this.image = "",
    this.description = "",
    this.created_at = "",
    this.is_read = false,
    this.type = 0,
  });

  factory NotificationResponse.fromJson(Map<String, dynamic> json) {
    return NotificationResponse(
      id: json['id'],
      title: json['title'],
      image: json['image'],
      summary: json['summary'],
      description: json['description'],
      created_at: json['created_at'],
      is_read: json['is_read'],
      type: json['type'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['summary'] = summary;
    data['image'] = image;
    data['description'] = description;
    data['created_at'] = created_at;
    data['is_read'] = is_read;
    return data;
  }
}

class TodoResponse {
  TodoResponse({
    required this.id,
    this.title,
    this.description,
    this.status,
    this.createdAt,
    this.updatedAt,
  });

  int id;
  String? title;
  String? description;
  String? status;
  DateTime? createdAt;
  DateTime? updatedAt;

  factory TodoResponse.fromJson(Map<String, dynamic> json) => TodoResponse(
      id: json["id"] ?? "n/a",
      title: json["title"] ?? "n/a",
      description: json["description"] ?? "n/a",
      status: json["status"] ?? "n/a",
      createdAt: json["createdAt"] != null
          ? DateTime.parse(json["created_at"])
          : DateTime.now(),
      updatedAt: json["updatedAt"] != null
          ? DateTime.parse(json["updated_at"])
          : DateTime.now());

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "description": description,
        "status": status,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
      };
}

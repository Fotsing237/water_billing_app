class RolesModel {
  final String id;
  final String title;
  final String description;

  RolesModel({required this.id, required this.title, required this.description});

  factory RolesModel.fromJson(Map<String, dynamic> json) {
    return RolesModel(
      id: json['id'],
      title: json['title'],
      description: json['description'],
    );
  }

  Map<String, dynamic> toJson() => {
    "id" : id,
    "title" : title,
    "description" : description,
  };
}

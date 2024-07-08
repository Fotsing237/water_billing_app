class UsersModel {
  String? id;
  String? name;
  String? email;
  String? phone;
  String? idCardNumber;
  String? password;
  DateTime? createdAt;
  String? rolesId;

  UsersModel({
     this.id,
     this.name,
     this.email,
     this.phone,
     this.idCardNumber,
     this.password,
     this.createdAt,
     this.rolesId,
  });

  factory UsersModel.fromJson(Map<String, dynamic> json) {
    return UsersModel(
      id: json["id"],
      name: json["name"],
      email: json["email"],
      phone: json["phone"],
      idCardNumber: json["id_card_number"],
      password: json["password"],
      createdAt: json["created_at"],
      rolesId: json["roles_id"],
    );
  }

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "email": email,
    "phone": phone,
    "id_card_number": idCardNumber,
    "password": password,
    "created_at": createdAt,
    "roles_id": rolesId,
  };
}

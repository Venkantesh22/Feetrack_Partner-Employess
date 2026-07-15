
class EmployeesModel {
    final String? id;
    final String? name;
    final String? email;
    final dynamic profileImageUrl;

    EmployeesModel({
        this.id,
        this.name,
        this.email,
        this.profileImageUrl,
    });

    factory EmployeesModel.fromJson(Map<String, dynamic> json) => EmployeesModel(
        id: json["id"],
        name: json["name"],
        email: json["email"],
        profileImageUrl: json["profile_image_url"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "email": email,
        "profile_image_url": profileImageUrl,
    };
}

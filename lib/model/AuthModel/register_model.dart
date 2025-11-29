class RegisterModel {
  final String name;
  final String nationalId;
  final String contact;
  final String password;
  final String roleId;

  RegisterModel({
    required this.name,
    required this.nationalId,
    required this.contact,
    required this.password,
    this.roleId = '7', // ثابت حسب المثال
  });

  Map<String, dynamic> toJson() {
    return {
      "name": name,
      "national_id": nationalId,
      "identifier": contact,
      "password": password,
      "role_id": roleId,
    };
  }
}

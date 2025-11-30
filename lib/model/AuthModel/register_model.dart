// class RegisterModel {
//   final String name;
//   final String nationalId;
//   final String contact;
//   final String password;
//   final int roleId;

//   RegisterModel({
//     required this.name,
//     required this.nationalId,
//     required this.contact,
//     required this.password,
//     required this.roleId , // ثابت حسب المثال
//   });

//   Map<String, dynamic> toJson() {
//     return {
//       "name": name,
//       "national_id": nationalId,
//       "identifier": contact,
//       "password": password,
//       "role_id": roleId,
//     };
//   }
// }
// register_model.dart
class RegisterModel {
  final String name;
  final String nationalId;
  final String contact;
  final String password;
  final int roleId;

  RegisterModel({
    required this.name,
    required this.nationalId,
    required this.contact,
    required this.password,
    required this.roleId,
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

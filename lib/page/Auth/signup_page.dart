

// // lib/page/auth/register_page.dart
// import 'package:complaints_application/core/color.dart';
// import 'package:complaints_application/core/widget/app_button.dart';
// import 'package:complaints_application/core/widget/app_textfield.dart';
// import 'package:flutter/material.dart';

// class SignUpPage extends StatefulWidget {
//   const SignUpPage({Key? key}) : super(key: key);

//   @override
//   State<SignUpPage> createState() => _SignUpPageState();
// }

// class _SignUpPageState extends State<SignUpPage> {
//   final _formKey = GlobalKey<FormState>();

//   final TextEditingController _nameController = TextEditingController();
//   final TextEditingController _idController = TextEditingController();
//   final TextEditingController _contactController = TextEditingController();
//   final TextEditingController _passwordController = TextEditingController();
//   final TextEditingController _confirmPasswordController = TextEditingController();

//   bool _obscurePassword = true;
//   bool _obscureConfirm = true;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: AppColors.background,
//       appBar: AppBar(
//         backgroundColor: AppColors.background,
//         elevation: 0,
//         title: const Text("إنشاء حساب"),
//         centerTitle: true,
//       ),
//       body: SafeArea(
//         child: SingleChildScrollView(
//           padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
//           child: Form(
//             key: _formKey,
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.center,
//               children: [

//                 const SizedBox(height: 30),

//                 // الاسم
//                 AppTextField(
//                   labelText: "الاسم",
//                   hintText: "أدخل الاسم الكامل",
//                   controller: _nameController,
//                   myIcon: const Icon(Icons.person,),
//                   validator: (value) {
//                     if (value == null || value.isEmpty) return "الرجاء إدخال الاسم";
//                     return null;
//                   },
//                 ),
//                 const SizedBox(height: 16),

//                 // الرقم الوطني
//                 AppTextField(
//                   labelText: "الرقم الوطني",
//                   hintText: "أدخل الرقم الوطني",
//                   controller: _idController,
//                   myIcon: const Icon(Icons.badge,),
//                   validator: (value) {
//                     if (value == null || value.isEmpty) return "الرجاء إدخال الرقم الوطني";
//                     return null;
//                   },
//                 ),
//                 const SizedBox(height: 16),

//                 // البريد أو الهاتف
//                 AppTextField(
//                   labelText: "البريد الإلكتروني أو الهاتف",
//                   hintText: "أدخل البريد الإلكتروني أو رقم الهاتف",
//                   controller: _contactController,
//                   myIcon: const Icon(Icons.contact_mail),
//                   validator: (value) {
//                     if (value == null || value.isEmpty) return "الرجاء إدخال البريد الإلكتروني أو الهاتف";
//                     // تحقق من البريد الإلكتروني فقط
//                     if (RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w]{2,4}$').hasMatch(value)) return null;
//                     // يمكن اضافة تحقق من رقم الهاتف لاحقاً
//                     return null;
//                   },
//                 ),
//                 const SizedBox(height: 16),

//                 // كلمة المرور
//                 AppTextField(
//                   labelText: "كلمة المرور",
//                   hintText: "أدخل كلمة المرور",
//                   controller: _passwordController,
//                   obscureText: _obscurePassword,
//                   myIcon: const Icon(Icons.lock,),
//                   traillingIcon: IconButton(
//                     icon: Icon(
//                       _obscurePassword ? Icons.visibility_off : Icons.visibility,
                     
//                     ),
//                     onPressed: () {
//                       setState(() => _obscurePassword = !_obscurePassword);
//                     },
//                   ),
//                   validator: (value) {
//                     if (value == null || value.isEmpty) return "الرجاء إدخال كلمة المرور";
//                     if (value.length < 6) return "يجب أن تكون كلمة المرور 6 أحرف على الأقل";
//                     return null;
//                   },
//                 ),
//                 const SizedBox(height: 16),

//                 // تأكيد كلمة المرور
//                 AppTextField(
//                   labelText: "تأكيد كلمة المرور",
//                   hintText: "أعد إدخال كلمة المرور",
//                   controller: _confirmPasswordController,
//                   obscureText: _obscureConfirm,
//                   myIcon: const Icon(Icons.lock, ),
//                   traillingIcon: IconButton(
//                     icon: Icon(
//                       _obscureConfirm ? Icons.visibility_off : Icons.visibility,
//                       // color: AppColors.primary,
//                     ),
//                     onPressed: () {
//                       setState(() => _obscureConfirm = !_obscureConfirm);
//                     },
//                   ),
//                   validator: (value) {
//                     if (value == null || value.isEmpty) return "الرجاء تأكيد كلمة المرور";
//                     if (value != _passwordController.text) return "كلمة المرور غير متطابقة";
//                     return null;
//                   },
//                 ),
//                 const SizedBox(height: 30),

//                 AppButton(
//                   text: "إنشاء الحساب",
//                   onTap: () {
//                     if (_formKey.currentState!.validate()) {
//                       print("تم التحقق من الحقول، إنشاء الحساب...");
//                     }
//                   },
//                   width: double.infinity,
//                   height: 50,
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }


// import 'package:complaints_application/model/AuthModel/register_model.dart';
// import 'package:complaints_application/page/Auth/otp_page.dart';
// import 'package:complaints_application/service/AuthService/register_service.dart';
// import 'package:flutter/material.dart';
// import '../../core/color.dart';
// import '../../core/widget/app_textfield.dart';
// import '../../core/widget/app_button.dart';

// class SignUpPage extends StatefulWidget {
//   const SignUpPage({Key? key}) : super(key: key);

//   @override
//   State<SignUpPage> createState() => _SignUpPageState();
// }

// class _SignUpPageState extends State<SignUpPage> {
//   final _formKey = GlobalKey<FormState>();

//   final _nameController = TextEditingController();
//   final _idController = TextEditingController();
//   final _contactController = TextEditingController();
//   final _passwordController = TextEditingController();
//   final _confirmController = TextEditingController();

//   bool _obscurePassword = true;
//   bool _obscureConfirm = true;
//   bool _isLoading = false;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: AppColors.background,
//       appBar: AppBar(
//         backgroundColor: AppColors.background,
//         elevation: 0,
//         title: const Text("إنشاء حساب"),
//         centerTitle: true,
//       ),
//       body: SafeArea(
//         child: SingleChildScrollView(
//           padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
//           child: Form(
//             key: _formKey,
//             child: Column(
//               children: [
//                 const SizedBox(height: 30),

//                 AppTextField(
//                   labelText: "الاسم",
//                   hintText: "أدخل الاسم الكامل",
//                   controller: _nameController,
//                   myIcon: const Icon(Icons.person),
//                   validator: (value) {
//                     if (value == null || value.isEmpty) return "الرجاء إدخال الاسم";
//                     return null;
//                   },
//                 ),
//                 const SizedBox(height: 16),

//                 AppTextField(
//                   labelText: "الرقم الوطني",
//                   hintText: "أدخل الرقم الوطني",
//                   controller: _idController,
//                   myIcon: const Icon(Icons.badge),
//                   validator: (value) {
//                     if (value == null || value.isEmpty) return "الرجاء إدخال الرقم الوطني";
//                     if (value.length < 11) return "يجب أن يكون الرقم 11 رقم على الأقل";
//                     return null;
//                   },
//                 ),
//                 const SizedBox(height: 16),

//                 AppTextField(
//                   labelText: "البريد الإلكتروني أو الهاتف",
//                   hintText: "أدخل البريد أو الهاتف",
//                   controller: _contactController,
//                   myIcon: const Icon(Icons.contact_mail),
//                   validator: (value) {
//                     if (value == null || value.isEmpty) return "الرجاء إدخال البريد أو الهاتف";
//                     if (value.startsWith("963")) return null; // رقم الهاتف
//                     if (RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w]{2,4}$').hasMatch(value)) return null; // البريد
//                     return "يرجى إدخال بريد أو رقم صحيح يبدأ بـ 963";
//                   },
//                 ),
//                 const SizedBox(height: 16),

//                 AppTextField(
//                   labelText: "كلمة المرور",
//                   hintText: "أدخل كلمة المرور",
//                   controller: _passwordController,
//                   obscureText: _obscurePassword,
//                   myIcon: const Icon(Icons.lock),
//                   traillingIcon: IconButton(
//                     icon: Icon(_obscurePassword ? Icons.visibility_off : Icons.visibility),
//                     onPressed: () => setState(() => _obscurePassword = !_obscurePassword),
//                   ),
//                   validator: (value) {
//                     if (value == null || value.isEmpty) return "الرجاء إدخال كلمة المرور";
//                     if (value.length < 6) return "كلمة المرور يجب أن تكون 6 أحرف على الأقل";
//                     return null;
//                   },
//                 ),
//                 const SizedBox(height: 16),

//                 AppTextField(
//                   labelText: "تأكيد كلمة المرور",
//                   hintText: "أعد إدخال كلمة المرور",
//                   controller: _confirmController,
//                   obscureText: _obscureConfirm,
//                   myIcon: const Icon(Icons.lock),
//                   traillingIcon: IconButton(
//                     icon: Icon(_obscureConfirm ? Icons.visibility_off : Icons.visibility),
//                     onPressed: () => setState(() => _obscureConfirm = !_obscureConfirm),
//                   ),
//                   validator: (value) {
//                     if (value == null || value.isEmpty) return "الرجاء تأكيد كلمة المرور";
//                     if (value != _passwordController.text) return "كلمة المرور غير متطابقة";
//                     return null;
//                   },
//                 ),
//                 const SizedBox(height: 30),

//                 _isLoading
//                     ? const CircularProgressIndicator()
//                     : AppButton(
//                         text: "إنشاء الحساب",
//                         onTap: () async {
//                           if (_formKey.currentState!.validate()) {
//                             setState(() => _isLoading = true);

//                             final user = RegisterModel(
//                               name: _nameController.text,
//                               nationalId: _idController.text,
//                               contact: _contactController.text,
//                               password: _passwordController.text,
//                             );

//                             final success = await RegisterService.register(user);
//                             if (success) {
//                               final otpSent = await RegisterService.sendOtp(user.contact);
//                               if (otpSent) {
//                                 Navigator.pushReplacement(
//                                   context,
//                                   MaterialPageRoute(
//                                     builder: (context) => OtpPage(contact: user.contact),
//                                   ),
//                                 );
//                               }
//                             }

//                             setState(() => _isLoading = false);
//                           }
//                         },
//                         width: double.infinity,
//                         height: 50,
//                       ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }



import 'package:complaints_application/model/AuthModel/register_model.dart';
import 'package:complaints_application/page/Auth/otp_page.dart';
import 'package:complaints_application/service/AuthService/register_service.dart';
import 'package:flutter/material.dart';
import '../../core/color.dart';
import '../../core/widget/app_textfield.dart';
import '../../core/widget/app_button.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final _formKey = GlobalKey<FormState>();

  final _nameController = TextEditingController();
  final _idController = TextEditingController();
  final _contactController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmController = TextEditingController();

  bool _obscurePassword = true;
  bool _obscureConfirm = true;
  bool _isLoading = false;

  String roleId = '7'; // ممكن تغييره حسب السيناريو

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.background,
        elevation: 0,
        title: const Text("إنشاء حساب"),
        centerTitle: true,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                const SizedBox(height: 30),
                AppTextField(
                  labelText: "الاسم",
                  hintText: "أدخل الاسم الكامل",
                  controller: _nameController,
                  myIcon: const Icon(Icons.person),
                  validator: (value) {
                    if (value == null || value.isEmpty) return "الرجاء إدخال الاسم";
                    return null;
                  },
                ),
                const SizedBox(height: 16),
                AppTextField(
                  labelText: "الرقم الوطني",
                  hintText: "أدخل الرقم الوطني",
                  controller: _idController,
                  myIcon: const Icon(Icons.badge),
                  validator: (value) {
                    if (value == null || value.isEmpty) return "الرجاء إدخال الرقم الوطني";
                    if (value.length < 11) return "يجب أن يكون الرقم 11 رقم على الأقل";
                    return null;
                  },
                ),
                const SizedBox(height: 16),
                AppTextField(
                  labelText: "البريد الإلكتروني أو الهاتف",
                  hintText: "أدخل البريد أو الهاتف",
                  controller: _contactController,
                  myIcon: const Icon(Icons.contact_mail),
                  validator: (value) {
                    if (value == null || value.isEmpty) return "الرجاء إدخال البريد أو الهاتف";
                    if (value.startsWith("963")) return null; // رقم الهاتف
                    if (RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w]{2,4}$').hasMatch(value)) return null; // البريد
                    return "يرجى إدخال بريد أو رقم صحيح يبدأ بـ 963";
                  },
                ),
                const SizedBox(height: 16),
                AppTextField(
                  labelText: "كلمة المرور",
                  hintText: "أدخل كلمة المرور",
                  controller: _passwordController,
                  obscureText: _obscurePassword,
                  myIcon: const Icon(Icons.lock),
                  traillingIcon: IconButton(
                    icon: Icon(_obscurePassword ? Icons.visibility_off : Icons.visibility),
                    onPressed: () => setState(() => _obscurePassword = !_obscurePassword),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) return "الرجاء إدخال كلمة المرور";
                    if (value.length < 6) return "كلمة المرور يجب أن تكون 6 أحرف على الأقل";
                    return null;
                  },
                ),
                const SizedBox(height: 16),
                AppTextField(
                  labelText: "تأكيد كلمة المرور",
                  hintText: "أعد إدخال كلمة المرور",
                  controller: _confirmController,
                  obscureText: _obscureConfirm,
                  myIcon: const Icon(Icons.lock),
                  traillingIcon: IconButton(
                    icon: Icon(_obscureConfirm ? Icons.visibility_off : Icons.visibility),
                    onPressed: () => setState(() => _obscureConfirm = !_obscureConfirm),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) return "الرجاء تأكيد كلمة المرور";
                    if (value != _passwordController.text) return "كلمة المرور غير متطابقة";
                    return null;
                  },
                ),
                const SizedBox(height: 30),
                _isLoading
                    ? const CircularProgressIndicator()
                    : AppButton(
                        text: "إنشاء الحساب",
                        onTap: () async {
                          if (_formKey.currentState!.validate()) {
                            setState(() => _isLoading = true);

                            final success = await RegisterService.register(
                              name: _nameController.text,
                              nationalId: _idController.text,
                              contact: _contactController.text,
                              password: _passwordController.text,
                              roleId: roleId,
                            );

                            if (success) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text("تم إنشاء الحساب بنجاح ✅"),
                                  backgroundColor: Colors.green,
                                ),
                              );

                              // مثال: الانتقال لصفحة OTP
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => OtpPage(contact: _contactController.text),
                                ),
                              );
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text("فشل التسجيل ❌ حاول مرة أخرى"),
                                  backgroundColor: Colors.red,
                                ),
                              );
                            }

                            setState(() => _isLoading = false);
                          }
                        },
                        width: double.infinity,
                        height: 50,
                      ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

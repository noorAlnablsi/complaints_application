// // lib/page/auth/login_page.dart
// import 'package:complaints_application/core/color.dart';
// import 'package:complaints_application/core/widget/app_button.dart';
// import 'package:complaints_application/core/widget/app_textfield.dart';
// import 'package:flutter/material.dart';

// class LoginPage extends StatefulWidget {
//   const LoginPage({Key? key}) : super(key: key);

//   @override
//   State<LoginPage> createState() => _LoginPageState();
// }

// class _LoginPageState extends State<LoginPage> {
//   final _formKey = GlobalKey<FormState>();
//   final TextEditingController _contactController = TextEditingController();
//   final TextEditingController _passwordController = TextEditingController();
//   bool _obscurePassword = true;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: AppColors.background,
//       appBar: AppBar(
//         backgroundColor: AppColors.background,
//         elevation: 0,
//        // iconTheme: IconThemeData(color: AppColors.primary),
//         title: const Text("تسجيل الدخول"),
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
//                 const SizedBox(height: 40),

//                 // البريد الإلكتروني أو الهاتف
//                 AppTextField(
//                   labelText: "البريد الإلكتروني أو الهاتف",
//                   hintText: "أدخل البريد الإلكتروني أو رقم الهاتف",
//                   controller: _contactController,
//                   validator: (value) {
//                     if (value == null || value.isEmpty) {
//                       return "الرجاء إدخال البريد الإلكتروني أو الهاتف";
//                     }
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
//                   suffixIcon: IconButton(
//                     icon: Icon(
//                       _obscurePassword ? Icons.visibility_off : Icons.visibility,
//                       color: AppColors.primary,
//                     ),
//                     onPressed: () {
//                       setState(() {
//                         _obscurePassword = !_obscurePassword;
//                       });
//                     },
//                   ),
//                   validator: (value) {
//                     if (value == null || value.isEmpty) {
//                       return "الرجاء إدخال كلمة المرور";
//                     } else if (value.length < 6) {
//                       return "يجب أن تكون كلمة المرور 6 أحرف على الأقل";
//                     }
//                     return null;
//                   },
//                 ),
//                 const SizedBox(height: 30),

//                 // زر تسجيل الدخول
//                 AppButton(
//                   text: "تسجيل الدخول",
//                   onTap: () {
//                     if (_formKey.currentState!.validate()) {
//                       // هنا يمكن إضافة عملية تسجيل الدخول عبر API
//                       print("تم التحقق من الحقول، تسجيل الدخول...");
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



// lib/page/auth/login_page.dart
import 'package:complaints_application/core/color.dart';
import 'package:complaints_application/core/widget/app_button.dart';
import 'package:complaints_application/core/widget/app_textfield.dart';
import 'package:complaints_application/model/AuthModel/login_model.dart';
import 'package:complaints_application/page/Auth/homepage.dart';
import 'package:complaints_application/service/AuthService/login_service.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController contactController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool _obscurePassword = true;
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.background,
        elevation: 0,
        title: const Text("تسجيل الدخول"),
        centerTitle: true,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 40),

                // البريد أو الهاتف
                AppTextField(
                  labelText: "البريد الإلكتروني أو الهاتف",
                  hintText: "أدخل البريد الإلكتروني أو رقم الهاتف",
                  controller: contactController,
                  myIcon: const Icon(Icons.contact_mail, color: AppColors.primary),
                  validator: (value) {
                    if (value == null || value.isEmpty) return "الرجاء إدخال البريد الإلكتروني أو الهاتف";
                    return null;
                  },
                ),
                const SizedBox(height: 16),

                // كلمة المرور
                AppTextField(
                  labelText: "كلمة المرور",
                  hintText: "أدخل كلمة المرور",
                  controller: passwordController,
                  obscureText: _obscurePassword,
                  myIcon: const Icon(Icons.lock, color: AppColors.primary),
                  traillingIcon: IconButton(
                    icon: Icon(
                      _obscurePassword ? Icons.visibility_off : Icons.visibility,
                      color: AppColors.primary,
                    ),
                    onPressed: () {
                      setState(() => _obscurePassword = !_obscurePassword);
                    },
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) return "الرجاء إدخال كلمة المرور";
                    if (value.length < 6) return "يجب أن تكون كلمة المرور 6 أحرف على الأقل";
                    return null;
                  },
                ),
                const SizedBox(height: 30),

                // AppButton(
                //   text: "تسجيل الدخول",
                //   onTap: () {
                //     if (_formKey.currentState!.validate()) {
                //       print("تم التحقق من الحقول، تسجيل الدخول...");
                //     }
                //   },
                //   width: double.infinity,
                //   height: 50,
                // ),
                AppButton(
  text: "تسجيل الدخول",
  onTap: () async {
    if (_formKey.currentState!.validate()) {
      setState(() => isLoading = true);

      final loginModel = LoginModel(
        identifier: contactController.text,
        password: passwordController.text,
      );

      final success = await AuthService().login(loginInfo: loginModel);

      setState(() => isLoading = false);

      if (success) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('تم تسجيل الدخول بنجاح')),
        );
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => Homepage ()), // صفحة بعد تسجيل الدخول
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('فشل تسجيل الدخول، تحقق من البريد أو كلمة المرور')),
        );
      }
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

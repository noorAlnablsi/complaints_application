// lib/page/auth/welcome_page.dart
import 'package:complaints_application/core/color.dart';
import 'package:complaints_application/core/widget/app_button.dart';
import 'package:complaints_application/page/Auth/login_page.dart';
import 'package:complaints_application/page/Auth/signup_page.dart';
import 'package:flutter/material.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
  
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // صورة في الأعلى
                Image.asset(
                  'assets/Isolation_Mode.png',
                  width: 180,
                  height: 250,
                  fit: BoxFit.contain,
                ),
                const SizedBox(height: 25),

                // النص الرئيسي
                Text(
                  "خدمة المواطن",
                  style: TextStyle(
                    fontSize: 25,
                   // fontWeight: FontWeight.bold,
                    color: AppColors.textPrimary,
                  ),
                ),
                const SizedBox(height: 40),

                // زر إنشاء حساب
                AppButton(
                  text: "إنشاء حساب",
                  onTap: () {
                    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const SignUpPage()),
    );
                  
                    // هنا ممكن تضيفي التنقل لصفحة التسجيل
                   // print("اضغطت إنشاء حساب");
                  },
                  width: double.infinity, 
                  height: 50,
                ),
                const SizedBox(height: 16),

                // زر تسجيل الدخول
                AppButton(
                  text: "تسجيل الدخول",
                  onTap: () {
                    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const LoginPage()),
    );
                    // هنا ممكن تضيفي التنقل لصفحة التسجيل
                   // print("اضغطت إنشاء حساب");
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

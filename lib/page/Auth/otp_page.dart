import 'package:complaints_application/page/Auth/signup_page.dart';
import 'package:flutter/material.dart';
import '../../core/color.dart';
import '../../core/widget/app_textfield.dart';
import '../../core/widget/app_button.dart';

class OtpPage extends StatefulWidget {
  final String contact;

  const OtpPage({Key? key, required this.contact}) : super(key: key);

  @override
  State<OtpPage> createState() => _OtpPageState();
}

class _OtpPageState extends State<OtpPage> {
  final TextEditingController _otpController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 100),
              Text("أدخل رمز التحقق المرسل إلى ${widget.contact}"),
              const SizedBox(height: 20),
              AppTextField(
                controller: _otpController,
                hintText: "أدخل الرمز",
              ),
              const SizedBox(height: 30),
              AppButton(
                text: "تحقق",
                onTap: () {
                  // هنا نتحقق من OTP - يمكن إضافة API للتحقق
                  if (_otpController.text.length == 6) {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const SignUpPage(), // نعيد إنشاء الحساب بعد OTP
                      ),
                    );
                  }
                },
                width: double.infinity,
                height: 50,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

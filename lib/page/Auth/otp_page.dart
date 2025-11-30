


// // otp_page.dart
// import 'package:complaints_application/service/AuthService/otp_service.dart';
// import 'package:flutter/material.dart';
// import 'package:otp_text_field/otp_field.dart';
// import 'package:otp_text_field/style.dart';
// import '../../core/color.dart';
// import '../../core/widget/app_button.dart';
// import 'login_page.dart';

// class OtpPage extends StatefulWidget {
//   final String contact; // البريد أو الرقم
//   const OtpPage({Key? key, required this.contact}) : super(key: key);

//   @override
//   State<OtpPage> createState() => _OtpPageState();
// }

// class _OtpPageState extends State<OtpPage> {
//   String otpCode = '';
//   bool isLoading = false;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: AppColors.background,
//       body: SafeArea(
//         child: Directionality(
//           textDirection: TextDirection.rtl,
//           child: Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 24),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.center,
//               children: [
//                 const SizedBox(height: 50),
//                 Align(
//                   alignment: Alignment.topRight,
//                   child: FloatingActionButton.small(
//                     backgroundColor: Colors.white,
//                     onPressed: () {
//                       Navigator.pushReplacement(
//                         context,
//                         MaterialPageRoute(builder: (context) => LoginPage()),
//                       );
//                     },
//                     child: const Icon(Icons.arrow_back, color: AppColors.primary),
//                   ),
//                 ),
//                 const SizedBox(height: 50),
//                 const Text(
//                   'تم إرسال رمز التحقق إلى بريدك الإلكتروني أو رقمك',
//                   textAlign: TextAlign.center,
//                   style: TextStyle(
//                     fontSize: 22,
//                     fontWeight: FontWeight.w400,
//                     color: AppColors.primary,
//                   ),
//                 ),
//                 const SizedBox(height: 40),
//                 OTPTextField(
//                   length: 6,
//                   width: MediaQuery.of(context).size.width,
//                   fieldWidth: 40,
//                   style: const TextStyle(fontSize: 20),
//                   textFieldAlignment: MainAxisAlignment.spaceAround,
//                   fieldStyle: FieldStyle.underline,
//                   onChanged: (code) {
//                     otpCode = code;
//                   },
//                   onCompleted: (pin) {
//                     otpCode = pin;
//                   },
//                 ),
//                 const SizedBox(height: 60),
//                 // isLoading
//                 //     ? const CircularProgressIndicator()
//                 //     : AppButton(
//                 //         text: "تأكيد",
//                 //         onTap: () async {
//                 //           setState(() => isLoading = true);

//                 //           final result = await VerifyOtpService().verifyOtp(
//                 //             identifier: widget.contact,
//                 //             code: otpCode,
//                 //           );

//                 //           setState(() => isLoading = false);

//                 //           if (result == "success") {
//                 //             ScaffoldMessenger.of(context).showSnackBar(
//                 //               const SnackBar(
//                 //                 content: Text("تم التحقق من الكود بنجاح"),
//                 //                 backgroundColor: Colors.green,
//                 //               ),
//                 //             );

//                 //             await Future.delayed(const Duration(seconds: 1));
//                 //             Navigator.pushReplacement(
//                 //               context,
//                 //               MaterialPageRoute(
//                 //                   builder: (context) => LoginPage()),
//                 //             );
//                 //           } else if (result == "expired") {
//                 //             ScaffoldMessenger.of(context).showSnackBar(
//                 //               const SnackBar(
//                 //                 content: Text("رمز التحقق منتهي الصلاحية"),
//                 //                 backgroundColor: Colors.red,
//                 //               ),
//                 //             );
//                 //           } else if (result == "invalid") {
//                 //             ScaffoldMessenger.of(context).showSnackBar(
//                 //               const SnackBar(
//                 //                 content: Text("رمز التحقق غير صحيح"),
//                 //                 backgroundColor: Colors.red,
//                 //               ),
//                 //             );
//                 //           } else {
//                 //             ScaffoldMessenger.of(context).showSnackBar(
//                 //               const SnackBar(
//                 //                 content: Text("حدث خطأ، حاول مرة أخرى"),
//                 //                 backgroundColor: Colors.red,
//                 //               ),
//                 //             );
//                 //           }
//                 //         },
//                 //         width: double.infinity,
//                 //         height: 50,
//                 //       ),
//                 isLoading
//     ? const CircularProgressIndicator()
//     : AppButton(
//         text: "تأكيد",
//         onTap: () async {
//           setState(() => isLoading = true);

//           final result = await VerifyOtpService.verifyOtp(
//             identifier: widget.contact,
//             otp: otpCode,
//           );

//           setState(() => isLoading = false);

//           if (result == "success") {
//             ScaffoldMessenger.of(context).showSnackBar(
//               const SnackBar(
//                 content: Text("تم التحقق من الكود بنجاح"),
//                 backgroundColor: Colors.green,
//               ),
//             );

//             await Future.delayed(const Duration(seconds: 1));
//             Navigator.pushReplacement(
//               context,
//               MaterialPageRoute(builder: (context) => LoginPage()),
//             );
//           } else if (result == "expired") {
//             ScaffoldMessenger.of(context).showSnackBar(
//               const SnackBar(
//                 content: Text("رمز التحقق منتهي الصلاحية"),
//                 backgroundColor: Colors.red,
//               ),
//             );
//           } else {
//             ScaffoldMessenger.of(context).showSnackBar(
//               const SnackBar(
//                 content: Text("رمز التحقق غير صحيح"),
//                 backgroundColor: Colors.red,
//               ),
//             );
//           }
//         },
//         width: double.infinity,
//         height: 50,
//       ),

//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }



import 'package:complaints_application/service/AuthService/otp_service.dart';
import 'package:flutter/material.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/style.dart';
import '../../core/color.dart';
import '../../core/widget/app_button.dart';
import 'login_page.dart';

class OtpPage extends StatefulWidget {
  final String contact; // البريد أو الرقم
  const OtpPage({Key? key, required this.contact}) : super(key: key);

  @override
  State<OtpPage> createState() => _OtpPageState();
}

class _OtpPageState extends State<OtpPage> {
  String otpCode = '';
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Directionality(
          textDirection: TextDirection.rtl,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 50),
                Align(
                  alignment: Alignment.topRight,
                  child: FloatingActionButton.small(
                    backgroundColor: Colors.white,
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => LoginPage()),
                      );
                    },
                    child: const Icon(Icons.arrow_back, color: AppColors.primary),
                  ),
                ),
                const SizedBox(height: 50),
                const Text(
                  'تم إرسال رمز التحقق إلى بريدك الإلكتروني أو رقمك',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w400,
                    color: AppColors.primary,
                  ),
                ),
                const SizedBox(height: 40),
                OTPTextField(
                  length: 6,
                  width: MediaQuery.of(context).size.width,
                  fieldWidth: 40,
                  style: const TextStyle(fontSize: 20),
                  textFieldAlignment: MainAxisAlignment.spaceAround,
                  fieldStyle: FieldStyle.underline,
                  onChanged: (code) {
                    otpCode = code;
                  },
                  onCompleted: (pin) {
                    otpCode = pin;
                  },
                ),
                const SizedBox(height: 60),
                isLoading
                    ? const CircularProgressIndicator()
                    : AppButton(
                        text: "تأكيد",
                        onTap: () async {
                          setState(() => isLoading = true);

                          final result = await VerifyOtpService.verifyOtp(
                            identifier: widget.contact,
                            otp: otpCode,
                          );

                          setState(() => isLoading = false);

                          if (result == "success") {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text("تم التحقق من الكود بنجاح"),
                                backgroundColor: Colors.green,
                              ),
                            );

                            await Future.delayed(const Duration(seconds: 1));
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(builder: (context) => LoginPage()),
                            );
                          } else if (result == "expired") {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text("رمز التحقق منتهي الصلاحية"),
                                backgroundColor: Colors.red,
                              ),
                            );
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text("رمز التحقق غير صحيح"),
                                backgroundColor: Colors.red,
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
      ),
    );
  }
}

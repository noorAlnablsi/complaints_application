// import 'dart:io';

// import 'package:complaints_application/service/complaint_service.dart';
// import 'package:file_picker/file_picker.dart';
// import 'package:flutter/material.dart';
// import 'package:gap/gap.dart';
// import 'package:geolocator/geolocator.dart';

// class ComplaintStepOne extends StatefulWidget {
//   @override
//   State<ComplaintStepOne> createState() => _ComplaintStepOneState();
// }

// class _ComplaintStepOneState extends State<ComplaintStepOne> {
//   int? selectedComplaintType;
//   int? selectedDestination;
//   String address = "";
//   double? lat;
//   double? lng;

//   final addressCtrl = TextEditingController();

//   bool loadingLocation = false;

//   Future<void> _getLocation() async {
//     setState(() => loadingLocation = true);

//     try {
//       LocationPermission permission = await Geolocator.checkPermission();
//       if (permission == LocationPermission.denied ||
//           permission == LocationPermission.deniedForever) {
//         permission = await Geolocator.requestPermission();
//       }

//       final pos = await Geolocator.getCurrentPosition(
//           desiredAccuracy: LocationAccuracy.high);

//       lat = pos.latitude;
//       lng = pos.longitude;

//       setState(() {});
//     } catch (e) {
//       ScaffoldMessenger.of(context)
//           .showSnackBar(SnackBar(content: Text("فشل تحديد الموقع: $e")));
//     } finally {
//       setState(() => loadingLocation = false);
//     }
//   }

//   void _goNext() {
//     if (selectedComplaintType == null ||
//         selectedDestination == null ||
//         lat == null ||
//         lng == null ||
//         addressCtrl.text.isEmpty) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text("يرجى تعبئة جميع الحقول")),
//       );
//       return;
//     }

//     Navigator.pushNamed(context, "/complaint_step_two", arguments: {
//       "complaint_type_id": selectedComplaintType,
//       "destination_id": selectedDestination,
//       "lat": lat,
//       "lng": lng,
//       "address": addressCtrl.text,
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text("تقديم شكوى - الخطوة ١")),
//       body: Padding(
//         padding: const EdgeInsets.all(16),
//         child: ListView(
//           children: [
//             // نوع الشكوى
//             Text("نوع الشكوى"),
//             DropdownButton<int>(
//               isExpanded: true,
//               hint: Text("اختر نوع الشكوى"),
//               value: selectedComplaintType,
//               items: [
//                 DropdownMenuItem(value: 1, child: Text("فنية")),
//                 DropdownMenuItem(value: 2, child: Text("إدارية")),
//               ],
//               onChanged: (v) => setState(() => selectedComplaintType = v),
//             ),
//             Gap(10),

//             Text("الجهة"),
//             DropdownButton<int>(
//               isExpanded: true,
//               hint: Text("اختر الجهة"),
//               value: selectedDestination,
//               items: [
//                 DropdownMenuItem(value: 1, child: Text("المالية")),
//                 DropdownMenuItem(value: 2, child: Text("الصيانة")),
//               ],
//               onChanged: (v) => setState(() => selectedDestination = v),
//             ),
//             Gap(10),

//             Text("العنوان"),
//             TextField(
//               controller: addressCtrl,
//               decoration: InputDecoration(
//                 filled: true,
//                 fillColor: Colors.grey[200],
//                 border: OutlineInputBorder(),
//                 hintText: "اكتب عنوان الموقع",
//               ),
//             ),
//             Gap(10),

//             Text("تحديد الموقع تلقائياً"),
//             loadingLocation
//                 ? Center(child: CircularProgressIndicator())
//                 : ElevatedButton(
//                     onPressed: _getLocation, child: Text("الحصول على موقعي")),
//             if (lat != null) Text("lat: $lat"),
//             if (lng != null) Text("lng: $lng"),

//             Gap(30),

//             ElevatedButton(
//               onPressed: _goNext,
//               child: Text("التالي"),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }


// class ComplaintStepTwo extends StatefulWidget {
//   final Map data;
//   const ComplaintStepTwo({super.key, required this.data});

//   @override
//   State<ComplaintStepTwo> createState() => _ComplaintStepTwoState();
// }

// class _ComplaintStepTwoState extends State<ComplaintStepTwo> {
//   final descCtrl = TextEditingController();

//   List<File> images = [];
//   List<File> documents = [];

//   bool sending = false;

//   Future<void> pickImages() async {
//     final result = await FilePicker.platform.pickFiles(
//       allowMultiple: true,
//       type: FileType.image,
//     );
//     if (result != null) {
//       images = result.paths.map((e) => File(e!)).toList();
//       setState(() {});
//     }
//   }

//   Future<void> pickDocuments() async {
//     final result = await FilePicker.platform.pickFiles(
//       allowMultiple: true,
//       type: FileType.custom,
//       allowedExtensions: ['pdf', 'doc', 'docx'],
//     );
//     if (result != null) {
//       documents = result.paths.map((e) => File(e!)).toList();
//       setState(() {});
//     }
//   }

//   Future<void> send() async {
//     if (descCtrl.text.isEmpty) {
//       ScaffoldMessenger.of(context)
//           .showSnackBar(SnackBar(content: Text("يرجى كتابة وصف المشكلة")));
//       return;
//     }

//     setState(() => sending = true);

//     final success = await ComplaintService.sendComplaint(
//       data: {
//         ...widget.data,
//         "description": descCtrl.text.trim(),
//       },
//       images: images,
//       documents: documents,
//     );

//     if (!mounted) return;

//     if (success) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text("تم إرسال الشكوى بنجاح")),
//       );
//       Navigator.pop(context);
//       Navigator.pop(context);
//     } else {
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text("فشل إرسال الشكوى"), backgroundColor: Colors.red),
//       );
//     }

//     setState(() => sending = false);
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text("تقديم شكوى - الخطوة ٢")),
//       body: Padding(
//         padding: const EdgeInsets.all(16),
//         child: ListView(
//           children: [
//             Text("وصف المشكلة"),
//             TextField(
//               controller: descCtrl,
//               maxLines: 5,
//               decoration: InputDecoration(
//                 filled: true,
//                 fillColor: Colors.grey[200],
//                 border: OutlineInputBorder(),
//               ),
//             ),
//             Gap(20),

//             Text("إرفاق صور"),
//             ElevatedButton(onPressed: pickImages, child: Text("اختيار صور")),
//             if (images.isNotEmpty) Text("${images.length} صورة مختارة"),

//             Gap(20),

//             Text("إرفاق وثائق"),
//             ElevatedButton(onPressed: pickDocuments, child: Text("اختيار ملفات")),
//             if (documents.isNotEmpty) Text("${documents.length} ملف مختار"),

//             Gap(30),

//             ElevatedButton(
//               onPressed: sending ? null : send,
//               child: sending
//                   ? CircularProgressIndicator(color: Colors.white)
//                   : Text("إرسال الشكوى"),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }


import 'dart:io';
import 'package:complaints_application/service/complaint_service.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:geolocator/geolocator.dart';

class ComplaintStepOne extends StatefulWidget {
  @override
  State<ComplaintStepOne> createState() => _ComplaintStepOneState();
}

class _ComplaintStepOneState extends State<ComplaintStepOne> {
  int? selectedComplaintType;
  int? selectedDestination;
  double? lat;
  double? lng;
  final addressCtrl = TextEditingController();
  bool loadingLocation = false;

  Future<void> _getLocation() async {
    setState(() => loadingLocation = true);
    try {
      LocationPermission permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied ||
          permission == LocationPermission.deniedForever) {
        permission = await Geolocator.requestPermission();
      }

      final pos = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);

      lat = pos.latitude;
      lng = pos.longitude;
      addressCtrl.text = "الموقع الحالي";

      setState(() {});
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("فشل تحديد الموقع: $e")));
    } finally {
      setState(() => loadingLocation = false);
    }
  }

  void _goNext() {
    if (selectedComplaintType == null ||
        selectedDestination == null ||
        lat == null ||
        lng == null ||
        addressCtrl.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("يرجى تعبئة جميع الحقول")),
      );
      return;
    }

    Navigator.pushNamed(context, "/complaint_step_two", arguments: {
      "complaint_type_id": selectedComplaintType,
      "destination_id": selectedDestination,
      "lat": lat,
      "lng": lng,
      "address": addressCtrl.text,
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("تقديم شكوى - الخطوة ١")),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("نوع الشكوى", style: TextStyle(fontWeight: FontWeight.bold)),
            Gap(6),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 12),
              decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(10)),
              child: DropdownButton<int>(
                isExpanded: true,
                hint: Text("اختر نوع الشكوى"),
                value: selectedComplaintType,
                underline: SizedBox(),
                items: [
                  DropdownMenuItem(value: 1, child: Text("فنية")),
                  DropdownMenuItem(value: 2, child: Text("إدارية")),
                ],
                onChanged: (v) => setState(() => selectedComplaintType = v),
              ),
            ),
            Gap(20),

            Text("الجهة", style: TextStyle(fontWeight: FontWeight.bold)),
            Gap(6),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 12),
              decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(10)),
              child: DropdownButton<int>(
                isExpanded: true,
                hint: Text("اختر الجهة"),
                value: selectedDestination,
                underline: SizedBox(),
                items: [
                  DropdownMenuItem(value: 1, child: Text("المالية")),
                  DropdownMenuItem(value: 2, child: Text("الصيانة")),
                ],
                onChanged: (v) => setState(() => selectedDestination = v),
              ),
            ),
            Gap(20),

            Text("العنوان", style: TextStyle(fontWeight: FontWeight.bold)),
            Gap(6),
            TextField(
              controller: addressCtrl,
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.grey[200],
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide.none),
                hintText: "اكتب عنوان الموقع",
              ),
            ),
            Gap(20),

            Center(
              child: loadingLocation
                  ? CircularProgressIndicator()
                  : ElevatedButton.icon(
                      onPressed: _getLocation,
                      icon: Icon(Icons.location_on),
                      label: Text("تحديد موقعي تلقائياً"),
                      style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.symmetric(
                              vertical: 14, horizontal: 20),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10))),
                    ),
            ),
            if (lat != null && lng != null)
              Center(child: Text("Lat: $lat, Lng: $lng")),
            Gap(30),

            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: _goNext,
                child: Text("التالي"),
                style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10))),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ComplaintStepTwo extends StatefulWidget {
  final Map data;
  const ComplaintStepTwo({super.key, required this.data});

  @override
  State<ComplaintStepTwo> createState() => _ComplaintStepTwoState();
}

class _ComplaintStepTwoState extends State<ComplaintStepTwo> {
  final descCtrl = TextEditingController();
  List<File> images = [];
  List<File> documents = [];
  bool sending = false;

  Future<void> pickImages() async {
    final result = await FilePicker.platform.pickFiles(
      allowMultiple: true,
      type: FileType.image,
    );
    if (result != null) {
      images = result.paths.map((e) => File(e!)).toList();
      setState(() {});
    }
  }

  Future<void> pickDocuments() async {
    final result = await FilePicker.platform.pickFiles(
      allowMultiple: true,
      type: FileType.custom,
      allowedExtensions: ['pdf', 'doc', 'docx'],
    );
    if (result != null) {
      documents = result.paths.map((e) => File(e!)).toList();
      setState(() {});
    }
  }

  Future<void> send() async {
    if (descCtrl.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("يرجى كتابة وصف المشكلة")));
      return;
    }

    setState(() => sending = true);
    final success = await ComplaintService.sendComplaint(
      data: {...widget.data, "description": descCtrl.text.trim()},
      images: images,
      documents: documents,
    );

    if (!mounted) return;

    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(
            success ? "تم إرسال الشكوى بنجاح ✅" : "فشل إرسال الشكوى"),
        backgroundColor: success ? Colors.green : Colors.red));

    if (success) Navigator.popUntil(context, (route) => route.isFirst);

    setState(() => sending = false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("تقديم شكوى - الخطوة ٢")),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("وصف المشكلة", style: TextStyle(fontWeight: FontWeight.bold)),
            Gap(6),
            TextField(
              controller: descCtrl,
              maxLines: 5,
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.grey[200],
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide.none),
              ),
            ),
            Gap(20),

            Text("إرفاق صور", style: TextStyle(fontWeight: FontWeight.bold)),
            Gap(6),
            ElevatedButton.icon(
              onPressed: pickImages,
              icon: Icon(Icons.image),
              label: Text("اختيار صور"),
              style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10))),
            ),
            if (images.isNotEmpty) Text("${images.length} صورة مختارة"),
            Gap(20),

            Text("إرفاق وثائق", style: TextStyle(fontWeight: FontWeight.bold)),
            Gap(6),
            ElevatedButton.icon(
              onPressed: pickDocuments,
              icon: Icon(Icons.attach_file),
              label: Text("اختيار ملفات"),
              style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10))),
            ),
            if (documents.isNotEmpty) Text("${documents.length} ملف مختار"),
            Gap(30),

            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: sending ? null : send,
                child: sending
                    ? SizedBox(
                        width: 24,
                        height: 24,
                        child: CircularProgressIndicator(color: Colors.white),
                      )
                    : Text("إرسال الشكوى"),
                style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10))),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

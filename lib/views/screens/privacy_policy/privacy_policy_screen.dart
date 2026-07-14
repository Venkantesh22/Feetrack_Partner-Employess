import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vlr/controllers/attendance_controller.dart';

class PrivacyPolicyScreen extends StatefulWidget {
  const PrivacyPolicyScreen({super.key});

  @override
  State<PrivacyPolicyScreen> createState() => _PrivacyPolicyScreenState();
}

class _PrivacyPolicyScreenState extends State<PrivacyPolicyScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Get.find<AttendanceController>().fetchCheckListPoint();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}

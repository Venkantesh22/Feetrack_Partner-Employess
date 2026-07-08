import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';
import 'package:vlr/data/repositories/leave_repo.dart';

class LeaveController extends GetxController implements GetxService {
  final LeaveRepo leaveRepo;

  LeaveController({required this.leaveRepo});

  bool isLoading = false;

  TextEditingController startDateController = TextEditingController();
  TextEditingController endDateController = TextEditingController();
  TextEditingController reasonForLeaveController = TextEditingController();

  String? leaveType;
  List<String> leaveTypeList = [
    "Casual Leave (CL)",
    "Sick Leave (CL)",
    "unPaid Leave (CL)",
  ];

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    startDateController.dispose();
    endDateController.dispose();
    reasonForLeaveController.dispose();
  }
}

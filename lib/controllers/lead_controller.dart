import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';
import 'package:vlr/data/repositories/lead_repo.dart';

class LeadController extends GetxController implements GetxService {
  final LeadRepo leadRepo;

  LeadController({required this.leadRepo});

  bool isLoading = false;

  TextEditingController nameLeadController = TextEditingController();
  TextEditingController businessNameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController businessAmountController = TextEditingController();
  TextEditingController requirementController = TextEditingController();

  String? productInterest;
  String? status;
  String? assignTo;

  List<String> productInterestList = [
    "Product 1",
    "Product 2",
    "Product 3",
  ];
  List<String> statusList = [
    "New",
  ];
  List<String> assignToList = [
    "Employee 1",
    "Employee 2",
    "Employee 3",
    "Employee 4",
  ];

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    nameLeadController.dispose();
    businessNameController.dispose();
    businessAmountController.dispose();
    requirementController.dispose();
  }
}

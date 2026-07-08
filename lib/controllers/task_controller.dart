import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vlr/data/repositories/task_repo.dart';

class TaskController extends GetxController implements GetxService {
  final TaskRepo taskRepo;

  TaskController({required this.taskRepo});

  TextEditingController titleController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  TextEditingController descriController = TextEditingController();

  String? assignTo;
  String? taskStatus;

  List<String> taskStatusList = [
    "Pending",
    "In Progress",
    "Completed",
  ];

  List<String> assignToList = ["Venkatesh Rathod"];

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    titleController.dispose();
    dateController.dispose();
    descriController.dispose();
  }
}

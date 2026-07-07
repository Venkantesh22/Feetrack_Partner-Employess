import 'package:get/get.dart';
import 'package:vlr/data/repositories/attendence_repo.dart';

class AttendanceController extends GetxController implements GetxService {
  final AttendanceRepo attendanceRepo;

  AttendanceController({required this.attendanceRepo});

  final isLoading = false;

  bool isCheckIn = true;
  bool isCheckout = true;
}

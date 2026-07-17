import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vlr/controllers/attendance_controller.dart';
import 'package:vlr/data/models/attendance/attendance_model.dart';
import 'package:vlr/services/constants.dart';
import 'package:vlr/views/base/shimmer.dart';
import 'package:vlr/views/screens/attendance/attendacn_details/attendance_details_screen.dart';
import 'package:vlr/views/screens/attendance/attendance_history/widget/attendance_list_section/attendance_widget.dart';

class AttendanceListSection extends StatefulWidget {
  const AttendanceListSection({super.key});

  @override
  State<AttendanceListSection> createState() => _AttendanceListSectionState();
}

class _AttendanceListSectionState extends State<AttendanceListSection> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<AttendanceController>(
      builder: (attendanceController) {
        if (!attendanceController.isLoading &&
            attendanceController.attendanceList.isEmpty) {
          return Center(
            child: Column(
              children: [
                const Text("No Attendance Found"),
                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () {
                    attendanceController.fetchTeamEmployeeAttendanceList();
                  },
                  child: const Text("Retry"),
                ),
              ],
            ),
          );
        }

        return ListView.separated(
          padding: EdgeInsets.zero,
          shrinkWrap: true,
          primary: false,
          physics: const AlwaysScrollableScrollPhysics(),
          itemCount: attendanceController.isLoading
              ? 4
              : attendanceController.attendanceList.length,
          separatorBuilder: (_, __) => const SizedBox(height: 12),
          itemBuilder: (context, index) {
            final model = attendanceController.isLoading
                ? AttendanceModel()
                : attendanceController.attendanceList[index];
            return CustomShimmer(
              isLoading: attendanceController.isLoading,
              child: AttendanceWidget(
                onTap: () {
                  bool showAttendanceDetailScreen = ((model.isPunchIn) ||
                          (model.isPunchOut) ||
                          (model.isHalfDay))
                      ? true
                      : false;
                  if (showAttendanceDetailScreen) {
                    attendanceController.updateAttendanceId(
                        attendanceId: model.id ?? 0);
                    navigate(
                        context: context,
                        page: const AttendanceDetailsScreen());
                  } else {
                    showToast(message: "This day your are ${model.statusName}");
                  }
                },
                attendanceModel: model,
              ),
            );
          },
        );
      },
    );
  }
}

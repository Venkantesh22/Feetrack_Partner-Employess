import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vlr/controllers/attendance_controller.dart';
import 'package:vlr/views/screens/attendance/attendance_history/widget/attendance_list_section/attendance_widget.dart';

class AttendanceListSection extends StatefulWidget {
  const AttendanceListSection({super.key});

  @override
  State<AttendanceListSection> createState() => _AttendanceListSectionState();
}

class _AttendanceListSectionState extends State<AttendanceListSection> {
  final AttendanceController controller = Get.find<AttendanceController>();

  final ScrollController scrollController = ScrollController();

  @override
  void initState() {
    super.initState();

    scrollController.addListener(_scrollListener);
  }

  void _scrollListener() {
    if (!scrollController.hasClients) return;

    if (scrollController.position.pixels >=
        scrollController.position.maxScrollExtent - 150) {
      if (!controller.attendanceState.isMoreLoading &&
          !controller.attendanceState.isInitialLoading &&
          controller.attendanceState.canLoadMore) {
        controller.fetchAttendanceHistoryPagination(loadMore: true);
      }
    }
  }

  @override
  void dispose() {
    scrollController.removeListener(_scrollListener);
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AttendanceController>(
      builder: (_) {
        /// Initial Loading
        if (controller.attendanceState.isInitialLoading &&
            controller.attendanceList.isEmpty) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }

        /// Empty State
        if (controller.attendanceList.isEmpty) {
          return Center(
            child: Column(
              children: [
                const Text("No Attendance Found"),
                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () {
                    controller.fetchAttendanceHistoryPagination();
                  },
                  child: const Text("Retry"),
                ),
              ],
            ),
          );
        }

        return RefreshIndicator(
          onRefresh: () async {
            await controller.fetchAttendanceHistoryPagination(
              refresh: true,
            );
          },
          child: ListView.separated(
            controller: scrollController,
            shrinkWrap: true,
            primary: false,
            physics: const AlwaysScrollableScrollPhysics(),
            itemCount: controller.attendanceList.length +
                (controller.attendanceState.isMoreLoading ? 1 : 0),
            separatorBuilder: (_, __) => const SizedBox(height: 12),
            itemBuilder: (context, index) {
              if (index == controller.attendanceList.length) {
                return const Padding(
                  padding: EdgeInsets.symmetric(vertical: 20),
                  child: Center(
                    child: CircularProgressIndicator(),
                  ),
                );
              }

              return AttendanceWidget(
                attendanceModel: controller.attendanceList[index],
              );
            },
          ),
        );
      },
    );
  }
}

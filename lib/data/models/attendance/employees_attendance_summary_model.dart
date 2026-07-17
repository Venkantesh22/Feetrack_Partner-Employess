class EmployeesAttendanceSummaryModel {
  final int? punchOut;
  final int? absent;
  final int? halfDay;
  final int? punchIn;
  final int? leave;
  final int? holiday;
  final int? weekOff;
  final int? late;

  EmployeesAttendanceSummaryModel({
    this.punchOut,
    this.absent,
    this.halfDay,
    this.punchIn,
    this.leave,
    this.holiday,
    this.weekOff,
    this.late,
  });

  factory EmployeesAttendanceSummaryModel.fromJson(Map<String, dynamic> json) =>
      EmployeesAttendanceSummaryModel(
        punchOut: json["punch_out"],
        absent: json["absent"],
        halfDay: json["half_day"],
        punchIn: json["punch_in"],
        leave: json["leave"],
        holiday: json["holiday"],
        weekOff: json["weekOff"],
        late: json["late"],
      );

  Map<String, dynamic> toJson() => {
        "punch_out": punchOut,
        "absent": absent,
        "half_day": halfDay,
        "punch_in": punchIn,
        "leave": leave,
        "holiday": holiday,
        "weekOff": weekOff,
        "late": late,
      };
}

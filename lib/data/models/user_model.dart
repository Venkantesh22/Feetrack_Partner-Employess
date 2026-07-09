class UserModel {
  final String? id;
  final String? createdBy;
  final String? parentId;
  final String? departmentId;
  final String? reportingTo;
  final String? name;
  final String? email;
  final String? mobile;
  final String? role;
  final String? status;
  final String? walletBalance;
  final String? basicSalary;
  final DateTime? emailVerifiedAt;
  final DateTime? mobileVerifiedAt;
  final String? profileImage;
  final String? fcmToken;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final DateTime? deletedAt;
  final List<String>? roles;
  final List<String>? permissions;

  const UserModel({
    this.id,
    this.createdBy,
    this.parentId,
    this.departmentId,
    this.reportingTo,
    this.name,
    this.email,
    this.mobile,
    this.role,
    this.status,
    this.walletBalance,
    this.basicSalary,
    this.emailVerifiedAt,
    this.mobileVerifiedAt,
    this.profileImage,
    this.fcmToken,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
    this.roles,
    this.permissions,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'] as String?,
      createdBy: json['created_by'] as String?,
      parentId: json['parent_id'] as String?,
      departmentId: json['department_id'] as String?,
      reportingTo: json['reporting_to'] as String?,
      name: json['name'] as String?,
      email: json['email'] as String?,
      mobile: json['mobile'] as String?,
      role: json['role'] as String?,
      status: json['status'] as String?,
      walletBalance: json['wallet_balance'] as String?,
      basicSalary: json['basic_salary'] as String?,
      emailVerifiedAt: json['email_verified_at'] != null
          ? DateTime.tryParse(json['email_verified_at'])
          : null,
      mobileVerifiedAt: json['mobile_verified_at'] != null
          ? DateTime.tryParse(json['mobile_verified_at'])
          : null,
      profileImage: json['profile_image'] as String?,
      fcmToken: json['fcm_token'] as String?,
      createdAt: json['created_at'] != null
          ? DateTime.tryParse(json['created_at'])
          : null,
      updatedAt: json['updated_at'] != null
          ? DateTime.tryParse(json['updated_at'])
          : null,
      deletedAt: json['deleted_at'] != null
          ? DateTime.tryParse(json['deleted_at'])
          : null,
      roles: (json['roles'] as List<dynamic>?)
          ?.map((e) => e.toString())
          .toList(),
      permissions: (json['permissions'] as List<dynamic>?)
          ?.map((e) => e.toString())
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'created_by': createdBy,
      'parent_id': parentId,
      'department_id': departmentId,
      'reporting_to': reportingTo,
      'name': name,
      'email': email,
      'mobile': mobile,
      'role': role,
      'status': status,
      'wallet_balance': walletBalance,
      'basic_salary': basicSalary,
      'email_verified_at': emailVerifiedAt?.toIso8601String(),
      'mobile_verified_at': mobileVerifiedAt?.toIso8601String(),
      'profile_image': profileImage,
      'fcm_token': fcmToken,
      'created_at': createdAt?.toIso8601String(),
      'updated_at': updatedAt?.toIso8601String(),
      'deleted_at': deletedAt?.toIso8601String(),
      'roles': roles,
      'permissions': permissions,
    };
  }
}
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vlr/generated/assets.dart';
import 'package:vlr/services/constants.dart';
import 'package:vlr/views/screens/account_screen/widget/row_logout_account_delete_section/row_logout_delete_account_widget.dart';

class RowOfLogOutAndDeleteAccountSection extends StatelessWidget {
  const RowOfLogOutAndDeleteAccountSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: RowOfLogOutAndDeleteAccountWIdget(
            icon: Icons.logout_outlined,
            title: "Logout",
            onTap: () {},
          ),
        ),
        sizedBoxWidth(width: 12.w),
        Expanded(
          child: RowOfLogOutAndDeleteAccountWIdget(
            icon: Icons.delete_forever_outlined,
            title: "Delete Account",
            onTap: () {},
          ),
        ),
      ],
    );
  }
}

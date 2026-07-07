import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vlr/services/constants.dart';
import 'package:vlr/services/custom_text.dart';
import 'package:vlr/services/theme.dart';
import 'package:vlr/views/screens/account_screen/widget/account_option_section/account_option_model.dart';
import 'package:vlr/views/screens/account_screen/widget/account_option_section/account_option_widget.dart';

class AccountOptionSection extends StatelessWidget {
  const AccountOptionSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final list = accountOptionModelList(context: context);
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            color: white,
            border: Border.all(
              width: 1,
              color: greyLight4,
            ),
            borderRadius: BorderRadius.circular(8),
            boxShadow: [
              BoxShadow(
                  offset: Offset(0, 1),
                  blurRadius: 2,
                  spreadRadius: 0,
                  color: black.withValues(alpha: 0.05))
            ],
          ),
          child: ListView.separated(
              shrinkWrap: true,
              padding: EdgeInsets.symmetric(vertical: 20.h),
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                final accountOptionModel = list[index];
                return AccountOptionWidget(
                    accountOptionModel: accountOptionModel);
              },
              separatorBuilder: (_, __) => Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: 16.h,
                    ),
                    child: Divider(
                      color: greyLight1,
                    ),
                  ),
              itemCount: list.length),
        ),
        sizedBoxHeight(height: 24.h),
        Container(
          decoration: BoxDecoration(
            color: white,
            border: Border.all(
              width: 1,
              color: greyLight4,
            ),
            borderRadius: BorderRadius.circular(8),
            boxShadow: [
              BoxShadow(
                  offset: Offset(0, 1),
                  blurRadius: 2,
                  spreadRadius: 0,
                  color: black.withValues(alpha: 0.05))
            ],
          ),
          child: GestureDetector(
            onTap: () {},
            child: Container(
              padding: EdgeInsets.all(16.w),
              child: Row(
                children: [
                  Icon(
                    Icons.logout,
                    color: redDark,
                    size: 20.sp,
                  ),
                  sizedBoxWidth(width: 12.w),
                  Expanded(
                    child: CustomText(
                      "Logout",
                      style: Helper(context)
                          .textTheme
                          .bodyMedium
                          ?.copyWith(fontSize: 14, color: redDark),
                    ),
                  ),
                  Icon(
                    Icons.arrow_forward_ios_rounded,
                    size: 16,
                    color: greyLight5,
                  )
                ],
              ),
            ),
          ),
        )
      ],
    );
  }
}

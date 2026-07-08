import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
      ],
    );
  }
}

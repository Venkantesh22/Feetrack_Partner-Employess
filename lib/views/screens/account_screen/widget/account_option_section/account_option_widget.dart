import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:vlr/services/constants.dart';
import 'package:vlr/services/custom_text.dart';
import 'package:vlr/services/theme.dart';
import 'package:vlr/views/screens/account_screen/widget/account_option_section/account_option_model.dart';

class AccountOptionWidget extends StatelessWidget {
  final AccountOptionModel accountOptionModel;
  const AccountOptionWidget({super.key, required this.accountOptionModel});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Row(
          children: [
            SvgPicture.asset(
              accountOptionModel.icon,
              height: 20.h,
              width: 20.w,
              fit: BoxFit.cover,
            ),
            sizedBoxWidth(width: 12.w),
            Expanded(
              child: CustomText(
                accountOptionModel.title,
                style: Helper(context)
                    .textTheme
                    .bodyMedium
                    ?.copyWith(fontSize: 14, color: blackText1),
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
    );
  }
}

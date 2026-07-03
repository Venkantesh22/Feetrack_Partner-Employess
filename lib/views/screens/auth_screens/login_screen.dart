// import 'package:flutter/gestures.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';

// import '../../../services/constants.dart';
// import '../../../services/route_helper.dart';
// import '../../../services/theme.dart';
// import '../../base/custom_button.dart';
// import '../../base/custom_toast.dart';
// import 'opt_verification_screen.dart';

// class LoginScreen extends StatefulWidget {
//   const LoginScreen({super.key});

//   @override
//   State<LoginScreen> createState() => _LoginScreenState();
// }

// class _LoginScreenState extends State<LoginScreen> {
//   final TextEditingController _phoneNumberController = TextEditingController();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         leading: const BackButton(color: Colors.black),
//         backgroundColor: Colors.transparent,
//         centerTitle: true,
//         title: Text(
//           "Mobile Authentication",
//           style:
//               Theme.of(context).textTheme.displaySmall!.copyWith(fontSize: 20),
//         ),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(20.0),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             const SizedBox(
//               height: 50,
//             ),
//             Text(
//               "What's your",
//               style: Theme.of(context).textTheme.titleLarge!.copyWith(
//                     fontSize: 35,
//                     color: Colors.black,
//                     fontWeight: FontWeight.bold,
//                   ),
//             ),
//             Text(
//               "phone number?",
//               style: Theme.of(context).textTheme.titleLarge!.copyWith(
//                     fontSize: 35,
//                     color: Colors.black,
//                     fontWeight: FontWeight.w900,
//                   ),
//             ),
//             const SizedBox(
//               height: 20,
//             ),
//             TextField(
//               autofocus: true,
//               controller: _phoneNumberController,
//               inputFormatters: [
//                 LengthLimitingTextInputFormatter(10),
//                 FilteringTextInputFormatter.digitsOnly
//               ],
//               keyboardType: TextInputType.number,
//               textInputAction: TextInputAction.done,
//               decoration: InputDecoration(
//                 hintText: "Phone number",
//                 hintStyle: Theme.of(context).textTheme.titleLarge!.copyWith(
//                       color: Colors.black.withOpacity(0.3),
//                     ),
//                 enabledBorder: UnderlineInputBorder(
//                     borderSide: BorderSide(
//                         color: Colors.black.withOpacity(0.3), width: 1)),
//               ),
//               onChanged: (txt) {
//                 if (txt.length == 10) {
//                   FocusManager.instance.primaryFocus?.unfocus();
//                 }
//               },
//             ),
//             const SizedBox(
//               height: 20,
//             ),
//             RichText(
//                 text: TextSpan(children: [
//               TextSpan(
//                   text:
//                       "By tapping next you're creating an account and you agree to the ",
//                   style: Theme.of(context).textTheme.titleSmall!.copyWith()),
//               TextSpan(
//                 recognizer: TapGestureRecognizer()..onTap = () {},
//                 text: "Terms and condition ",
//                 style: Theme.of(context).textTheme.titleSmall!.copyWith(
//                       color: primaryColor,
//                       decoration: TextDecoration.underline,
//                     ),
//               ),
//               TextSpan(
//                   text: "and acknowledge ",
//                   style: Theme.of(context).textTheme.titleSmall!.copyWith()),
//               TextSpan(
//                 recognizer: TapGestureRecognizer()..onTap = () {},
//                 text: "Privacy Policy ",
//                 style: Theme.of(context).textTheme.titleSmall!.copyWith(
//                       color: primaryColor,
//                       decoration: TextDecoration.underline,
//                     ),
//               )
//             ]))
//           ],
//         ),
//       ),
//       bottomNavigationBar: SafeArea(
//         child: Padding(
//           padding: const EdgeInsets.symmetric(
//               horizontal: AppConstants.horizontalPadding, vertical: 15),
//           child: SizedBox(
//             height: 50,
//             child: CustomButton(
//               radius: 6,
//               elevation: 0,
//               color: Colors.black,
//               onTap: () {
//                 if (_phoneNumberController.text.length != 10) {
//                   // showCustomToast(
//                   //     msg: 'Invalid Number', toastType: ToastType.warning);
//                   return;
//                 }
//                 Navigator.push(
//                     context,
//                     getCustomRoute(
//                         child: OTPVerification(
//                       phone: _phoneNumberController.text,
//                     )));
//               },
//               child: Text(
//                 'Next',
//                 style: Theme.of(context).textTheme.titleSmall?.copyWith(
//                       fontWeight: FontWeight.w600,
//                       color: Colors.white,
//                       fontSize: 14,
//                     ),
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:vlr/controllers/auth_controller.dart';
import 'package:vlr/generated/assets.dart';
import 'package:vlr/services/constants.dart';
import 'package:vlr/services/custom_text.dart';
import 'package:vlr/services/theme.dart';
import 'package:vlr/views/base/custom_button.dart';
import 'package:vlr/views/base/custom_image.dart';
import 'package:vlr/views/widget/text_box/app_text_box.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: Container(
        height: size.height,
        width: double.infinity,
        padding: AppConstants.screenPadding,
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage(
                Assets.imagesLoginBg,
              ),
              fit: BoxFit.cover),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Container(
                width: double.infinity,
                padding: EdgeInsets.all(24.sp),
                decoration: BoxDecoration(
                    color: white, borderRadius: BorderRadius.circular(24)),
                child: GetBuilder<AuthController>(builder: (authController) {
                  return Column(
                    children: [
                      CustomImage(
                        path: Assets.imagesLogo,
                        height: 64.h,
                        fit: BoxFit.cover,
                      ),
                      sizedBoxHeight(height: 16),
                      CustomText(
                        "Sign in",
                        style: Helper(context).textTheme.titleMedium?.copyWith(
                              fontSize: 24.sp,
                            ),
                      ),
                      sizedBoxHeight(height: 16),
                      CustomText(
                        "Welcome back! Please enter your details.",
                        style: Helper(context)
                            .textTheme
                            .bodySmall
                            ?.copyWith(fontSize: 14.sp, color: greyDart2),
                      ),
                      sizedBoxHeight(height: 32),
                      AppTextFieldWithHeading(
                        headingWidget: CustomText(
                          "Email",
                          style:
                              Helper(context).textTheme.labelMedium?.copyWith(
                                    fontSize: 14.sp,
                                    color: blueDark2,
                                  ),
                        ),
                        controller: authController.emailController,
                        preFixWidget: Icon(
                          Icons.email_outlined,
                          color: greyDart2,
                        ),
                        keyboardType: TextInputType.emailAddress,
                        hindText: "Enter your email",
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Please Enter you email";
                          }
                          if (!value.isEmail) {
                            return "Please proper email";
                          }
                          return null;
                        },
                      ),
                      sizedBoxHeight(height: 16),
                      AppTextFieldWithHeading(
                        headingWidget: CustomText(
                          "Password",
                          style:
                              Helper(context).textTheme.labelMedium?.copyWith(
                                    fontSize: 14.sp,
                                    color: blueDark2,
                                  ),
                        ),
                        controller: authController.passwordController,
                        textInputAction: TextInputAction.done,
                        preFixWidget: Icon(
                          Icons.lock_outline_rounded,
                          color: greyDart2,
                        ),
                        keyboardType: TextInputType.text,
                        hindText: "Enter your password",
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Please Enter you password";
                          }
                          return null;
                        },
                      ),
                      sizedBoxHeight(height: 16),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          CustomText(
                            "Forgot Password?",
                            style:
                                Helper(context).textTheme.labelSmall?.copyWith(
                                      fontSize: 16.sp,
                                      color: blueLight3,
                                    ),
                          ),
                        ],
                      ),
                      sizedBoxHeight(height: 16),
                      CustomButton(
                        height: 56,
                        radius: 14,
                        onTap: () {},
                        child: CustomText(
                          "Sign In",
                          style: Helper(context)
                              .textTheme
                              .labelSmall
                              ?.copyWith(fontSize: 16.sp, color: white),
                        ),
                      ),
                      sizedBoxHeight(height: 32),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CustomText(
                            "Don't have an account? ",
                            style: Helper(context)
                                .textTheme
                                .bodySmall
                                ?.copyWith(fontSize: 16.sp, color: greyDart2),
                          ),
                          CustomButton(
                            onTap: () {},
                            type: ButtonType.tertiary,
                            child: CustomText(
                              "Create Account",
                              style:
                                  Helper(context).textTheme.bodyLarge?.copyWith(
                                        fontSize: 16.sp,
                                        color: blueLight3,
                                      ),
                            ),
                          ),
                        ],
                      )
                    ],
                  );
                }),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

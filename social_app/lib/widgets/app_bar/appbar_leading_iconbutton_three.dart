import 'package:ntwampe_s_application1/widgets/custom_icon_button.dart';
import 'package:flutter/material.dart';
import 'package:ntwampe_s_application1/core/app_export.dart';

// ignore: must_be_immutable
class AppbarLeadingIconbuttonThree extends StatelessWidget {
  AppbarLeadingIconbuttonThree({
    Key? key,
    this.imagePath,
    this.margin,
    this.onTap,
  }) : super(
          key: key,
        );

  String? imagePath;

  EdgeInsetsGeometry? margin;

  Function? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTap!.call();
      },
      child: Padding(
        padding: margin ?? EdgeInsets.zero,
        child: CustomIconButton(
          height: 38.adaptSize,
          width: 38.adaptSize,
          decoration: IconButtonStyleHelper.fillWhiteA,
          child: CustomImageView(
            imagePath: ImageConstant.imgArrowLeft,
          ),
        ),
      ),
    );
  }
}

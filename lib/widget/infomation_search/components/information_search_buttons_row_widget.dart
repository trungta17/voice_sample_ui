import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:plover/plover.dart';
import 'package:voice_ui/const/app_color.dart';
import 'package:voice_ui/const/app_text_stype.dart';

class InformationSearchButtonsRow extends StatelessWidget {
  const InformationSearchButtonsRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Button(
          boxDecoration: BoxDecoration(
            borderRadius: BorderRadius.all(
              Radius.circular(18.r),
            ),
            color: AppColors.buttonMainColor,
          ),
          text: "Keyword",
          textStyle: AppTextStype.font60Weight400,
          // buttonColor: ,
          onPressed: () {},
        )
      ],
    );
  }
}

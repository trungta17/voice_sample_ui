import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:plover/plover.dart';
import 'package:voice_ui/const/app_text_stype.dart';

class TimeDifferent extends StatelessWidget {
  final Duration timeDifference;

  const TimeDifferent({
    Key? key,
    required this.timeDifference,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Extract hours and minutes from the Duration object
    final int hours = timeDifference.inHours;
    final int minutes = timeDifference.inMinutes.remainder(60); // Remainder gives the minutes left after full hours

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        WMarquee(
          text: "Time Difference",
          style: AppTextStype.font60Weight600,
        ),
        Row(
          children: [
            RichText(
              text: TextSpan(
                style: AppTextStype.font120Weight400,
                children: [
                  TextSpan(
                    text: hours.toString().padLeft(2, '0'),  // Ensure 2 digits for hours
                    style: AppTextStype.font120Weight600,
                  ),
                  TextSpan(
                    text: "hrs",
                    style: AppTextStype.font60Weight400,
                  ),
                ],
              ),
            ),
            SizedBox(
              width: 32.w,
            ),
            RichText(
              text: TextSpan(
                style: AppTextStype.font120Weight400,
                children: [
                  TextSpan(
                    text: minutes.toString().padLeft(2, '0'), // Ensure 2 digits for minutes
                    style: AppTextStype.font120Weight600,
                  ),
                  TextSpan(
                    text: "min",
                    style: AppTextStype.font60Weight400,
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}

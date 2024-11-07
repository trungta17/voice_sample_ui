import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:plover/plover.dart';
import 'package:voice_ui/const/app_color.dart';
import 'package:intl/intl.dart';

class TimeAndPlace extends StatelessWidget {
  final String location;
  final DateTime dateTime;

  const TimeAndPlace({
    super.key,
    required this.location,
    required this.dateTime,
  });

  @override
  Widget build(BuildContext context) {
    final String formattedTime = DateFormat('HH:mm').format(dateTime);
    final String formattedDate = DateFormat('EEEE, d MMMM').format(dateTime);
    final String formattedYear = DateFormat('y').format(dateTime);

    return Column(
      children: [
        WMarquee(
          text: location,
          style: TextStyle(
            color: AppColors.white,
            fontSize: 60.sp,
          ),
        ),
        WMarquee(
          text: formattedTime,
          style: TextStyle(
            color: AppColors.white,
            fontSize: 180.sp,
          ),
        ),
        WMarquee(
          text: formattedDate,
          style: TextStyle(
            color: AppColors.textLight,
            fontSize: 60.sp,
          ),
        ),
        WMarquee(
          text: formattedYear,
          style: TextStyle(
            color: AppColors.textLight,
            fontSize: 60.sp,
          ),
        ),
      ],
    );
  }
}

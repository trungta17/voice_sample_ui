import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:voice_ui/screens/infomation_search/components/information_search_buttons_row_widget.dart';
import 'package:voice_ui/screens/infomation_search/components/time_and_place_widget.dart';
import 'package:voice_ui/screens/infomation_search/components/time_different_widget.dart';

class InfomationSearchScreen extends StatelessWidget {
  const InfomationSearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 66.h,
        ),
        ElevatedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text('back'),
        ),
        Container(
          // color: AppColors.white,
          padding: EdgeInsets.symmetric(horizontal: 354.w),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TimeAndPlace(
                location: "London, England, UK",
                dateTime: DateTime(2015, 7, 9, 1, 50),
              ),
              const TimeDifferent(
                timeDifference: Duration(
                  hours: 8,
                  minutes: 0,
                ),
              ),
              TimeAndPlace(
                location: "London, England, UK",
                dateTime: DateTime(2015, 7, 9, 1, 50),
              ),
            ],
          ),
        ),
        const InformationSearchButtonsRow(),
      ],
    );
  }
}

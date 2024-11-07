import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:plover/plover.dart';
import 'package:voice_ui/const/app_color.dart';
import 'package:voice_ui/const/app_images.dart';
import 'package:voice_ui/const/app_text_stype.dart';

class WeatherForecast extends StatelessWidget {
  const WeatherForecast({super.key});

  @override
  Widget build(BuildContext context) {
    // return ListView.builder(
    //   // mainAxisAlignment: MainAxisAlignment.center,
    //   scrollDirection: Axis.horizontal,
    //   itemCount: 10,
    //   itemBuilder: (context, index) => const WeatherForecastItem(),
    // );

    // return SingleChildScrollView(
    //   scrollDirection: Axis.horizontal,
    //   child: const Row(
    //     // mainAxisAlignment: MainAxisAlignment.center,
    //     children: [
    //       WeatherForecastItem(),
    //       WeatherForecastItem(),
    //       WeatherForecastItem(),
    //       WeatherForecastItem(),
    //       // WeatherForecastItem(),
    //       // WeatherForecastItem(),
    //       // WeatherForecastItem(),
    //       // WeatherForecastItem(),
    //       // WeatherForecastItem(),
    //       // WeatherForecastItem(),
    //     ],
    //   ),
    // );

    return SizedBox(
      height: 460.h,
      child: WCarousel(
        children: List<Widget>.generate(
          10,
          (index) => WeatherForecastItem(
            index: index,
          ),
        ),
      ),
    );
  }
}

class WeatherForecastItem extends StatelessWidget {
  const WeatherForecastItem({
    super.key,
    required int index,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 460.w,
      decoration: const BoxDecoration(
        border: Border(
          right: BorderSide(
            color: AppColors.normal,
            width: 1,
          ),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            "30 Test test",
            style: AppTextStype.font54Weight600.copyWith(
              color: AppColors.normal.withOpacity(0.7),
            ),
          ),
          SizedBox(
            height: 66.h,
          ),
          Image.asset(
            AppImages.rain,
            height: 180.h,
          ),
          SizedBox(
            height: 33.h,
          ),
          Text(
            "15 | 17",
            style: AppTextStype.font54Weight400.copyWith(
              color: AppColors.normal.withOpacity(0.7),
            ),
          ),
          Text(
            "Some text",
            style: AppTextStype.font54Weight400.copyWith(
              color: AppColors.normal.withOpacity(0.7),
            ),
          ),
        ],
      ),
    );
  }
}

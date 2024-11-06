import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:voice_ui/const/app_color.dart';
import 'package:voice_ui/const/app_images.dart';
import 'package:voice_ui/const/app_text_stype.dart';

class DeviceInfoWidget extends StatelessWidget {
  const DeviceInfoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: 30.h,
        horizontal: 50.w,
      ),
      decoration: BoxDecoration(
        border: Border.all(
          color: AppColors.white,
          width: 2,
        ),
        borderRadius: BorderRadius.circular(
          20.r,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Device name",
            style: AppTextStype.font54Weight600.copyWith(
              color: AppColors.normal,
            ),
          ),
          SizedBox(
            height: 85.h,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Image.asset(
                    AppImages.airPurifier,
                    width: 180.w,
                    height: 180.h,
                  ),
                  SizedBox(
                    height: 37.h,
                  ),
                  Text(
                    "Device name",
                    style: AppTextStype.font54Weight400.copyWith(
                      color: AppColors.normal.withOpacity(0.7),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 12.w,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "Test 123456",
                      style: AppTextStype.font42Weight400.copyWith(
                        color: AppColors.normal.withOpacity(0.7),
                      ),
                    ),
                    SizedBox(
                      height: 18.h,
                    ),
                    Text(
                      "123",
                      style: AppTextStype.font42Weight400.copyWith(
                        color: AppColors.normal.withOpacity(0.7),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 12.w,
                ),
                child: Column(
                  children: [
                    Text(
                      "Test 123456",
                      style: AppTextStype.font42Weight400,
                    ),
                    SizedBox(
                      height: 18.h,
                    ),
                    Text(
                      "123",
                      style: AppTextStype.font42Weight400,
                    ),
                  ],
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:plover/plover.dart';
import 'package:voice_ui/const/app_color.dart';
import 'package:voice_ui/const/app_images.dart';
import 'package:voice_ui/const/app_text_stype.dart';
import 'package:voice_ui/screens/weather/components/device_info_widget.dart';

class WeatherScreen extends StatefulWidget {
  const WeatherScreen({super.key});

  @override
  State<WeatherScreen> createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  Widget _informationTitle({required String title}) {
    return Expanded(
      flex: 1,
      child: Text(
        title,
        textAlign: TextAlign.center,
        style: AppTextStype.font68Weight700,
      ),
    );
  }

  Widget _informationContent({
    required String content,
    TextStyle? informationStyle,
  }) {
    return Expanded(
      flex: 1,
      child: Text(
        content,
        textAlign: TextAlign.center,
        style: informationStyle ??
            AppTextStype.font78Weight400.copyWith(
              color: AppColors.textLight,
            ),
      ),
    );
  }

  Widget _informationWidget({
    required String title,
    required String infomation,
    TextStyle? informationStyle,
  }) {
    return Expanded(
      flex: 1,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.max,
        children: [
          Text(
            title,
            textAlign: TextAlign.center,
            style: AppTextStype.font68Weight700,
          ),
          SizedBox(
            height: 24.h,
          ),
          Text(
            infomation,
            textAlign: TextAlign.center,
            style: informationStyle ??
                AppTextStype.font78Weight400.copyWith(
                  color: AppColors.textLight,
                ),
          ),
        ],
      ),
    );
  }

  Widget _weatherInfo() {
    return Expanded(
      flex: 4,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Today, 1:51 PM Seoul",
            style: AppTextStype.font54Weight600,
          ),
          SizedBox(
            height: 30.h,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(
                AppImages.sunny,
                height: 360.w,
                width: 360.w,
              ),
              SizedBox(
                width: 48.w,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  WMarquee(
                    text: "Partly sunny",
                    style: AppTextStype.font68Weight600,
                  ),
                  SizedBox(
                    height: 40.h,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "25",
                        style: AppTextStype.font180Weight600,
                      ),
                      Text(
                        "C",
                        style: AppTextStype.font108Weight600,
                      ),
                    ],
                  ),
                ],
              )
            ],
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.black,
      body: Container(
        padding: EdgeInsets.only(
          top: 50.h,
          left: 50.w,
          right: 50.w,
        ),
        child: Column(
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
             SizedBox(
              height: 66.h,
            ),
            Row(
              children: [
                const DeviceInfoWidget(),
                SizedBox(
                  width: 200.w,
                ),
                _weatherInfo(),
                Expanded(
                  flex: 8,
                  child: IntrinsicHeight(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _informationWidget(
                            title: "Air quality",
                            infomation: "38µg/m³ (Moderate)",
                            informationStyle:
                                AppTextStype.font52Weight400.copyWith(
                              color: AppColors.textGreen,
                            )),
                        _informationWidget(
                          title: "Precipitation Probability",
                          infomation: "35%",
                        ),
                        _informationWidget(
                          title: "Humidity",
                          infomation: "35",
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:voice_ui/const/app_color.dart';
import 'package:voice_ui/screens/weather/components/weather_chart_widget.dart';

class WeatherChartScreen extends StatefulWidget {
  const WeatherChartScreen({super.key});

  @override
  State<WeatherChartScreen> createState() => _WeatherChartScreenState();
}

class _WeatherChartScreenState extends State<WeatherChartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.black,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text('back'),
          ),
          SizedBox(
            height: 66.h,
          ),
          WeatherChart(
            chartPoints: const [
              ChartPoint(x: 0, y: 4),
              ChartPoint(x: 1, y: 3),
              ChartPoint(x: 2, y: 5),
              ChartPoint(x: 3, y: 4),
              ChartPoint(x: 4, y: 5),
              ChartPoint(x: 5, y: 25),
              ChartPoint(x: 6, y: 2),
              ChartPoint(x: 7, y: 6),
              ChartPoint(x: 8, y: 4),
              ChartPoint(x: 9, y: 6),
              ChartPoint(x: 10, y: 6),
              ChartPoint(x: 11, y: 20),
            ],
          ),
        ],
      ),
    );
  }
}

class TestWidget extends StatelessWidget {
  const TestWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

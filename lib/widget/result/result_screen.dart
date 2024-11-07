import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:voice_ui/const/app_color.dart';
import 'package:voice_ui/widget/result/components/cities_carousel_widget.dart';
import 'package:voice_ui/widget/result/components/movie_carousel_widget.dart';
import 'package:voice_ui/widget/result/components/result_tabs_widget.dart';

class ResultScreen extends StatefulWidget {
  const ResultScreen({super.key});
  @override
  State<ResultScreen> createState() => _ResultScreen();
}

class _ResultScreen extends State<ResultScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.black,
      body: SingleChildScrollView(
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
            const ResultTabs(),
            SizedBox(
              height: 66.h,
            ),
            const MoviesCarousel(),
            SizedBox(
              height: 66.h,
            ),
            const CitiesCarousel(),
            SizedBox(
              height: 66.h,
            ),
          ],
        ),
      ),
    );
  }
}

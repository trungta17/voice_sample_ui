import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:plover/plover.dart';
import 'package:voice_ui/screens/infomation_search/infomation_search_screen.dart';
import 'package:voice_ui/screens/result/result_screen.dart';
import 'package:voice_ui/screens/weather/weather_chart_screen.dart';
import 'package:voice_ui/screens/weather/weather_screen.dart';

// void main() {
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo',
//       theme: ThemeData(
//         colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
//         useMaterial3: true,
//       ),
//       home: const ScreenUtilInit(
//         designSize: Size(3840, 2160),
//         child: MyHomePage(),
//       ),
//     );
//   }
// }

// class MyHomePage extends StatefulWidget {
//   const MyHomePage({super.key});

//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   @override
//   Widget build(BuildContext context) {
//     return const FocusRootScope(
//       child:
//           ResultScreen(),
//           // WeatherScreen(),
//           // WeatherChartScreen(),
//     );
//   }
// }

void main() {
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(3840, 2160),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) => MaterialApp(
        home: Builder(builder: (context) {
          return FocusRootScope(
            child: Scaffold(
              backgroundColor: Colors.black,
              body: Center(
                child: Column(
                  children: [
                    SizedBox(
                      height: 50.h,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const ResultScreen()),
                        );
                      },
                      child: const Text('Go to result screen'),
                    ),
                    SizedBox(
                      height: 50.h,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const WeatherScreen()),
                        );
                      },
                      child: const Text('Go to weather screen'),
                    ),
                    SizedBox(
                      height: 50.h,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const WeatherChartScreen()),
                        );
                      },
                      child: const Text('Go to weather chart screen'),
                    ),
                    SizedBox(
                      height: 50.h,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                const InfomationSearchScreen(),
                          ),
                        );
                      },
                      child: const Text('Go to information search screen'),
                    ),
                  ],
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}

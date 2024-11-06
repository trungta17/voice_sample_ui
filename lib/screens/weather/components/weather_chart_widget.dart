import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:voice_ui/const/app_color.dart';

class ChartPoint {
  final int x;
  final int y;

  const ChartPoint({
    required this.x,
    required this.y,
  });
}

class WeatherChart extends StatelessWidget {
  final int chartAnimationDuration;
  final List<ChartPoint> chartPoints;
  final Color mainLineColor = AppColors.normal;
  final Color topBotAnnotationColor = const Color(0xFFFF00F7).withOpacity(0.3);
  final Color middleAnnotationColor = const Color(0xFF3078AD).withOpacity(0.3);
  final Color horizontalLineColor = const Color(0xFF00FFDC);
  final Color leftTitleColor = const Color(0xFF00FFDC);
  final Color belowBarDataColor = const Color(0xFFD8D8D8).withOpacity(0.1);
  final bool isColorfulChart;

  WeatherChart({
    super.key,
    this.chartAnimationDuration = 2000,
    required this.chartPoints,
    this.isColorfulChart = true,
  });

  List<FlSpot> _convertChartPointsToFlSpots(List<ChartPoint> chartPoints) {
    return chartPoints
        .map(
          (point) => FlSpot(
            point.x.toDouble(),
            point.y.toDouble(),
          ),
        )
        .toList();
  }

  Widget _bottomTitleWidgets(double value, TitleMeta meta) {
    return SideTitleWidget(
      axisSide: meta.axisSide,
      space: 4,
      child: Text(
        value.toInt().toString(),
        style: TextStyle(
          fontSize: 54.sp,
          color: AppColors.normal,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }

  /// Show dot and data on the line
  LineTouchData _drawTooltip() {
    return LineTouchData(
      enabled: true,
      handleBuiltInTouches: false,
      getTouchedSpotIndicator:
          (LineChartBarData barData, List<int> spotIndexes) {
        return spotIndexes.map((index) {
          return TouchedSpotIndicatorData(
            const FlLine(
              color: Colors.transparent,
            ),
            FlDotData(
              show: true,
              getDotPainter: (spot, percent, barData, index) =>
                  FlDotCirclePainter(
                radius: 18.w,
                color: mainLineColor,
              ),
            ),
          );
        }).toList();
      },
      touchTooltipData: LineTouchTooltipData(
        getTooltipColor: (touchedSpot) => Colors.transparent,
        tooltipRoundedRadius: 8,
        getTooltipItems: (List<LineBarSpot> lineBarsSpot) {
          return lineBarsSpot.map((lineBarSpot) {
            return LineTooltipItem(
              lineBarSpot.y.toString(),
              TextStyle(
                color: mainLineColor.withOpacity(0.7),
                fontSize: 40.sp,
                fontWeight: FontWeight.w600,
              ),
            );
          }).toList();
        },
      ),
    );
  }

  AxisTitles _drawChartBottomTitles() {
    return AxisTitles(
      sideTitles: SideTitles(
        showTitles: true,
        reservedSize: 120.h,
        interval: 1,
        getTitlesWidget: _bottomTitleWidgets,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    int minValueY =
        chartPoints.map((data) => data.y).reduce((a, b) => a < b ? a : b);
    int maxValueY =
        chartPoints.map((data) => data.y).reduce((a, b) => a > b ? a : b);
    int yAxisValueInterval = ((maxValueY - minValueY) / 3).round();
    int oneThirdChartValueY = minValueY + yAxisValueInterval;
    int twoThirdChartValueY = oneThirdChartValueY + yAxisValueInterval;
    final List<int> showingDotOnSpots =
        chartPoints.map((chartPoint) => chartPoint.x).toList();

    AxisTitles drawChartLeftTitles() {
      return AxisTitles(
        axisNameSize: 20,
        sideTitles: SideTitles(
          showTitles: isColorfulChart ? true : false,
          interval: 1,
          reservedSize: 140.w,
          getTitlesWidget: (double value, TitleMeta meta) {
            if (value == oneThirdChartValueY ||
                value == twoThirdChartValueY ||
                value == minValueY ||
                value == maxValueY) {
              return SideTitleWidget(
                axisSide: meta.axisSide,
                space: 0,
                child: Row(
                  children: [
                    Text(
                      value.toInt().toString(),
                      style: TextStyle(
                        color: leftTitleColor,
                        fontSize: 40.sp,
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                    SizedBox(
                      width: 10.w,
                    ),
                    Expanded(
                      child: Container(
                        height: 1,
                        color: horizontalLineColor,
                      ),
                    ),
                  ],
                ),
              );
            }
            return const SizedBox.shrink();
          },
        ),
      );
    }

    FlTitlesData drawChartTitles() {
      return FlTitlesData(
        show: true,
        topTitles: const AxisTitles(
          sideTitles: SideTitles(
            showTitles: false,
          ),
        ),
        rightTitles: const AxisTitles(
          sideTitles: SideTitles(
            showTitles: false,
          ),
        ),
        bottomTitles: _drawChartBottomTitles(),
        leftTitles: drawChartLeftTitles(),
      );
    }

    /// Handle drawing the main line of the chart
    LineChartBarData getLineChartBarData() {
      return LineChartBarData(
        belowBarData: BarAreaData(
          color: belowBarDataColor,
          show: isColorfulChart ? false : true,
        ),
        showingIndicators: showingDotOnSpots,
        spots: _convertChartPointsToFlSpots(chartPoints),
        isCurved: false,
        barWidth: 4,
        color: mainLineColor,
        dotData: const FlDotData(
          show: false,
        ),
      );
    }

    RangeAnnotations drawChartRangeAnnotation() {
      return RangeAnnotations(
        horizontalRangeAnnotations: [
          HorizontalRangeAnnotation(
            y1: minValueY.toDouble(),
            y2: oneThirdChartValueY.toDouble(),
            color: topBotAnnotationColor,
          ),
          HorizontalRangeAnnotation(
            y1: oneThirdChartValueY.toDouble(),
            y2: twoThirdChartValueY.toDouble(),
            color: middleAnnotationColor,
          ),
          HorizontalRangeAnnotation(
            y1: twoThirdChartValueY.toDouble(),
            y2: maxValueY.toDouble(),
            color: topBotAnnotationColor,
          ),
        ],
        verticalRangeAnnotations: [
          VerticalRangeAnnotation(
            x1: -1,
            x2: 0,
            color: Colors.transparent,
          ),
        ],
      );
    }

    ExtraLinesData drawIndicatorLine() {
      return ExtraLinesData(
        horizontalLines: [
          HorizontalLine(
            y: minValueY.toDouble(),
            strokeWidth: 1,
            color: horizontalLineColor,
          ),
          HorizontalLine(
            y: oneThirdChartValueY.toDouble(),
            strokeWidth: 1,
            color: horizontalLineColor,
          ),
          HorizontalLine(
            y: twoThirdChartValueY.toDouble(),
            strokeWidth: 1,
            color: horizontalLineColor,
          ),
          HorizontalLine(
            y: maxValueY.toDouble(),
            strokeWidth: 1,
            color: horizontalLineColor,
          ),
        ],
      );
    }

    return AspectRatio(
      aspectRatio: 5,
      child: Padding(
        padding: EdgeInsets.only(
          left: 300.w,
          right: 513.w,
        ),
        child: LineChart(
          duration: Duration(
            milliseconds: chartAnimationDuration,
          ),
          LineChartData(
            extraLinesData: isColorfulChart ? drawIndicatorLine() : null,
            showingTooltipIndicators: showingDotOnSpots.map((index) {
              return ShowingTooltipIndicators([
                LineBarSpot(
                  getLineChartBarData(),
                  0,
                  getLineChartBarData().spots[index],
                ),
              ]);
            }).toList(),
            rangeAnnotations:
                isColorfulChart ? drawChartRangeAnnotation() : null,
            lineTouchData: _drawTooltip(),
            lineBarsData: [
              getLineChartBarData(), // data to draw the main line
            ],
            titlesData: drawChartTitles(),
            borderData: FlBorderData(
              show: false,
            ),
            gridData: const FlGridData(
              show: false,
            ),
          ),
        ),
      ),
    );
  }
}

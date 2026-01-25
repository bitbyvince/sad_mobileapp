import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fl_chart/fl_chart.dart';

class HighRiskAlertScreen extends StatelessWidget {
  const HighRiskAlertScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFD32F2F),
      body: SafeArea(
        child: Column(
          children: [
            // Header with back button
            Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: 40.w,
                    height: 40.w,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12.r),
                    ),
                    child: IconButton(
                      icon: Icon(
                        Icons.menu,
                        color: const Color(0xFFD32F2F),
                        size: 24.sp,
                      ),
                      onPressed: () {},
                    ),
                  ),
                  Column(
                    children: [
                      Text(
                        'High Risk Alert',
                        style: TextStyle(
                          fontSize: 20.sp,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(height: 4.h),
                      Text(
                        'Metro Manila',
                        style: TextStyle(fontSize: 14.sp, color: Colors.white),
                      ),
                    ],
                  ),
                  Container(
                    width: 40.w,
                    height: 40.w,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12.r),
                    ),
                    child: IconButton(
                      icon: Icon(
                        Icons.arrow_back,
                        color: const Color(0xFFD32F2F),
                        size: 24.sp,
                      ),
                      onPressed: () => Navigator.of(context).pop(),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                padding: EdgeInsets.all(16.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Alert Message Card
                    Container(
                      width: double.infinity,
                      padding: EdgeInsets.all(20.w),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(16.r),
                      ),
                      child: Text(
                        'Multiple respiratory diseases are showing increased transmission rates in your area. Please take extra precautions when going outdoors.',
                        style: TextStyle(
                          fontSize: 16.sp,
                          color: const Color(0xFFFFEBEE).withOpacity(0.8),
                          height: 1.5,
                        ),
                      ),
                    ),
                    SizedBox(height: 24.h),
                    // Affected Diseases Section
                    Text(
                      'Affected Diseases',
                      style: TextStyle(
                        fontSize: 18.sp,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height: 16.h),
                    _buildDiseaseCard(
                      'COVID-19',
                      '842 active cases',
                      '+24% in last 7 days',
                    ),
                    SizedBox(height: 12.h),
                    _buildDiseaseCard(
                      'Influenza',
                      '678 active cases',
                      '+19% in last 7 days',
                    ),
                    SizedBox(height: 12.h),
                    _buildDiseaseCard(
                      'Tuberculosis',
                      '447 active cases',
                      '+11% in last 7 days',
                    ),
                    SizedBox(height: 24.h),
                    // Recent Case Trend Section
                    Text(
                      'Recent Case Trend',
                      style: TextStyle(
                        fontSize: 18.sp,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height: 16.h),
                    Container(
                      width: double.infinity,
                      padding: EdgeInsets.all(20.w),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(16.r),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Combined Cases (Jan 3 - Jan 20)',
                            style: TextStyle(
                              fontSize: 14.sp,
                              color: const Color(0xFFFFEBEE).withOpacity(0.8),
                            ),
                          ),
                          SizedBox(height: 16.h),
                          SizedBox(
                            height: 200.h,
                            child: LineChart(
                              LineChartData(
                                gridData: FlGridData(
                                  show: true,
                                  drawVerticalLine: false,
                                  horizontalInterval: 500,
                                  getDrawingHorizontalLine: (value) {
                                    return FlLine(
                                      color: Colors.grey.withOpacity(0.2),
                                      strokeWidth: 1,
                                    );
                                  },
                                ),
                                titlesData: FlTitlesData(
                                  show: true,
                                  rightTitles: const AxisTitles(
                                    sideTitles: SideTitles(showTitles: false),
                                  ),
                                  topTitles: const AxisTitles(
                                    sideTitles: SideTitles(showTitles: false),
                                  ),
                                  bottomTitles: AxisTitles(
                                    sideTitles: SideTitles(
                                      showTitles: true,
                                      reservedSize: 30,
                                      getTitlesWidget: (value, meta) {
                                        final dates = [
                                          'Jan 3',
                                          'Jan 6',
                                          'Jan 9',
                                          'Jan 15',
                                          'Jan 20',
                                        ];
                                        final index = value.toInt();
                                        if (index >= 0 &&
                                            index < dates.length) {
                                          return Padding(
                                            padding: EdgeInsets.only(top: 8.h),
                                            child: Text(
                                              dates[index],
                                              style: TextStyle(
                                                fontSize: 10.sp,
                                                color: Colors.grey,
                                              ),
                                            ),
                                          );
                                        }
                                        return const Text('');
                                      },
                                    ),
                                  ),
                                  leftTitles: AxisTitles(
                                    sideTitles: SideTitles(
                                      showTitles: true,
                                      reservedSize: 50,
                                      getTitlesWidget: (value, meta) {
                                        return Text(
                                          value.toInt().toString(),
                                          style: TextStyle(
                                            fontSize: 10.sp,
                                            color: Colors.grey,
                                          ),
                                        );
                                      },
                                    ),
                                  ),
                                ),
                                borderData: FlBorderData(
                                  show: true,
                                  border: Border.all(
                                    color: Colors.grey.withOpacity(0.2),
                                  ),
                                ),
                                minX: 0,
                                maxX: 4,
                                minY: 0,
                                maxY: 2000,
                                lineBarsData: [
                                  LineChartBarData(
                                    spots: [
                                      const FlSpot(0, 1200),
                                      const FlSpot(1, 1400),
                                      const FlSpot(2, 1600),
                                      const FlSpot(3, 1800),
                                      const FlSpot(4, 1967),
                                    ],
                                    isCurved: true,
                                    color: const Color(0xFFD32F2F),
                                    barWidth: 3,
                                    isStrokeCapRound: true,
                                    dotData: const FlDotData(show: false),
                                    belowBarData: BarAreaData(
                                      show: true,
                                      color: const Color(
                                        0xFFD32F2F,
                                      ).withOpacity(0.1),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 24.h),
                    // Safety Guidance Section
                    Text(
                      'Safety Guidance',
                      style: TextStyle(
                        fontSize: 18.sp,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height: 16.h),
                    Container(
                      width: double.infinity,
                      padding: EdgeInsets.all(20.w),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(16.r),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _buildGuidanceItem(
                            'Wear a properly fitted mask when in public spaces, especially indoors',
                          ),
                          SizedBox(height: 12.h),
                          _buildGuidanceItem(
                            'Maintain physical distance and avoid crowded areas when possible',
                          ),
                          SizedBox(height: 12.h),
                          _buildGuidanceItem(
                            'Practice frequent hand washing and use hand sanitizer regularly',
                          ),
                          SizedBox(height: 12.h),
                          _buildGuidanceItem(
                            'Monitor your health and seek medical attention if symptoms develop',
                          ),
                          SizedBox(height: 12.h),
                          _buildGuidanceItem(
                            'Stay informed with daily updates through RespiraTrack',
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 24.h),
                    // I Understand Button
                    SizedBox(
                      width: double.infinity,
                      height: 50.h,
                      child: ElevatedButton(
                        onPressed: () => Navigator.of(context).pop(),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12.r),
                          ),
                        ),
                        child: Text(
                          'I Understand',
                          style: TextStyle(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.bold,
                            color: const Color(0xFFD32F2F),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 24.h),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDiseaseCard(String disease, String cases, String trend) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                disease,
                style: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.bold,
                  color: const Color(0xFFFFEBEE).withOpacity(0.8),
                ),
              ),
              SizedBox(height: 4.h),
              Text(
                trend,
                style: TextStyle(
                  fontSize: 14.sp,
                  color: const Color(0xFFFFEBEE).withOpacity(0.8),
                ),
              ),
            ],
          ),
          Text(
            cases,
            style: TextStyle(
              fontSize: 16.sp,
              fontWeight: FontWeight.bold,
              color: const Color(0xFFFFEBEE).withOpacity(0.8),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildGuidanceItem(String text) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: EdgeInsets.only(top: 6.h, right: 12.w),
          width: 6.w,
          height: 6.w,
          decoration: BoxDecoration(
            color: const Color(0xFFFFEBEE).withOpacity(0.8),
            shape: BoxShape.circle,
          ),
        ),
        Expanded(
          child: Text(
            text,
            style: TextStyle(
              fontSize: 14.sp,
              color: const Color(0xFFFFEBEE).withOpacity(0.8),
              height: 1.5,
            ),
          ),
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class StatusTab extends StatelessWidget {
  const StatusTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Blue Header Section
        Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: const Color(0xFF2196F3),
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(30.r),
              bottomRight: Radius.circular(30.r),
            ),
          ),
          child: SafeArea(
            bottom: false,
            child: Padding(
              padding: EdgeInsets.fromLTRB(24.w, 16.h, 24.w, 24.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Status',
                          style: TextStyle(
                            fontSize: 28.sp,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(height: 4.h),
                        Text(
                          'Track your reported cases',
                          style: TextStyle(
                            fontSize: 16.sp,
                            color: Colors.white.withOpacity(0.9),
                          ),
                        ),
                      ],
                    ),
                  ),
                  // Notification Icon
                  Container(
                    width: 40.w,
                    height: 40.w,
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.2),
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.white, width: 2),
                    ),
                    child: IconButton(
                      icon: Icon(
                        Icons.notifications_outlined,
                        color: Colors.white,
                        size: 20.sp,
                      ),
                      onPressed: () {
                        // Handle notification
                      },
                      padding: EdgeInsets.zero,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        // Main Content
        Expanded(
          child: SingleChildScrollView(
            padding: EdgeInsets.all(24.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Status Summary Cards
                Row(
                  children: [
                    Expanded(
                      child: _buildStatusSummaryCard(
                        count: '1',
                        label: 'Pending',
                        color: Colors.orange,
                      ),
                    ),
                    SizedBox(width: 12.w),
                    Expanded(
                      child: _buildStatusSummaryCard(
                        count: '1',
                        label: 'Under Review',
                        color: const Color(0xFF2196F3),
                      ),
                    ),
                    SizedBox(width: 12.w),
                    Expanded(
                      child: _buildStatusSummaryCard(
                        count: '1',
                        label: 'Action Taken',
                        color: const Color(0xFF4CAF50),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 24.h),
                // Green Alert Message (if any action taken)
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.all(16.w),
                  decoration: BoxDecoration(
                    color: const Color(0xFFE8F5E9),
                    borderRadius: BorderRadius.circular(12.r),
                  ),
                  child: Row(
                    children: [
                      Icon(
                        Icons.check_circle,
                        color: const Color(0xFF4CAF50),
                        size: 24.sp,
                      ),
                      SizedBox(width: 12.w),
                      Expanded(
                        child: Text(
                          'Health team deployed. Area sanitized. 12 contacts traced.',
                          style: TextStyle(
                            fontSize: 14.sp,
                            color: const Color(0xFF4CAF50),
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 24.h),
                // Your Reports Section
                Text(
                  'Your Reports',
                  style: TextStyle(
                    fontSize: 20.sp,
                    fontWeight: FontWeight.bold,
                    color: const Color(0xFF1A1A1A),
                  ),
                ),
                SizedBox(height: 16.h),
                // Report Cards
                _buildReportCard(
                  reportId: 'RPT-2026-00247',
                  status: 'Action Taken',
                  statusColor: const Color(0xFF4CAF50),
                  date: 'Jan 18, 2026 at 2:45 PM',
                  location: 'Quezon City, Metro Manila',
                  disease: 'COVID-19',
                  symptoms: ['Fever', 'Cough', 'Fatigue'],
                  statusMessage:
                      'Health team deployed. Area sanitized. 12 contacts traced.',
                  statusIcon: Icons.check_circle,
                  statusIconColor: const Color(0xFF4CAF50),
                ),
                SizedBox(height: 16.h),
                _buildReportCard(
                  reportId: 'RPT-2026-00198',
                  status: 'Under Review',
                  statusColor: const Color(0xFF2196F3),
                  date: 'Jan 15, 2026 at 10:30 AM',
                  location: 'Makati City, Metro Manila',
                  disease: 'Influenza',
                  symptoms: ['Fever', 'Body Aches', 'Headache'],
                  statusMessage:
                      'Medical team reviewing case. Investigation ongoing.',
                  statusIcon: Icons.visibility,
                  statusIconColor: const Color(0xFF2196F3),
                ),
                SizedBox(height: 16.h),
                _buildReportCard(
                  reportId: 'RPT-2026-00156',
                  status: 'Pending',
                  statusColor: Colors.orange,
                  date: 'Jan 12, 2026 at 4:15 PM',
                  location: 'Pasig City, Metro Manila',
                  disease: 'Tuberculosis',
                  symptoms: ['Cough', 'Fatigue', 'Loss of Taste'],
                  statusMessage:
                      'Report received. Awaiting assignment to health team.',
                  statusIcon: Icons.access_time,
                  statusIconColor: Colors.orange,
                ),
                SizedBox(height: 24.h),
                // Submit New Report Button
                SizedBox(
                  width: double.infinity,
                  height: 56.h,
                  child: ElevatedButton(
                    onPressed: () {
                      // Navigate to report tab or show report screen
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF4CAF50),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12.r),
                      ),
                      elevation: 0,
                    ),
                    child: Text(
                      'Submit New Report',
                      style: TextStyle(
                        fontSize: 18.sp,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 80.h), // Space for bottom navigation
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildStatusSummaryCard({
    required String count,
    required String label,
    required Color color,
  }) {
    return Container(
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(color: color.withOpacity(0.3), width: 1),
      ),
      child: Column(
        children: [
          Text(
            count,
            style: TextStyle(
              fontSize: 32.sp,
              fontWeight: FontWeight.bold,
              color: color,
            ),
          ),
          SizedBox(height: 4.h),
          Text(
            label,
            style: TextStyle(
              fontSize: 14.sp,
              fontWeight: FontWeight.w500,
              color: color,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget _buildReportCard({
    required String reportId,
    required String status,
    required Color statusColor,
    required String date,
    required String location,
    required String disease,
    required List<String> symptoms,
    required String statusMessage,
    required IconData statusIcon,
    required Color statusIconColor,
  }) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(20.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Report ID and Status
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Icon(
                    Icons.description_outlined,
                    color: const Color(0xFF1A1A1A),
                    size: 20.sp,
                  ),
                  SizedBox(width: 8.w),
                  Text(
                    reportId,
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.bold,
                      color: const Color(0xFF1A1A1A),
                    ),
                  ),
                ],
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
                decoration: BoxDecoration(
                  color: statusColor,
                  borderRadius: BorderRadius.circular(12.r),
                ),
                child: Text(
                  status,
                  style: TextStyle(
                    fontSize: 12.sp,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 16.h),
          // Date and Time
          Row(
            children: [
              Icon(
                Icons.access_time,
                color: const Color(0xFF666666),
                size: 16.sp,
              ),
              SizedBox(width: 8.w),
              Text(
                date,
                style: TextStyle(
                  fontSize: 14.sp,
                  color: const Color(0xFF666666),
                ),
              ),
            ],
          ),
          SizedBox(height: 12.h),
          // Location
          Row(
            children: [
              Icon(
                Icons.location_on,
                color: const Color(0xFF666666),
                size: 16.sp,
              ),
              SizedBox(width: 8.w),
              Text(
                location,
                style: TextStyle(
                  fontSize: 14.sp,
                  color: const Color(0xFF666666),
                ),
              ),
            ],
          ),
          SizedBox(height: 12.h),
          // Disease
          RichText(
            text: TextSpan(
              style: TextStyle(fontSize: 14.sp, color: const Color(0xFF1A1A1A)),
              children: [
                const TextSpan(text: 'Disease: '),
                TextSpan(
                  text: disease,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          SizedBox(height: 12.h),
          // Reported Symptoms
          Text(
            'Reported Symptoms:',
            style: TextStyle(fontSize: 14.sp, color: const Color(0xFF1A1A1A)),
          ),
          SizedBox(height: 8.h),
          Wrap(
            spacing: 8.w,
            runSpacing: 8.h,
            children: symptoms.map((symptom) {
              return Container(
                padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
                decoration: BoxDecoration(
                  color: const Color(0xFFF5F5F5),
                  borderRadius: BorderRadius.circular(12.r),
                ),
                child: Text(
                  symptom,
                  style: TextStyle(
                    fontSize: 12.sp,
                    color: const Color(0xFF1A1A1A),
                  ),
                ),
              );
            }).toList(),
          ),
          SizedBox(height: 16.h),
          // Status Message
          Container(
            padding: EdgeInsets.all(12.w),
            decoration: BoxDecoration(
              color: statusIconColor.withOpacity(0.1),
              borderRadius: BorderRadius.circular(12.r),
            ),
            child: Row(
              children: [
                Icon(statusIcon, color: statusIconColor, size: 20.sp),
                SizedBox(width: 8.w),
                Expanded(
                  child: Text(
                    statusMessage,
                    style: TextStyle(
                      fontSize: 14.sp,
                      color: statusIconColor,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

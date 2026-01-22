import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ReportTab extends StatefulWidget {
  const ReportTab({Key? key}) : super(key: key);

  @override
  State<ReportTab> createState() => _ReportTabState();
}

class _ReportTabState extends State<ReportTab> {
  bool _reportAnonymously = false;
  String? _selectedDisease;
  final Set<String> _selectedSymptoms = {};
  final TextEditingController _locationController = TextEditingController(
    text: 'Quezon City, Metro Manila',
  );
  final TextEditingController _additionalDetailsController =
      TextEditingController();

  final List<String> _symptoms = [
    'Fever',
    'Cough',
    'Shortness of Breath',
    'Fatigue',
    'Body Aches',
    'Headache',
    'Loss of Taste',
    'Sore Throat',
  ];

  final List<String> _diseases = [
    'COVID-19',
    'Influenza',
    'Tuberculosis',
    'Dengue',
    'Other',
  ];

  @override
  void dispose() {
    _locationController.dispose();
    _additionalDetailsController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          // Green Header Section
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: const Color(0xFF4CAF50),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(30.r),
                bottomRight: Radius.circular(30.r),
              ),
            ),
            child: SafeArea(
              bottom: false,
              child: Padding(
                padding: EdgeInsets.fromLTRB(24.w, 16.h, 24.w, 24.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Report Health Risk',
                      style: TextStyle(
                        fontSize: 28.sp,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height: 4.h),
                    Text(
                      'Help protect your community',
                      style: TextStyle(
                        fontSize: 16.sp,
                        color: Colors.white.withOpacity(0.9),
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
                  // Report Anonymously Section
                  Container(
                    width: double.infinity,
                    padding: EdgeInsets.all(16.w),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16.r),
                      border: Border.all(
                        color: const Color(0xFFE0E0E0),
                        width: 1,
                      ),
                    ),
                    child: Row(
                      children: [
                        Container(
                          width: 48.w,
                          height: 48.w,
                          decoration: BoxDecoration(
                            color: const Color(0xFFE3F2FD),
                            shape: BoxShape.circle,
                          ),
                          child: Icon(
                            Icons.person_add_outlined,
                            color: const Color(0xFF2196F3),
                            size: 24.sp,
                          ),
                        ),
                        SizedBox(width: 16.w),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Report Anonymously',
                                style: TextStyle(
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.bold,
                                  color: const Color(0xFF1A1A1A),
                                ),
                              ),
                              SizedBox(height: 4.h),
                              Text(
                                'Your identity will be protected.',
                                style: TextStyle(
                                  fontSize: 14.sp,
                                  color: const Color(0xFF666666),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Switch(
                          value: _reportAnonymously,
                          onChanged: (value) {
                            setState(() {
                              _reportAnonymously = value;
                            });
                          },
                          activeColor: const Color(0xFF4CAF50),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 24.h),
                  // Location Section
                  Text(
                    'Location',
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.bold,
                      color: const Color(0xFF1A1A1A),
                    ),
                  ),
                  SizedBox(height: 12.h),
                  Container(
                    decoration: BoxDecoration(
                      color: const Color(0xFFF5F5F5),
                      borderRadius: BorderRadius.circular(12.r),
                      border: Border.all(
                        color: const Color(0xFFE0E0E0),
                        width: 1,
                      ),
                    ),
                    child: TextField(
                      controller: _locationController,
                      style: TextStyle(fontSize: 16.sp),
                      decoration: InputDecoration(
                        hintText: 'Enter location',
                        hintStyle: TextStyle(
                          fontSize: 16.sp,
                          color: const Color(0xFF999999),
                        ),
                        prefixIcon: Icon(
                          Icons.location_on,
                          color: const Color(0xFF666666),
                          size: 20.sp,
                        ),
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.symmetric(
                          horizontal: 16.w,
                          vertical: 16.h,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 12.h),
                  GestureDetector(
                    onTap: () {
                      // Handle use current location
                    },
                    child: Row(
                      children: [
                        Icon(
                          Icons.my_location,
                          color: const Color(0xFF4CAF50),
                          size: 20.sp,
                        ),
                        SizedBox(width: 8.w),
                        Text(
                          'Use my current location',
                          style: TextStyle(
                            fontSize: 14.sp,
                            color: const Color(0xFF4CAF50),
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 24.h),
                  // Suspected Disease Section
                  Text(
                    'Suspected Disease',
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.bold,
                      color: const Color(0xFF1A1A1A),
                    ),
                  ),
                  SizedBox(height: 12.h),
                  Container(
                    decoration: BoxDecoration(
                      color: const Color(0xFFF5F5F5),
                      borderRadius: BorderRadius.circular(12.r),
                      border: Border.all(
                        color: const Color(0xFFE0E0E0),
                        width: 1,
                      ),
                    ),
                    child: DropdownButtonFormField<String>(
                      value: _selectedDisease,
                      decoration: InputDecoration(
                        hintText: 'Select disease type',
                        hintStyle: TextStyle(
                          fontSize: 16.sp,
                          color: const Color(0xFF999999),
                        ),
                        prefixIcon: Icon(
                          Icons.medical_services_outlined,
                          color: const Color(0xFF666666),
                          size: 20.sp,
                        ),
                        suffixIcon: Icon(
                          Icons.arrow_drop_down,
                          color: const Color(0xFF666666),
                        ),
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.symmetric(
                          horizontal: 16.w,
                          vertical: 16.h,
                        ),
                      ),
                      items: _diseases.map((disease) {
                        return DropdownMenuItem(
                          value: disease,
                          child: Text(
                            disease,
                            style: TextStyle(fontSize: 16.sp),
                          ),
                        );
                      }).toList(),
                      onChanged: (value) {
                        setState(() {
                          _selectedDisease = value;
                        });
                      },
                    ),
                  ),
                  SizedBox(height: 24.h),
                  // Symptoms Observed Section
                  Text(
                    'Symptoms Observed',
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.bold,
                      color: const Color(0xFF1A1A1A),
                    ),
                  ),
                  SizedBox(height: 12.h),
                  GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 12.w,
                      mainAxisSpacing: 12.h,
                      childAspectRatio: 2.5,
                    ),
                    itemCount: _symptoms.length,
                    itemBuilder: (context, index) {
                      final symptom = _symptoms[index];
                      final isSelected = _selectedSymptoms.contains(symptom);
                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            if (isSelected) {
                              _selectedSymptoms.remove(symptom);
                            } else {
                              _selectedSymptoms.add(symptom);
                            }
                          });
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color: isSelected
                                ? const Color(0xFFE8F5E9)
                                : Colors.white,
                            borderRadius: BorderRadius.circular(12.r),
                            border: Border.all(
                              color: isSelected
                                  ? const Color(0xFF4CAF50)
                                  : const Color(0xFFE0E0E0),
                              width: isSelected ? 2 : 1,
                            ),
                          ),
                          child: Center(
                            child: Text(
                              symptom,
                              style: TextStyle(
                                fontSize: 14.sp,
                                fontWeight: isSelected
                                    ? FontWeight.bold
                                    : FontWeight.normal,
                                color: isSelected
                                    ? const Color(0xFF4CAF50)
                                    : const Color(0xFF1A1A1A),
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                  SizedBox(height: 24.h),
                  // Additional Details Section
                  Text(
                    'Additional Details',
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.bold,
                      color: const Color(0xFF1A1A1A),
                    ),
                  ),
                  SizedBox(height: 12.h),
                  Container(
                    decoration: BoxDecoration(
                      color: const Color(0xFFF5F5F5),
                      borderRadius: BorderRadius.circular(12.r),
                      border: Border.all(
                        color: const Color(0xFFE0E0E0),
                        width: 1,
                      ),
                    ),
                    child: TextField(
                      controller: _additionalDetailsController,
                      maxLines: 5,
                      style: TextStyle(fontSize: 16.sp),
                      decoration: InputDecoration(
                        hintText:
                            'Describe the situation, number of people affected, or any other relevant information...',
                        hintStyle: TextStyle(
                          fontSize: 16.sp,
                          color: const Color(0xFF999999),
                        ),
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.all(16.w),
                      ),
                    ),
                  ),
                  SizedBox(height: 24.h),
                  // Photo (Optional) Section
                  Text(
                    'Photo (Optional)',
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.bold,
                      color: const Color(0xFF1A1A1A),
                    ),
                  ),
                  SizedBox(height: 12.h),
                  GestureDetector(
                    onTap: () {
                      // Handle photo upload
                    },
                    child: Container(
                      width: double.infinity,
                      height: 150.h,
                      decoration: BoxDecoration(
                        color: const Color(0xFFFAFAFA),
                        borderRadius: BorderRadius.circular(12.r),
                        border: Border.all(
                          color: const Color(0xFFE0E0E0),
                          width: 2,
                          style: BorderStyle.solid,
                        ),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.camera_alt_outlined,
                            size: 48.sp,
                            color: const Color(0xFF999999),
                          ),
                          SizedBox(height: 8.h),
                          Text(
                            'Add Photo',
                            style: TextStyle(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w500,
                              color: const Color(0xFF1A1A1A),
                            ),
                          ),
                          SizedBox(height: 4.h),
                          Text(
                            'Tap to upload',
                            style: TextStyle(
                              fontSize: 12.sp,
                              color: const Color(0xFF999999),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 24.h),
                  // Privacy Notice
                  Container(
                    width: double.infinity,
                    padding: EdgeInsets.all(16.w),
                    decoration: BoxDecoration(
                      color: const Color(0xFFE3F2FD),
                      borderRadius: BorderRadius.circular(12.r),
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Icon(
                          Icons.info_outline,
                          color: const Color(0xFF2196F3),
                          size: 24.sp,
                        ),
                        SizedBox(width: 12.w),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Privacy Notice',
                                style: TextStyle(
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.bold,
                                  color: const Color(0xFF2196F3),
                                ),
                              ),
                              SizedBox(height: 4.h),
                              Text(
                                'Your report helps health authorities respond quickly. Data is encrypted and used only for public health monitoring.',
                                style: TextStyle(
                                  fontSize: 14.sp,
                                  color: const Color(0xFF2196F3),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 32.h),
                  // Submit Report Button
                  SizedBox(
                    width: double.infinity,
                    height: 56.h,
                    child: ElevatedButton(
                      onPressed: () {
                        // Handle submit report
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF4CAF50),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12.r),
                        ),
                        elevation: 0,
                      ),
                      child: Text(
                        'Submit Report',
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
      ),
    );
  }
}

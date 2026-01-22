import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

class MapTab extends StatefulWidget {
  const MapTab({Key? key}) : super(key: key);

  @override
  State<MapTab> createState() => _MapTabState();
}

class _MapTabState extends State<MapTab> {
  final MapController _mapController = MapController();
  final LatLng _centerLocation = LatLng(
    14.6760,
    121.0437,
  ); // Quezon City, Metro Manila

  @override
  void dispose() {
    _mapController.dispose();
    super.dispose();
  }

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
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Title and Subtitle
                  Text(
                    'Risk Map',
                    style: TextStyle(
                      fontSize: 28.sp,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 4.h),
                  Text(
                    'Metro Manila',
                    style: TextStyle(
                      fontSize: 16.sp,
                      color: Colors.white.withOpacity(0.9),
                    ),
                  ),
                  SizedBox(height: 16.h),
                  // Disease Layers Button and Info Icon
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // Disease Layers Button
                      ElevatedButton.icon(
                        onPressed: () {
                          // Handle disease layers
                        },
                        icon: Icon(
                          Icons.layers,
                          color: const Color(0xFF2196F3),
                          size: 20.sp,
                        ),
                        label: Text(
                          'Disease Layers',
                          style: TextStyle(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.bold,
                            color: const Color(0xFF2196F3),
                          ),
                        ),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          padding: EdgeInsets.symmetric(
                            horizontal: 16.w,
                            vertical: 12.h,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12.r),
                          ),
                          elevation: 0,
                        ),
                      ),
                      // Info Icon
                      IconButton(
                        icon: Container(
                          width: 40.w,
                          height: 40.w,
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.2),
                            shape: BoxShape.circle,
                            border: Border.all(color: Colors.white, width: 2),
                          ),
                          child: Icon(
                            Icons.info_outline,
                            color: Colors.white,
                            size: 20.sp,
                          ),
                        ),
                        onPressed: () {
                          // Handle info
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
        // Main Content Area
        Expanded(
          child: SingleChildScrollView(
            child: Column(
              children: [
                // Risk Map Visualization Card
                Container(
                  margin: EdgeInsets.all(24.w),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16.r),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        blurRadius: 10,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(16.r),
                    child: SizedBox(
                      height: 400.h,
                      child: Stack(
                        children: [
                          // OpenStreetMap
                          FlutterMap(
                            mapController: _mapController,
                            options: MapOptions(
                              initialCenter: _centerLocation,
                              initialZoom: 13.0,
                              minZoom: 10.0,
                              maxZoom: 18.0,
                            ),
                            children: [
                              TileLayer(
                                urlTemplate:
                                    'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                                userAgentPackageName:
                                    'com.sad_mobileapp.respiratrack',
                              ),

                              // Markers
                              MarkerLayer(
                                markers: [
                                  // Blue marker (You are here)
                                  Marker(
                                    point: LatLng(14.6750, 121.0500),
                                    width: 50.w,
                                    height: 50.w,
                                    child: Stack(
                                      alignment: Alignment.center,
                                      children: [
                                        Container(
                                          width: 50.w,
                                          height: 50.w,
                                          decoration: BoxDecoration(
                                            color: const Color(0xFF2196F3),
                                            shape: BoxShape.circle,
                                            border: Border.all(
                                              color: Colors.white,
                                              width: 3,
                                            ),
                                          ),
                                        ),
                                        Icon(
                                          Icons.location_on,
                                          color: Colors.white,
                                          size: 30.sp,
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          // Risk Levels Legend
                          Positioned(
                            top: 16.h,
                            right: 16.w,
                            child: Container(
                              padding: EdgeInsets.all(12.w),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(12.r),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.1),
                                    blurRadius: 8,
                                    offset: const Offset(0, 2),
                                  ),
                                ],
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(
                                    'Risk Levels',
                                    style: TextStyle(
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.bold,
                                      color: const Color(0xFF1A1A1A),
                                    ),
                                  ),
                                  SizedBox(height: 8.h),
                                  _buildLegendItem(Colors.red, 'Critical'),
                                  SizedBox(height: 4.h),
                                  _buildLegendItem(Colors.orange, 'High'),
                                  SizedBox(height: 4.h),
                                  _buildLegendItem(Colors.yellow, 'Moderate'),
                                  SizedBox(height: 4.h),
                                  _buildLegendItem(Colors.green, 'Low'),
                                ],
                              ),
                            ),
                          ),
                          // "You are here" label
                          Positioned(
                            bottom: 60.h,
                            left: MediaQuery.of(context).size.width / 2 - 60.w,
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                horizontal: 12.w,
                                vertical: 6.h,
                              ),
                              decoration: BoxDecoration(
                                color: const Color(0xFF2196F3),
                                borderRadius: BorderRadius.circular(12.r),
                              ),
                              child: Text(
                                'You are here',
                                style: TextStyle(
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                // Location Details Card
                Container(
                  margin: EdgeInsets.fromLTRB(24.w, 0, 24.w, 24.h),
                  padding: EdgeInsets.all(20.w),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16.r),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        blurRadius: 10,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Location Header
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Icon(
                                Icons.location_on,
                                color: const Color(0xFF1A1A1A),
                                size: 24.sp,
                              ),
                              SizedBox(width: 8.w),
                              Text(
                                'Cubao, Quezon City',
                                style: TextStyle(
                                  fontSize: 18.sp,
                                  fontWeight: FontWeight.bold,
                                  color: const Color(0xFF1A1A1A),
                                ),
                              ),
                            ],
                          ),
                          Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: 12.w,
                              vertical: 6.h,
                            ),
                            decoration: BoxDecoration(
                              color: Colors.red,
                              borderRadius: BorderRadius.circular(12.r),
                            ),
                            child: Text(
                              'Critical Risk',
                              style: TextStyle(
                                fontSize: 12.sp,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 20.h),
                      // Disease Cases
                      _buildDiseaseCase(
                        'COVID-19 Cases',
                        '89 active',
                        Colors.red,
                      ),
                      SizedBox(height: 12.h),
                      _buildDiseaseCase(
                        'Influenza Cases',
                        '34 active',
                        Colors.orange,
                      ),
                      SizedBox(height: 12.h),
                      _buildDiseaseCase(
                        'Tuberculosis Cases',
                        '21 active',
                        const Color(0xFF2196F3),
                      ),
                      SizedBox(height: 16.h),
                      // Update Status
                      Row(
                        children: [
                          Icon(
                            Icons.location_on,
                            color: Colors.red,
                            size: 16.sp,
                          ),
                          SizedBox(width: 4.w),
                          Text(
                            '1.2 km from your location',
                            style: TextStyle(
                              fontSize: 12.sp,
                              color: const Color(0xFF666666),
                            ),
                          ),
                          SizedBox(width: 12.w),
                          Text(
                            'Updated 1 hour ago',
                            style: TextStyle(
                              fontSize: 12.sp,
                              color: const Color(0xFF666666),
                            ),
                          ),
                        ],
                      ),
                    ],
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

  Widget _buildLegendItem(Color color, String label) {
    return Row(
      children: [
        Container(
          width: 12.w,
          height: 12.w,
          decoration: BoxDecoration(color: color, shape: BoxShape.circle),
        ),
        SizedBox(width: 8.w),
        Text(
          label,
          style: TextStyle(fontSize: 12.sp, color: const Color(0xFF1A1A1A)),
        ),
      ],
    );
  }

  Widget _buildDiseaseCase(String disease, String count, Color color) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          disease,
          style: TextStyle(fontSize: 16.sp, color: const Color(0xFF1A1A1A)),
        ),
        Text(
          count,
          style: TextStyle(
            fontSize: 16.sp,
            fontWeight: FontWeight.bold,
            color: color,
          ),
        ),
      ],
    );
  }
}

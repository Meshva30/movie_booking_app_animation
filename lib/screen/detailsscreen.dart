import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../constant/horizontal_listview/cast_and _crew_listview.dart';
import '../constant/recommened_movie_constant.dart';
import '../constant/review_constant.dart';
import '../constant/string_constant.dart';
import 'booking_screen.dart';


class DetailScreen extends StatefulWidget {
  final String imageList;
  final String movieName;
  const DetailScreen({Key? key, required this.imageList, required this.movieName}) : super(key: key);

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  @override
  Widget build(BuildContext context) {
    timeDilation = 4.0;
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(image: AssetImage(widget.imageList), fit: BoxFit.fill),
            ),

            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 50.0, sigmaY: 50.0),

              child: Column(
                children: [
                  Hero(
                    tag: widget.imageList,
                    child: Container(
                      height: 350.h,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(bottomLeft: Radius.circular(70.sp), bottomRight: Radius.circular(70.sp)),
                        image: DecorationImage(image: AssetImage(widget.imageList), fit: BoxFit.fill),
                      ),
                      child: Column(
                        children: [
                          Material(
                            color: Colors.transparent,
                            child: Padding(
                              padding: EdgeInsets.only(right: 270.w, top: 40.h),
                              child: InkWell(
                                onTap: () {
                                  Navigator.pop(context);

                                },
                                child: Container(
                                  height: 40.h,
                                  width: 43.w,
                                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(15.sp), color: Colors.white60),
                                  child: const Icon(Icons.arrow_back_ios_new),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 15.h),
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(right: 20.w, left: 20.w),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [

                                SizedBox(height: 10.h),
                                Text(widget.movieName, style: TextStyle(color: Colors.white, fontSize: 30.sp, fontWeight: FontWeight.w700)),

                                SizedBox(height: 8.h),
                                Row(
                                  children: [

                                    Container(
                                      width: 70.w,
                                      height: 30.h,
                                      decoration: BoxDecoration(
                                          border: Border.all(color: Colors.white),
                                          color: Colors.transparent,
                                          borderRadius: BorderRadius.circular(20)),
                                      child: Center(child: Text(action, style: TextStyle(color: Colors.white, fontSize: 14.sp))),
                                    ),


                                    SizedBox(width: 10.w),
                                    Container(
                                      width: 60.w,
                                      height: 30.h,
                                      decoration: BoxDecoration(
                                          border: Border.all(color: Colors.white),
                                          color: Colors.transparent,
                                          borderRadius: BorderRadius.circular(20)),
                                      child: Center(child: Text(sciFi, style: TextStyle(color: Colors.white, fontSize: 14.sp))),
                                    ),


                                    SizedBox(width: 10.w),
                                    Container(
                                      width: 90.w,
                                      height: 30.h,
                                      decoration: BoxDecoration(
                                          border: Border.all(color: Colors.white),
                                          color: Colors.transparent,
                                          borderRadius: BorderRadius.circular(20)),
                                      child: Center(child: Text(adventure, style: TextStyle(color: Colors.white, fontSize: 14.sp))),
                                    ),
                                  ],
                                ),

                                SizedBox(height: 8.h),
                                Row(
                                  children: [

                                    Icon(Icons.star_rounded, color: Colors.yellow.shade700, size: 27.sp),


                                    Text(votes,
                                        style: TextStyle(
                                            fontSize: 17.sp, color: Colors.white, fontWeight: FontWeight.w700, decoration: TextDecoration.underline)),
                                  ],
                                ),

                                SizedBox(height: 8.h),
                                const Divider(thickness: 1, color: Colors.white70),

                                SizedBox(height: 8.h),
                                Text(aboutTheMovie, style: TextStyle(color: Colors.white, fontWeight: FontWeight.w700, fontSize: 15.sp)),
                                SizedBox(height: 6.h),
                                Text(aboutTheMovieDetail, style: TextStyle(color: Colors.white, fontWeight: FontWeight.w400, fontSize: 15.sp)),
                              ],
                            ),
                          ),

                          SizedBox(height: 15.h),
                          Padding(
                            padding: EdgeInsets.only(left: 5.w),
                            child: const CastHorizontalListview(),
                          ),

                          SizedBox(height: 15.h),
                          Padding(
                            padding: EdgeInsets.only(left: 5.w),
                            child: const CrewHorizontalListview(),
                          ),

                          SizedBox(height: 15.h),
                          Padding(
                            padding: EdgeInsets.only(right: 20.w, left: 20.w),
                            child: const Divider(thickness: 1, color: Colors.white70),
                          ),

                          SizedBox(height: 15.h),
                          Padding(
                            padding: EdgeInsets.only(left: 10.w),
                            child: const ReviewsConstant(),
                          ),


                          SizedBox(height: 15.h),
                          Padding(
                            padding: EdgeInsets.only(right: 20.w, left: 20.w),
                            child: const Divider(thickness: 1, color: Colors.white70),
                          ),


                          SizedBox(height: 15.h),
                          Padding(
                            padding: EdgeInsets.only(left: 10.w),
                            child: const RecommendedMovieConstant(),
                          ),
                          SizedBox(height: 40.h),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),


          // SizedBox(height: 8.h),
          Padding(
            padding:  EdgeInsets.only(bottom: 10.h),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: SizedBox(
                height: 55.h,
                width: 210.w,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.yellow.shade700,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.sp)),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => BookingScreen(imageList: widget.imageList, movieName: widget.movieName),
                        ),
                      );
                    },
                    child: Text('Select Seats', style: TextStyle(color: Colors.black, fontSize: 15.sp))),
              ),
            ),
          ),
          // SizedBox(height: 8.h),
        ],
      ),
    );
  }
}
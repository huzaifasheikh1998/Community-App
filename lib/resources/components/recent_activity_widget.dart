import 'package:CommunityApp/resources/color.dart';
import 'package:CommunityApp/resources/components/recent_activity_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../Model/home_data_model/logs_datum.dart';

class RecentActivity extends StatelessWidget {
  final bool activeTanker;
  final List<LogsDatum>? value;
  const RecentActivity(
      {super.key, required this.value, required this.activeTanker});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10.w),
      padding: EdgeInsets.symmetric(horizontal: 10.w),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20), color: greyLightBg),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GestureDetector(
            onTap: () {
              // navigate(context, UpdateAlert(forced: true));
            },
            child: Container(
              margin: EdgeInsets.symmetric(vertical: 7.5.h),
              child: Text(
                "Recent Activity",
                style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          SizedBox(
            height: activeTanker ? 0.3.sh : 0.5.sh,
            child: Column(
              children: [
                Expanded(
                  child: ListView.separated(
                      itemCount: value!.length,
                      shrinkWrap: true,
                      separatorBuilder: (context, index) {
                        return SizedBox(
                          height: 10.h,
                        );
                      },
                      itemBuilder: (context, index) {
                        final iteration = value![index];
                        return RecentActivityTile(
                          value: iteration,
                          last: value!.length - 1 == index,
                        );
                      }),
                ),
              ],
            ),
          ),
          // SizedBox(height: 0.1.sh,)

          // RecentActivityTile()
          // recentTile(context)
        ],
      ),
    );
  }
}

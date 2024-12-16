import 'package:CommunityApp/Function/Navigation/navigate.dart';
import 'package:CommunityApp/resources/color.dart';
import 'package:CommunityApp/resources/components/header_widget.dart';
import 'package:CommunityApp/resources/components/profile_tile.dart';
import 'package:CommunityApp/resources/image.dart';
import 'package:CommunityApp/resources/sizeconfig.dart';
import 'package:CommunityApp/view/setting_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../resources/local_data.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig size = SizeConfig(context);

    return Scaffold(
      body: Container(
        decoration:
            BoxDecoration(gradient: LinearGradient(colors: blueDarkGradient)),
        child: SafeArea(
          child: Column(
            children: [
              Container(
                  margin: EdgeInsets.symmetric(horizontal: 10.w),
                  child: headerTransparentWidget(context, 8, "Profile", false)),
              SizedBox(
                height: 40.h,
              ),
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(50.r),
                          topRight: Radius.circular(50.r))),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Stack(
                        clipBehavior: Clip.none,
                        children: [
                          ClipRRect(
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(50.r),
                                  topRight: Radius.circular(50.r)),
                              child: Image.asset(patternBg1)),
                          Positioned(
                              right: 30.h,
                              top: 30.h,
                              child: GestureDetector(
                                onTap: () {
                                  navigate(context, SettingScreen());
                                  // Navigator.push(context, MaterialPageRoute(builder: (context)=> SettingScreen()));
                                },
                                child: Container(
                                  padding: EdgeInsets.all(8.h),
                                  height: 41.h,
                                  decoration: BoxDecoration(
                                      color: orange,
                                      borderRadius:
                                          BorderRadius.circular(10.r)),
                                  child: Image.asset(setting),
                                ),
                              )),
                          Positioned(
                              width: size.screenWidth,
                              top: 20.h,
                              // right: 30.w,
                              child: Center(
                                child: Container(
                                  padding: EdgeInsets.all(2),
                                  decoration: BoxDecoration(
                                      color: orange, shape: BoxShape.circle),
                                  child: Container(
                                      height: 130.h,
                                      width: 130.h,
                                      // clipBehavior: Clip.hardEdge,
                                      decoration: BoxDecoration(
                                        image: DecorationImage(
                                            image: AssetImage(profileIcon),
                                            fit: BoxFit.fitHeight),
                                        shape: BoxShape.circle,
                                      ),
                                      child: LocalData.profile == ""
                                          ? null
                                          : Container(
                                              height: 130.h,
                                              width: 130.h,
                                              decoration: BoxDecoration(
                                                  color: orange,
                                                  shape: BoxShape.circle),
                                              clipBehavior: Clip.hardEdge,
                                              child: Image.network(
                                                LocalData.profile,
                                                fit: BoxFit.cover,
                                                height: 130.h,
                                              ),
                                            )),
                                ),
                              )),
                        ],
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 20.w),
                        child: Column(
                          children: [
                            profileTile(
                              profileIcon,
                              "Name",
                              LocalData.name.toString(),
                            ),
                            profileTile(
                              cnic,
                              "CNIC",
                              LocalData.cnic.toString(),
                            ),
                            profileTile(
                              phone,
                              "Phone Number:",
                              LocalData.phone.toString(),
                            ),
                            profileTile(
                              address,
                              "Address",
                              LocalData.address.toString(),
                            ),
                            profileTile(
                              society,
                              "Society",
                              LocalData.society.toString(),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
              // SizedBox(
              //   height: 20,
              // )
            ],
          ),
        ),
      ),
    );
  }
}

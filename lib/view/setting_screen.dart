import 'package:CommunityApp/Function/Navigation/navigate.dart';
import 'package:CommunityApp/resources/color.dart';
import 'package:CommunityApp/resources/components/header_widget.dart';
import 'package:CommunityApp/resources/components/profile_info_tile.dart';
import 'package:CommunityApp/resources/sizeconfig.dart';
import 'package:CommunityApp/view/change_contact_screen.dart';
import 'package:CommunityApp/view/change_password_screen.dart';
import 'package:CommunityApp/view/login_screen.dart';
import 'package:CommunityApp/view/privacy_policy_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../resources/components/logout_alert.dart';
import '../resources/components/setting_tile.dart';
import '../resources/image.dart';
import '../resources/local_data.dart';
import 'contact_us_screen.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration:
            BoxDecoration(gradient: LinearGradient(colors: blueDarkGradient)),
        child: SafeArea(
          child: Column(
            children: [
              Container(
                // color: Colors.amber,
                margin: EdgeInsets.symmetric(horizontal: 10.w),
                child: headerTransparentWidget(context, 8, "Setting", false),
              ),
              SizedBox(
                height: 40.h,
              ),
              Expanded(
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  width: SizeConfig(context).screenWidth,
                  // color: Colors.white,
                  // height: 850.h,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(40.r),
                          topRight: Radius.circular(40.r))),
                  child: Column(
                    children: [
                      ProfileInfoTile(),
                      // settingTile(
                      //   profileIcon,
                      //   LocalData.name.toString(),
                      // ),
                      GestureDetector(
                          onTap: () {
                            navigate(context, ChangeContactScreen());
                          },
                          child: Container(
                              color: Colors.transparent,
                              child: settingTile(edit, "Edit Contact Number"))),
                      GestureDetector(
                          onTap: () {
                            navigate(context, ChangePasswordScreen());
                          },
                          child: Container(
                              color: Colors.transparent,
                              child: settingTile(security, "Change Password"))),
                      GestureDetector(
                          onTap: () {
                            navigate(context, ContactUs());
                          },
                          child: Container(
                              color: Colors.transparent,
                              child: settingTile(info, "Contact Us"))),

                      GestureDetector(
                          onTap: () {
                            navigate(context, PrivacyPolicyScreen());
                          },
                          child: Container(
                              color: Colors.transparent,
                              child: settingTile(info, "Privacy Policy"))),
                      GestureDetector(
                          onTap: () {
                            navigate(context, LogoutAlert());
                          },
                          child: Container(
                              color: Colors.transparent,
                              child: settingTile(logout, "Log Out"))),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

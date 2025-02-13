import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:mechtronz/constants/app_colors.dart';
import 'package:mechtronz/constants/constants.dart';
import 'package:mechtronz/constants/tags.dart';
import 'package:mechtronz/screens/home/home_screen.dart';
import 'package:mechtronz/utils/shadows.dart';
import 'package:mechtronz/utils/text_preset.dart';
import 'package:mechtronz/global/widgets/app_drawer.dart';
import 'package:mechtronz/global/widgets/h_gap.dart';
import 'package:mechtronz/global/widgets/header.dart';
import 'package:mechtronz/global/widgets/screen.dart';
import 'package:mechtronz/global/widgets/v_gap.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> key = GlobalKey();
    return Screen(
      canPop: false,
      onPopInvokedWithResult: (didPop, result) {
        Get.offAll(() => const HomeScreen());
      },
      uniqueKey: key,
      drawer: AppDrawer(
        scaffoldKey: key,
        activeScreen: ActiveScreenEnum.profile,
      ),
      child: ListView(
        children: [
          Header(
            leading: GestureDetector(
              behavior: HitTestBehavior.opaque,
              onTap: () {
                key.currentState!.isDrawerOpen
                    ? key.currentState!.closeDrawer()
                    : key.currentState!.openDrawer();
              },
              child: SizedBox(width: 40.w, child: const Icon(Icons.menu)),
            ),
            title: 'Mechtronz',
          ),
          Center(
            child: Hero(
              tag: Tags.dp,
              child: Container(
                padding: kPadding,
                decoration: BoxDecoration(
                  color: AppColors.secondary.shade50,
                  borderRadius: kBorderRadius,
                ),
                child: const Icon(
                  Icons.person,
                  size: 50,
                  color: AppColors.primary,
                ),
              ),
            ),
          ),
          const VGap(),
          Center(child: Text('John Doe', style: kHeadline2)),
          const IconProfileItem(
            text: 'john.doe@example.com',
            icon: Icons.email_rounded,
          ),
          VGap(gap: 20.h),
          Center(
            child: Container(
              height: 30.h,
              width: 125.w,
              decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: kBorderRadius,
                  border: Border.all(color: AppColors.black),
                  boxShadow: kBottomLightShadow),
              child: Center(child: Text('Edit Profile', style: kBody)),
            ),
          ),
          VGap(gap: 20.h),
          const Divider(color: AppColors.gray400),
          VGap(gap: 20.h),
          Text(
            'Profile Information'.toUpperCase(),
            style: kSubtitle2.copyWith(color: AppColors.gray400),
          ),
          ProfileItem(label: 'Email Id', value: 'john.doe@example.com'),
          Split(
            children: [
              ProfileItem(label: 'Mobile', value: '1234567890'),
              ProfileItem(label: 'Alt Mobile', value: '0987654321'),
            ],
          ),
          VGap(gap: 20.h),
          Text(
            'Address'.toUpperCase(),
            style: kSubtitle2.copyWith(color: AppColors.gray400),
          ),
          ProfileItem(label: 'Address Line 1', value: '123 Example Street'),
          Split(
            children: [
              ProfileItem(label: 'State', value: 'Example State'),
              ProfileItem(label: 'City', value: 'Example City'),
            ],
          ),
          Split(
            children: [
              ProfileItem(label: 'Pin', value: '123456'),
            ],
          ),
          VGap(gap: 20.h),
          Text(
            'Other Information'.toUpperCase(),
            style: kSubtitle2.copyWith(color: AppColors.gray400),
          ),
          ProfileItem(label: 'Site Name', value: 'Example Site'),
          ProfileItem(label: 'Company Name', value: 'Example Company'),
          ProfileItem(label: 'SPOC Name', value: 'Jane Doe'),
          ProfileItem(label: 'Purchase Order Number', value: 'PO123456'),
        ],
      ),
    );
  }
}

class Split extends StatelessWidget {
  final List<Widget> children;
  const Split({
    super.key,
    required this.children,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: children
          .map(
            (child) => Expanded(child: child),
          )
          .toList(),
    );
  }
}

class IconProfileItem extends StatelessWidget {
  final IconData icon;
  final String text;
  const IconProfileItem({
    super.key,
    required this.icon,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          icon,
          color: AppColors.gray400,
          size: 18,
        ),
        const HGap(),
        Text(text, style: kBody.copyWith(color: AppColors.gray400)),
      ],
    );
  }
}

class ProfileItem extends StatelessWidget {
  final String label;
  final String value;

  ProfileItem({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '$label: ',
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          Expanded(
            child: Text(value),
          ),
        ],
      ),
    );
  }
}

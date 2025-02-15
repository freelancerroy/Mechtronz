import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:mechtronz/constants/app_colors.dart';
import 'package:mechtronz/constants/tags.dart';
import 'package:mechtronz/global/controller/init_controller.dart';
import 'package:mechtronz/global/controller/user_controller.dart';
import 'package:mechtronz/screens/assets/asset_list_screen.dart';
import 'package:mechtronz/screens/assets/create_assets_screen.dart';
import 'package:mechtronz/screens/home/home_screen.dart';
import 'package:mechtronz/screens/profile/profile_screen.dart';
import 'package:mechtronz/utils/helper.dart';
import 'package:mechtronz/utils/text_preset.dart';
import 'package:mechtronz/global/widgets/h_gap.dart';
import 'package:mechtronz/global/widgets/v_gap.dart';

enum ActiveScreenEnum { home, profile, assets, aboutUs }

class AppDrawer extends Drawer {
  final GlobalKey<ScaffoldState> scaffoldKey;
  final ActiveScreenEnum activeScreen;
  const AppDrawer({
    super.key,
    required this.scaffoldKey,
    required this.activeScreen,
  });

  @override
  Drawer build(BuildContext context) {
    return Drawer(
      shape: const ContinuousRectangleBorder(),
      child: SafeArea(
        child: GetBuilder<UserController>(
            init: UserController(),
            builder: (controller) {
              return controller.isLoading
                  ? const Center(child: CircularProgressIndicator())
                  : Stack(
                      children: [
                        // Positioned.fill(
                        //   child: Container(
                        //     color: AppColors.secondary.shade50.withOpacity(0.5),
                        //     width: double.infinity,
                        //     child: Padding(
                        //       padding: kPadding,
                        //       child: Column(
                        //         crossAxisAlignment: CrossAxisAlignment.start,
                        //         children: [
                        //           Hero(
                        //             tag: Tags.dp,
                        //             child: CircleAvatar(
                        //               radius: 30.r,
                        //               backgroundColor: AppColors.secondary.shade100,
                        //               child: const Icon(
                        //                 Icons.person,
                        //                 color: AppColors.primary,
                        //                 size: 30,
                        //               ),
                        //             ),
                        //           ),
                        //           const VGap(),
                        //           Text(
                        //             'John Doe',
                        //             style: kHeadline3.copyWith(color: AppColors.primary),
                        //           ),
                        //           Text(
                        //             'California, USA',
                        //             style: kSubtitle3.copyWith(color: AppColors.gray400),
                        //           ),
                        //         ],
                        //       ),
                        //     ),
                        //   ),
                        // ),
                        Positioned(
                          top: -180.r,
                          left: -190.r,
                          child: CircleAvatar(
                            radius: 250.r,
                            backgroundColor:
                                AppColors.secondary.shade50.withOpacity(0.5),
                            child: CircleAvatar(
                              radius: 210.r,
                              backgroundColor: AppColors.secondary.shade50,
                              child: CircleAvatar(
                                radius: 170.r,
                                backgroundColor: AppColors.secondary.shade100,
                                child: Hero(
                                  tag: activeScreen == ActiveScreenEnum.profile
                                      ? Tags.random()
                                      : Tags.dp,
                                  child: CircleAvatar(
                                    radius: 40.r,
                                    backgroundColor:
                                        AppColors.secondary.shade200,
                                    child: Icon(
                                      Icons.person,
                                      color: AppColors.primary,
                                      size: 40.r,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                            top: 250.r - 180.r - 30.h,
                            left: 250.r - 190.r + 40.r + 20.w,
                            child: SizedBox(
                              height: 60.h,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    controller.userResult?.user?.name ?? '',
                                    style: kHeadline3.copyWith(
                                        color: AppColors.primary),
                                  ),
                                  Text(
                                    'California, USA',
                                    style: kSubtitle3.copyWith(
                                        color: AppColors.gray800),
                                  ),
                                ],
                              ),
                            )),
                        Positioned.fill(
                          top: 140.r,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // Container(
                              //   color: AppColors.secondary.shade50.withOpacity(0.5),
                              //   width: double.infinity,
                              //   child: Padding(
                              //     padding: kPadding,
                              //     child: Column(
                              //       crossAxisAlignment: CrossAxisAlignment.start,
                              //       children: [
                              //         Hero(
                              //           tag: Tags.dp,
                              //           child: CircleAvatar(
                              //             radius: 30.r,
                              //             backgroundColor: AppColors.secondary.shade100,
                              //             child: const Icon(
                              //               Icons.person,
                              //               color: AppColors.primary,
                              //               size: 30,
                              //             ),
                              //           ),
                              //         ),
                              //         const VGap(),
                              //         Text(
                              //           'John Doe',
                              //           style:
                              //               kHeadline3.copyWith(color: AppColors.primary),
                              //         ),
                              //         Text(
                              //           'California, USA',
                              //           style:
                              //               kSubtitle3.copyWith(color: AppColors.gray400),
                              //         ),
                              //       ],
                              //     ),
                              //   ),
                              // ),
                              // const Divider(
                              //   color: AppColors.gray200,
                              //   height: 0,
                              // ),
                              Expanded(
                                child: Column(
                                  children: [
                                    VGap(gap: 30.h),
                                    DrawerItem(
                                      onTap: () {
                                        Helper.navigateAndRemoveAll(
                                            context, const HomeScreen());
                                        scaffoldKey.currentState?.closeDrawer();
                                      },
                                      isSelected:
                                          activeScreen == ActiveScreenEnum.home,
                                      title: 'Home',
                                      selectedIcon: Icons.home,
                                      unselectedIcon: Icons.home_outlined,
                                    ),

                                    // Padding(
                                    //   padding: kHPadding,
                                    //   child: const Divider(
                                    //       color: AppColors.gray100, height: 1),
                                    // ),
                                    DrawerItem(
                                      onTap: () {
                                        Helper.navigateAndRemoveAll(
                                          context,
                                          const ProfileScreen(),
                                        );
                                        scaffoldKey.currentState?.closeDrawer();
                                      },
                                      isSelected: activeScreen ==
                                          ActiveScreenEnum.profile,
                                      title: 'Profile',
                                      selectedIcon: Icons.person,
                                      unselectedIcon: Icons.person_outline,
                                    ),
                                    // Padding(
                                    //   padding: kHPadding,
                                    //   child: const Divider(
                                    //       color: AppColors.gray100, height: 1),
                                    // ),
                                    DrawerItem(
                                      isSelected: activeScreen ==
                                          ActiveScreenEnum.assets,
                                      title: 'Assets',
                                      selectedIcon: Icons.monitor,
                                      unselectedIcon: Icons.monitor,
                                      onTap: () => Get.offAll(
                                        () => const AssetListScreen(),
                                      ),
                                    ),
                                    DrawerItem(
                                        isSelected: activeScreen ==
                                            ActiveScreenEnum.aboutUs,
                                        title: 'About Us',
                                        selectedIcon: Icons.info,
                                        unselectedIcon:
                                            Icons.info_outline_rounded,
                                        onTap: () => Get.offAll(
                                            () => const CreateAssetsScreen())),
                                  ],
                                ),
                              ),
                              const VGap(),
                              DrawerItem(
                                title: 'Sign Out',
                                selectedIcon: Icons.logout_rounded,
                                unselectedIcon: Icons.logout_rounded,
                                onTap: () =>
                                    Get.find<InitController>().signOut(),
                              ),
                              const VGap(),
                            ],
                          ),
                        ),
                      ],
                    );
            }),
      ),
    );
  }
}

class DrawerItem extends StatelessWidget {
  final bool isSelected;
  final IconData? selectedIcon;
  final IconData? unselectedIcon;
  final String title;
  final VoidCallback? onTap;
  const DrawerItem({
    super.key,
    this.isSelected = false,
    this.selectedIcon,
    this.unselectedIcon,
    required this.title,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    // const color = AppColors.black;
    final color = isSelected ? AppColors.primary : AppColors.gray400;
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 10.h),
          // decoration: BoxDecoration(
          //   color: isSelected ? AppColors.secondary.shade50 : null,
          //   borderRadius: kBorderRadius,
          // ),
          child: Row(
            children: [
              Container(
                width: 5.w,
                height: 40.h,
                decoration: BoxDecoration(
                  color: isSelected ? AppColors.primary : Colors.transparent,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(5.5.w),
                    bottomRight: Radius.circular(5.5.w),
                  ),
                ),
              ),
              HGap(gap: 15.w),
              Icon(
                isSelected ? selectedIcon : unselectedIcon,
                color: color,
              ),
              const HGap(),
              Text(
                title,
                style: kHeadline6.copyWith(
                  color: isSelected ? AppColors.primary : AppColors.gray500,
                  fontWeight: isSelected ? FontWeight.w500 : FontWeight.w400,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

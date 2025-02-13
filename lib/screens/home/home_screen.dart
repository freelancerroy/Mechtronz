import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:mechtronz/constants/app_colors.dart';
import 'package:mechtronz/constants/tags.dart';
import 'package:mechtronz/global/controller/user_controller.dart';
import 'package:mechtronz/screens/tickets/create_ticket_screen.dart';
import 'package:mechtronz/utils/text_preset.dart';
import 'package:mechtronz/global/widgets/app_drawer.dart';
import 'package:mechtronz/global/widgets/header.dart';
import 'package:mechtronz/global/widgets/screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final GlobalKey<ScaffoldState> _key = GlobalKey();

  bool isEmpty = true;

  @override
  void dispose() {
    super.dispose();
    _key.currentState?.dispose();
  }

  bool canBack = false;

  void backAgainToExit() {
    if (_key.currentState!.isDrawerOpen) {
      _key.currentState!.closeDrawer();
    } else {
      if (canBack) return;
      setState(() {
        canBack = true;
      });
      Get.snackbar('Press angain to exit', '');
      Future.delayed(const Duration(seconds: 2), () {
        setState(() {
          canBack = false;
        });
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<UserController>(
        init: UserController(),
        builder: (controller) {
          return Screen(
              uniqueKey: _key,
              canPop: canBack,
              onPopInvokedWithResult: (didPop, result) {
                backAgainToExit();
                // Future.delayed(const Duration(seconds: 2), () {
                // Get.back();
                // });
              },
              drawer: AppDrawer(
                scaffoldKey: _key,
                activeScreen: ActiveScreenEnum.home,
              ),
              floatingActionButton: FloatingActionButton(
                backgroundColor: AppColors.primary,
                onPressed: () {
                  Get.to(() => const CreateTicketScreen());
                },
                tooltip: 'Create Ticket',
                child: const Icon(Icons.add),
              ),
              child: controller.isLoading
                  ? const Center(child: SingleChildScrollView())
                  : Column(
                      children: [
                        Header(
                          leading: Hero(
                            tag: Tags.logo,
                            child: GestureDetector(
                              behavior: HitTestBehavior.opaque,
                              onTap: () {
                                _key.currentState!.isDrawerOpen
                                    ? _key.currentState!.closeDrawer()
                                    : _key.currentState!.openDrawer();
                              },
                              child: SizedBox(
                                  width: 40.w, child: const Icon(Icons.menu)),
                            ),
                          ),
                          title: 'Mechtronz',
                        ),
                        Expanded(
                          child: isEmpty
                              ? Center(
                                  child: Text(
                                    'No tickets yet',
                                    style: kHeadline6.copyWith(
                                        color: AppColors.gray400),
                                  ),
                                )
                              : ListView(
                                  children: [
                                    Text(
                                      'No tickets yet',
                                      style: kHeadline6.copyWith(
                                          color: AppColors.gray400),
                                    ),
                                  ],
                                ),
                        ),
                      ],
                    ));
        });
  }
}

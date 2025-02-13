import 'dart:io';

import 'package:easy_stepper/easy_stepper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:mechtronz/constants/app_colors.dart';
import 'package:mechtronz/constants/constants.dart';
import 'package:mechtronz/global/widgets/h_gap.dart';
import 'package:mechtronz/global/widgets/header.dart';
import 'package:mechtronz/global/widgets/photo_preview.dart';
import 'package:mechtronz/global/widgets/screen.dart';
import 'package:mechtronz/global/widgets/tochable_opacity.dart';
import 'package:mechtronz/global/widgets/v_gap.dart';
import 'package:mechtronz/screens/tickets/widgets/ticket_tile.dart';
import 'package:mechtronz/utils/text_preset.dart';

class TicketDetailsScreen extends StatefulWidget {
  final List<File> images;
  const TicketDetailsScreen({super.key, required this.images});

  @override
  State<TicketDetailsScreen> createState() => _TicketDetailsScreenState();
}

class _TicketDetailsScreenState extends State<TicketDetailsScreen> {
  int activeStep = 0;
  @override
  Widget build(BuildContext context) {
    return Screen(
      child: Column(
        children: [
          const Header(title: 'Ticket Details'),
          Expanded(
            child: ListView(
              children: [
                Card(
                  color: AppColors.gray50,
                  // semanticContainer: false,
                  // borderOnForeground: false,
                  margin: EdgeInsets.zero,
                  child: Padding(
                    padding: kPadding,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 15.w, vertical: 5.w),
                              decoration: BoxDecoration(
                                border: const Border(
                                  bottom: BorderSide(
                                    color: AppColors.gray400,
                                  ),
                                  top: BorderSide(
                                    color: AppColors.gray400,
                                  ),
                                  left: BorderSide(
                                    color: AppColors.gray400,
                                  ),
                                ),
                                borderRadius: kBorderRadius.copyWith(
                                  topRight: Radius.circular(0.w),
                                  bottomRight: Radius.circular(0.w),
                                ),
                              ),
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.confirmation_number,
                                    color: AppColors.gray300,
                                    size: 20.w,
                                  ),
                                  HGap(gap: 5.w),
                                  Text('Ticket', style: kSubtitle3),
                                ],
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 15.w, vertical: 5.w),
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: AppColors.gray400,
                                ),
                                borderRadius: kBorderRadius.copyWith(
                                  topLeft: Radius.circular(0.w),
                                  bottomLeft: Radius.circular(0.w),
                                ),
                              ),
                              child: Text('TICKET-1050', style: kSubtitle3),
                            ),
                          ],
                        ),
                        const VGap(),
                        Text(
                          'Daikin 1.5 Ton 3 Star Split Inverter AC',
                          style: kHeadline3,
                        ),
                        const VGap(),
                        const TicketTile(
                          title: 'Asset ID:',
                          value: 'A55222442665',
                          icon: Icons.tv,
                        ),
                        const VGap(),
                        const TicketTile(
                          title: 'Created At:',
                          value: '12/12/2021',
                          icon: CupertinoIcons.calendar_today,
                        ),
                        const VGap(),
                        const TicketTile(
                          title: 'Assigned To:',
                          value: 'John Doe (EMP-5592)',
                          icon: CupertinoIcons.person_fill,
                        ),
                        const VGap(),
                        const TicketTile(
                          title: 'Closed At:',
                          value: '__/__/____',
                          icon: CupertinoIcons.calendar,
                        ),
                        const VGap(),
                        const TicketTile(
                          title: 'Contact Number:',
                          value: '9876543210',
                          icon: CupertinoIcons.phone_fill,
                        ),
                        const VGap(),
                        const TicketTile(
                          title: 'Customer Review:',
                          value: '',
                          icon: Icons.reviews,
                        ),
                        const VGap(),
                        const TicketTile(
                          title: 'Rating:',
                          value: '',
                          icon: CupertinoIcons.star_lefthalf_fill,
                        ),
                        TicketTile(
                          title: 'Status:',
                          icon: Icons.moving,
                          child: Card(
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 15.w, vertical: 5.w),
                              decoration: BoxDecoration(
                                color: AppColors.gray400,
                                borderRadius: kBorderRadius,
                              ),
                              child: Text(
                                'Open',
                                style:
                                    kSubtitle2.copyWith(color: AppColors.white),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const VGap(),
                EasyStepper(
                  activeStep: activeStep,
                  finishedStepBorderColor: Colors.deepOrange,
                  finishedStepTextColor: AppColors.primary,
                  finishedStepBackgroundColor: Colors.deepOrange,
                  activeStepIconColor: Colors.deepOrange,
                  lineStyle: LineStyle(
                      activeLineColor: AppColors.primary,
                      defaultLineColor: AppColors.gray300,
                      finishedLineColor: AppColors.primary,
                      lineLength: 140.w),
                  activeStepTextColor: AppColors.primary,
                  // finishedStepTextColor: Colors.black87,
                  internalPadding: 0,
                  showLoadingAnimation: false,
                  stepRadius: 8,
                  showStepBorder: false,
                  // lineDotRadius: 1.5,
                  steps: [
                    EasyStep(
                      customStep: CircleAvatar(
                        radius: 8,
                        backgroundColor: AppColors.white,
                        child: CircleAvatar(
                          radius: 7,
                          backgroundColor: activeStep >= 0
                              ? AppColors.primary
                              : AppColors.gray300,
                        ),
                      ),
                      title: 'Open',
                    ),
                    EasyStep(
                      customStep: CircleAvatar(
                        radius: 8,
                        backgroundColor: Colors.white,
                        child: CircleAvatar(
                          radius: 7,
                          backgroundColor: activeStep >= 1
                              ? AppColors.primary
                              : AppColors.gray300,
                        ),
                      ),
                      title: 'In Progress',
                      topTitle: true,
                    ),
                    EasyStep(
                      customStep: CircleAvatar(
                        radius: 8,
                        backgroundColor: Colors.white,
                        child: CircleAvatar(
                          radius: 7,
                          backgroundColor: activeStep >= 2
                              ? AppColors.primary
                              : AppColors.gray300,
                        ),
                      ),
                      title: 'Closed',
                    ),
                  ],
                  onStepReached: (index) => setState(() => activeStep = index),
                ),
                const VGap(),
                Text(
                  'Description:',
                  style: kHeadline3,
                ),
                Text(
                  "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
                  style: kBody,
                ),
                const VGap(),
                Text(
                  'Images:',
                  style: kHeadline3,
                ),
                const VGap(),
                Wrap(
                  spacing: 10.w,
                  runSpacing: 10.w,
                  children: widget.images
                      .map(
                        (e) => TouchableOpacity(
                          onTap: () {
                            Get.bottomSheet(
                              PhotoPreview(
                                images: widget.images,
                                initalIndex: widget.images.indexOf(e),
                              ),
                              isScrollControlled: true,
                              ignoreSafeArea: false,
                            );
                          },
                          child: Image.file(
                            e,
                            width: 150.w,
                            height: 150.w,
                            fit: BoxFit.cover,
                          ),
                        ),
                      )
                      .toList(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:easy_stepper/easy_stepper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:mechtronz/constants/api_endpoints.dart';
import 'package:mechtronz/constants/app_colors.dart';
import 'package:mechtronz/constants/constants.dart';
import 'package:mechtronz/global/shimmer/text_shimmer.dart';
import 'package:mechtronz/global/widgets/h_gap.dart';
import 'package:mechtronz/global/widgets/header.dart';
import 'package:mechtronz/global/widgets/photo_preview.dart';
import 'package:mechtronz/global/widgets/screen.dart';
import 'package:mechtronz/global/widgets/square_internet_image.dart';
import 'package:mechtronz/global/widgets/tochable_opacity.dart';
import 'package:mechtronz/global/widgets/v_gap.dart';
import 'package:mechtronz/modal/ticket/ticket_response.dart';
import 'package:mechtronz/screens/assets/controller/asset_controller.dart';
import 'package:mechtronz/screens/tickets/widgets/ticket_tile.dart';
import 'package:mechtronz/utils/helper.dart';
import 'package:mechtronz/utils/text_preset.dart';

class TicketDetailsScreen extends StatefulWidget {
  final TicketResult? ticketResult;
  const TicketDetailsScreen({super.key, required this.ticketResult});

  @override
  State<TicketDetailsScreen> createState() => _TicketDetailsScreenState();
}

class _TicketDetailsScreenState extends State<TicketDetailsScreen> {
  int activeStep = 0;
  TicketResult? ticketResult;

  @override
  void initState() {
    super.initState();
    setState(() {
      ticketResult = widget.ticketResult;
    });
  }

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
                              child: Text('TICKET-${ticketResult?.id ?? ''}',
                                  style: kSubtitle3),
                            ),
                          ],
                        ),
                        const VGap(),
                        FutureBuilder(
                          future: AssetController()
                              .getAsset(ticketResult?.assetId ?? 0),
                          builder: (context, assetController) =>
                              assetController.data == null
                                  ? const TextShimmer()
                                  : Text(
                                      assetController.data?.assetName ?? '',
                                      style: kHeadline3,
                                    ),
                        ),
                        const VGap(),
                        TicketTile(
                          title: 'Asset ID:',
                          value: ticketResult?.assetId?.toString() ?? '',
                          icon: Icons.tv,
                        ),
                        const VGap(),
                        TicketTile(
                          title: 'Created At:',
                          value: Helper.getFormattedDateFromString(
                                  ticketResult?.creationTime ?? '') ??
                              '__/__/____',
                          icon: CupertinoIcons.calendar_today,
                        ),
                        const VGap(),
                        TicketTile(
                          title: 'Assigned To:',
                          value: ticketResult?.customerId?.toString() ?? '',
                          icon: CupertinoIcons.person_fill,
                        ),
                        const VGap(),
                        TicketTile(
                          title: 'Closed At:',
                          value: Helper.getFormattedDateFromString(
                                  ticketResult?.closedAt ?? '') ??
                              '__/__/____',
                          icon: CupertinoIcons.calendar,
                        ),
                        const VGap(),
                        TicketTile(
                          title: 'Contact Number:',
                          value:
                              ticketResult?.customerContactPersonNumber ?? '',
                          icon: CupertinoIcons.phone_fill,
                        ),
                        const VGap(),
                        TicketTile(
                          title: 'Customer Review:',
                          value: ticketResult?.customerReview ?? '',
                          icon: Icons.reviews,
                        ),
                        const VGap(),
                        TicketTile(
                          title: 'Rating:',
                          value: ticketResult?.rating?.toString() ?? '',
                          icon: CupertinoIcons.star_lefthalf_fill,
                        ),
                        TicketTile(
                          title: 'Status:',
                          icon: Icons.moving,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          child: Card(
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 15.w, vertical: 5.w),
                              decoration: BoxDecoration(
                                color: AppColors.gray400,
                                borderRadius: kBorderRadius,
                              ),
                              child: Text(
                                ticketResult?.ticketStatus ?? '',
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
                  ticketResult?.description ?? '',
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
                  children: (ticketResult?.ticketImages ?? [])
                      .map(
                        (e) => TouchableOpacity(
                          onTap: () {
                            Get.bottomSheet(
                              PhotoPreview(
                                networkImages: ticketResult?.ticketImages
                                        ?.map((e) => ApiEndpoints.url(e))
                                        .toList() ??
                                    [],
                                initalIndex:
                                    ticketResult?.ticketImages?.indexOf(e) ?? 0,
                              ),
                              isScrollControlled: true,
                              ignoreSafeArea: false,
                            );
                          },
                          child: SquareInternetImage(
                            imgURL: e,
                            size: 150.w,
                          ),
                        ),
                      )
                      .toList(),
                ),
                VGap(gap: 50.h)
              ],
            ),
          ),
        ],
      ),
    );
  }
}

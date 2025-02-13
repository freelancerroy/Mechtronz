import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mechtronz/constants/all_states.dart';
import 'package:mechtronz/constants/app_colors.dart';
import 'package:mechtronz/constants/assets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mechtronz/constants/tags.dart';
import 'package:mechtronz/modal/sign_up_request.dart';
import 'package:mechtronz/screens/sign_up/controller/sign_up_controller.dart';
import 'package:mechtronz/utils/text_preset.dart';
import 'package:mechtronz/utils/validator.dart';
import 'package:mechtronz/global/widgets/custom_text_button.dart';
import 'package:mechtronz/global/widgets/custom_text_field.dart';
import 'package:mechtronz/global/widgets/h_gap.dart';
import 'package:mechtronz/global/widgets/header.dart';
import 'package:mechtronz/global/widgets/screen.dart';
import 'package:mechtronz/global/widgets/v_gap.dart';

import '../../global/widgets/button.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _formKey = GlobalKey<FormState>();
  bool validationFlailed = false;
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _mobileController = TextEditingController();
  final _alternateMobileController = TextEditingController();
  final _siteNameController = TextEditingController();
  final _companyNameController = TextEditingController();
  final _spocNameController = TextEditingController();
  final _purchaseOrderController = TextEditingController();
  final _addressController = TextEditingController();
  StateInfo? _selectedState;
  final _cityController = TextEditingController();
  final _zipCodeController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  void onSubmit() {
    if (_formKey.currentState!.validate()) {
      final signUpRequest = SignUpRequest(
        customerName: _nameController.text,
        customerMailId: _emailController.text,
        customerMobile: _mobileController.text,
        customerAlternateNo: _alternateMobileController.text,
        customerSiteName: _siteNameController.text,
        customerCompanyName: _companyNameController.text,
        customerSPOCName: _spocNameController.text,
        customerPONo: _purchaseOrderController.text,
        customerAddress: _addressController.text,
        customerState: _selectedState!.name,
        customerCity: _cityController.text,
        customerZIPCode: _zipCodeController.text,
        password: _passwordController.text,
        roleNames: ['Customer'],
        isActive: true,
      );
      Get.find<SignUpController>().validateNumber(signUpRequest);
    } else {
      setState(() {
        validationFlailed = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SignUpController>(
        init: SignUpController(),
        builder: (controller) {
          return Screen(
            child: Form(
              key: _formKey,
              autovalidateMode:
                  validationFlailed ? AutovalidateMode.onUserInteraction : null,
              child: ListView(
                cacheExtent: 2000,
                children: <Widget>[
                  const Header(),
                  const VGap(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      // const VGap(),
                      Text(
                        'Sign Up',
                        style: kHeadline1,
                        // textAlign: TextAlign.left,
                      ),
                      Hero(
                        tag: Tags.logo,
                        child: Image.asset(
                          AssetsImage.logo,
                          height: 50.w,
                          width: 50.w,
                        ),
                      ),
                    ],
                  ),
                  const VGap(),
                  CustomTextField(
                    label: 'Name',
                    controller: _nameController,
                    validator: Validator.isNotEmpty,
                  ),
                  const VGap(),
                  CustomTextField(
                    label: 'Email Id',
                    keyboardType: TextInputType.emailAddress,
                    controller: _emailController,
                    validator: Validator.isValidEmail,
                  ),
                  const VGap(),
                  CustomTextField(
                    label: 'Mobile Number',
                    keyboardType: TextInputType.phone,
                    controller: _mobileController,
                    validator: Validator.isValidPhoneNumber,
                    maxLength: 10,
                  ),
                  const VGap(),
                  CustomTextField(
                    label: 'Alternate Mobile Number(Optional)',
                    controller: _alternateMobileController,
                    validator: _alternateMobileController.text.isNotEmpty
                        ? Validator.isValidPhoneNumber
                        : null,
                    maxLength: 10,
                  ),
                  const VGap(),
                  CustomTextField(
                    label: 'Company Name',
                    controller: _companyNameController,
                    validator: Validator.isNotEmpty,
                  ),
                  const VGap(),
                  CustomTextField(
                    label: 'Site Name',
                    controller: _siteNameController,
                    validator: Validator.isNotEmpty,
                  ),
                  const VGap(),

                  CustomTextField(
                    label: 'SPOC Name',
                    controller: _spocNameController,
                    validator: Validator.isNotEmpty,
                  ),
                  const VGap(),
                  CustomTextField(
                    label: 'Purchase Order Number',
                    controller: _purchaseOrderController,
                    validator: Validator.isNotEmpty,
                  ),
                  const VGap(),
                  CustomTextField(
                    label: 'Address',
                    controller: _addressController,
                    validator: Validator.isNotEmpty,
                  ),
                  const VGap(),
                  DropdownButtonFormField(
                    validator: (stateInfo) =>
                        Validator.isNotEmpty(stateInfo?.name),
                    value: _selectedState,
                    items: kAllStates
                        .map((e) => DropdownMenuItem(
                              value: e,
                              child: Text(
                                e.name,
                                style: kBody,
                              ),
                            ))
                        .toList(),
                    onChanged: (stateInfo) {
                      setState(() {
                        _selectedState = stateInfo;
                      });
                    },
                    style: kBody,
                    decoration: const InputDecoration(
                      labelText: 'Select State',
                    ),
                  ),
                  const VGap(),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: CustomTextField(
                          label: 'City',
                          controller: _cityController,
                          validator: Validator.isNotEmpty,
                        ),
                      ),
                      const HGap(),
                      Expanded(
                        child: CustomTextField(
                          label: 'Zip Code',
                          controller: _zipCodeController,
                          keyboardType: TextInputType.number,
                          validator: Validator.isNotEmpty,
                        ),
                      ),
                    ],
                  ),
                  const VGap(),
                  CustomTextField(
                    label: 'Password',
                    obscureText: true,
                    controller: _passwordController,
                    validator: Validator.isValidPassword,
                  ),
                  const VGap(),
                  CustomTextField(
                    label: 'Confirm Password',
                    obscureText: true,
                    controller: _confirmPasswordController,
                    validator: (value) =>
                        Validator.isMatching(value, _passwordController.text),
                  ),
                  VGap(gap: 50.h),
                  Button(
                    text: 'Sign Up',
                    loader: controller.otpLoader,
                    onPressed: onSubmit,
                  ),
                  // VGap(gap: 50.h),
                  // const Divider(color: AppColors.gray200),
                  VGap(gap: 20.h),
                  Align(
                    alignment: Alignment.center,
                    child: CustomTextButton(
                      linkText: 'Sign In',
                      onTap: () {
                        Navigator.pop(context);
                      },
                      textColor: AppColors.textSecondary,
                      preLinkText: "Already have an account? ",
                    ),
                  ),
                  VGap(gap: 50.h),
                ],
              ),
            ),
          );
        });
  }
}

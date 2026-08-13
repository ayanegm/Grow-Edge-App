import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_intl_phone_field/flutter_intl_phone_field.dart';
import 'package:grow_edge_app/constants/app_colors.dart';
import 'package:grow_edge_app/models/user_type_models/startup_model.dart';
import 'package:grow_edge_app/pages/signup_page/partner/complete_signup_partner_second_page.dart';
import 'package:grow_edge_app/widgets/custom_button.dart';
import 'package:grow_edge_app/widgets/form_container.dart';
import 'package:grow_edge_app/widgets/gender_button.dart';
import 'package:grow_edge_app/widgets/labeled_text_field.dart';
import 'package:grow_edge_app/widgets/logo_container.dart';
import 'package:grow_edge_app/widgets/text_field_title.dart';
import 'package:image_picker/image_picker.dart';

class PartnerCompleteFirstSignupPage extends StatefulWidget {
  const PartnerCompleteFirstSignupPage({super.key, required this.startupModel});

  final StartupModel startupModel;

  @override
  State<PartnerCompleteFirstSignupPage> createState() =>
      _PartnerCompleteFirstSignupPageState();
}

class _PartnerCompleteFirstSignupPageState
    extends State<PartnerCompleteFirstSignupPage> {
  final TextEditingController CompanyName = TextEditingController();
  final TextEditingController PhoneNumber = TextEditingController();
  final TextEditingController Country = TextEditingController();
  final TextEditingController City = TextEditingController();
  String completePhoneNumber = '';
  File? _image;
  final ImagePicker _picker = ImagePicker();

  XFile? _webImage;
  Future<void> pickImage() async {
    final pickFile = await _picker.pickImage(source: ImageSource.gallery);
    if (pickFile != null) {
      setState(() {
        if (kIsWeb) {
          _webImage = pickFile;
        } else {
          _image = File(pickFile.path);
        }
      });
    }
  }

  bool _imageIsNull() {
    if (kIsWeb) {
      return _webImage == null;
    } else {
      return _image == null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            LogoContainer(
              childWidget: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 56),
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Padding(
                      padding: EdgeInsetsGeometry.symmetric(horizontal: 20),
                      child: Image.asset(
                        'assets/images/Container.png',
                        width: 32,
                        height: 32,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  FormContainer(
                    title: 'Complete Your Profile',
                    subTitle:
                        'Help us personalize your experience and opportunities.',
                  ),
                  SizedBox(height: 24),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Center(
                        child: GestureDetector(
                          onTap: pickImage,
                          child: CircleAvatar(
                            radius: 48,
                            backgroundColor: Colors.grey[200],
                            backgroundImage: (!_imageIsNull())
                                ? (kIsWeb
                                      ? NetworkImage(_webImage!.path)
                                            as ImageProvider
                                      : FileImage(_image!))
                                : null,
                            child: _imageIsNull()
                                ? const Icon(
                                    Icons.camera_alt,
                                    size: 32,
                                    color: Colors.grey,
                                  )
                                : null,
                          ),
                        ),
                      ),
                      SizedBox(height: 8),
                      Image.asset(
                        'assets/images/Profile Picture _optinal_.png',
                        width: 343,
                        height: 24,
                      ),
                    ],
                  ),
                  SizedBox(height: 16),

                  LabeledTextField(
                    controller: CompanyName,
                    hintText: 'Enter Company name',
                    title: 'Company Name',
                    isPassword: false,
                  ),
                  TextFieldTitle(title: 'Phone Number'),
                  SizedBox(height: 8),
                  IntlPhoneField(
                    onChanged: (phone) {
                      completePhoneNumber = phone
                          .completeNumber; // التقاط الرقم كاملاً مع كود الدولة
                    },
                    initialCountryCode: 'SA',
                    keyboardType: TextInputType.phone,
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Color(0xFFDEE2E6)),
                      ),
                      fillColor: Colors.white,
                      filled: true,

                      hintText: '5xxxxxxxxx',
                      contentPadding: EdgeInsets.fromLTRB(
                        12.0,
                        14.0,
                        12.0,
                        14.0,
                      ),

                      hintStyle: const TextStyle(
                        color: Color(0xFF969FA8),
                        fontSize: 13,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                  LabeledTextField(
                    controller: Country,
                    hintText: 'Select your country',
                    title: 'country',
                    isPassword: false,
                  ),
                  LabeledTextField(
                    controller: City,
                    hintText: 'Select your city',
                    title: 'City',
                    isPassword: false,
                  ),

                  SizedBox(height: 65),
                ],
              ),
            ),
            Container(
              color: Colors.white,
              width: double.infinity,
              child: Padding(
                padding: EdgeInsetsGeometry.symmetric(horizontal: 16),
                child: Column(
                  children: [
                    SizedBox(height: 16),
                    CustomButton(
                      text: 'Next',
                      onTap: () {
                        widget.startupModel.full_name = CompanyName.text;
                        widget.startupModel.phone_number = completePhoneNumber;
                        widget.startupModel.country = Country.text;
                        widget.startupModel.city = City.text;
                        widget.startupModel.phone_number = completePhoneNumber;
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return CompleteSignupPartnerSecondPage(
                                startupModel: widget.startupModel,
                                company_logo: kIsWeb ? _webImage : _image,
                              );
                            },
                          ),
                        );
                      },
                      buttonColor: AppColors.Blueprimary,
                    ),

                    SizedBox(height: 24),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

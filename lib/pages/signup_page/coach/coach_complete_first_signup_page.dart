import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_intl_phone_field/flutter_intl_phone_field.dart';
import 'package:grow_edge_app/constants/app_colors.dart';
import 'package:grow_edge_app/models/user_type_models/coach_model.dart';
import 'package:grow_edge_app/pages/signup_page/coach/complete_signup_coach_second_page.dart';
import 'package:grow_edge_app/widgets/bio_text_field.dart';
import 'package:grow_edge_app/widgets/custom_button.dart';
import 'package:grow_edge_app/widgets/custom_text_field.dart';
import 'package:grow_edge_app/widgets/form_container.dart';
import 'package:grow_edge_app/widgets/gender_button.dart';
import 'package:grow_edge_app/widgets/labeled_text_field.dart';
import 'package:grow_edge_app/widgets/logo_container.dart';
import 'package:grow_edge_app/widgets/text_field_title.dart';
import 'package:image_picker/image_picker.dart';

class CoachCompleteFirstSignupPage extends StatefulWidget {
  const CoachCompleteFirstSignupPage({super.key, required this.coachModel});

  final CoachModel coachModel;

  @override
  State<CoachCompleteFirstSignupPage> createState() =>
      _CoachCompleteFirstSignupPageState();
}

class _CoachCompleteFirstSignupPageState
    extends State<CoachCompleteFirstSignupPage> {
  final TextEditingController FullName = TextEditingController();
  final TextEditingController PhoneNumber = TextEditingController();
  final TextEditingController Country = TextEditingController();
  final TextEditingController City = TextEditingController();
  final TextEditingController Nationality = TextEditingController();
  final TextEditingController Language = TextEditingController();
  final TextEditingController calcom_username = TextEditingController();

  String selectedGender = 'male';
  File? _image;
  XFile? _webImage;
  String completePhoneNumber = '';
  final ImagePicker _picker = ImagePicker();

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
  void dispose() {
    FullName.dispose();
    Country.dispose();
    City.dispose();
    Nationality.dispose();
    Language.dispose();
    super.dispose();
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
                  Center(
                    //here
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
                  Center(
                    child: Text(
                      'Profile Picture (Optional)',
                      style: TextStyle(color: Colors.grey, fontSize: 12),
                    ),
                  ),
                  SizedBox(height: 16),

                  LabeledTextField(
                    controller: FullName,
                    hintText: 'Enter your full name',
                    title: 'Full Name',
                    isPassword: false,
                  ),
                  TextFieldTitle(title: 'Phone Number'),
                  SizedBox(height: 8),
                  IntlPhoneField(
                    onChanged: (phone) {
                      completePhoneNumber = phone
                          .completeNumber; // يحفظ الرقم كاملاً مع كود الدولة
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
                  LabeledTextField(
                    controller: Nationality,
                    hintText: 'Enter your nationality',
                    title: 'Nationality',
                    isPassword: false,
                  ),

                  LabeledTextField(
                    title: 'Language',
                    controller: Language,
                    hintText: 'Language your nationality',
                    isPassword: false,
                  ),
                  LabeledTextField(
                    controller: calcom_username,
                    hintText: 'Enter your cal name',
                    title: 'cal name',
                    isPassword: false,
                  ),
                  TextFieldTitle(title: 'Gender'),
                  SizedBox(height: 8),
                  Row(
                    children: [
                      GenderButton(
                        imageLink: 'assets/images/Male.png',
                        gender_type: 'Male',
                        isSelected: selectedGender == 'male',
                        onTap: () {
                          setState(() {
                            selectedGender = 'male';
                          });
                        },
                      ),
                      SizedBox(width: 8),
                      GenderButton(
                        imageLink: 'assets/images/Female.png',
                        gender_type: 'Female',
                        isSelected: selectedGender == 'female',
                        onTap: () {
                          setState(() {
                            selectedGender = 'female';
                          });
                        },
                      ),
                    ],
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
                        widget.coachModel.full_name = FullName.text;
                        widget.coachModel.phone_number = completePhoneNumber;
                        widget.coachModel.country = Country.text;
                        widget.coachModel.city = City.text;
                        widget.coachModel.nationality = Nationality.text;
                        widget.coachModel.calcom_username =
                            calcom_username.text;
                        widget.coachModel.gender = selectedGender;
                        widget.coachModel.languages = Language.text;
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return CompleteSignupCoachSecondPage(
                                coachModel: widget.coachModel,
                                live_image: kIsWeb ? _webImage : _image,
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

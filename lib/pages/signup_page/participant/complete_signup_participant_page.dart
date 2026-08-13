import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_intl_phone_field/flutter_intl_phone_field.dart';
import 'package:grow_edge_app/auth_cubit/auth_cubit.dart';
import 'package:grow_edge_app/auth_cubit/auth_state.dart';
import 'package:grow_edge_app/constants/app_colors.dart';
import 'package:grow_edge_app/pages/home_page.dart';
import 'package:grow_edge_app/pages/login_page.dart';
import 'package:grow_edge_app/widgets/bio_text_field.dart';
import 'package:grow_edge_app/widgets/custom_button.dart';
import 'package:grow_edge_app/widgets/custom_text_field.dart';
import 'package:grow_edge_app/widgets/form_container.dart';
import 'package:grow_edge_app/widgets/gender_button.dart';
import 'package:grow_edge_app/widgets/labeled_text_field.dart';
import 'package:grow_edge_app/widgets/logo_container.dart';
import 'package:grow_edge_app/widgets/success_widget.dart';
import 'package:grow_edge_app/widgets/text_field_title.dart';
import 'package:image_picker/image_picker.dart';

class CompleteProfileParticpantPage extends StatefulWidget {
  const CompleteProfileParticpantPage({
    super.key,
    required this.email,
    required this.otp,
  });
  final String email;
  final String otp;
  @override
  State<CompleteProfileParticpantPage> createState() =>
      _CompleteProfileParticpantPageState();
}

class _CompleteProfileParticpantPageState
    extends State<CompleteProfileParticpantPage> {
  final TextEditingController FullName = TextEditingController();
  final TextEditingController Country = TextEditingController();
  final TextEditingController City = TextEditingController();
  final TextEditingController Nationality = TextEditingController();
  final TextEditingController Language = TextEditingController();
  final TextEditingController Bio = TextEditingController();
  final TextEditingController CareerField = TextEditingController();
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
    Bio.dispose();
    CareerField.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthCubit(),
      child: Scaffold(
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
                        padding: EdgeInsets.symmetric(horizontal: 20),
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
                    TextFieldTitle(title: 'Country'),
                    SizedBox(height: 8),
                    CustomTextField(controller: Country, isPassword: false),
                    SizedBox(height: 16),
                    TextFieldTitle(title: 'City'),
                    SizedBox(height: 8),
                    CustomTextField(controller: City, isPassword: false),
                    SizedBox(height: 16),
                    LabeledTextField(
                      controller: Nationality,
                      hintText: 'Enter your nationality',
                      title: 'Nationality',
                      isPassword: false,
                    ),
                    LabeledTextField(
                      title: 'Career Field',
                      controller: CareerField,
                      hintText: 'Enter your career field',
                      isPassword: false,
                    ),
                    SizedBox(height: 16),
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
                    SizedBox(height: 16),
                    TextFieldTitle(title: 'Bio'),
                    SizedBox(height: 8),
                    BioTextField(bio: Bio, hintText: 'Write here...'),
                    SizedBox(height: 27),
                  ],
                ),
              ),
              Container(
                color: Colors.white,
                width: double.infinity,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: Column(
                    children: [
                      SizedBox(height: 16),
                      BlocConsumer<AuthCubit, AuthState>(
                        builder: (context, state) {
                          return state is AuthLoadingState
                              ? Center(child: CircularProgressIndicator())
                              : CustomButton(
                                  text: 'Complete Profile',
                                  onTap: () {
                                    var imageToSend = kIsWeb
                                        ? _webImage
                                        : _image;
                                    BlocProvider.of<AuthCubit>(
                                      context,
                                    ).registerParticipant(
                                      bio: Bio.text,
                                      city: City.text,
                                      country: Country.text,
                                      email: widget.email,
                                      full_name: FullName.text,
                                      gender: selectedGender,
                                      otp: widget.otp,
                                      phone_number: completePhoneNumber,
                                      live_photo: imageToSend,
                                    );
                                  },
                                  buttonColor: AppColors.Blueprimary,
                                );
                        },
                        listener: (context, state) {
                          if (state is AuthSuccessState) {
                            // 1. Show your custom success dialog widget
                            showDialog(
                              context: context,
                              barrierDismissible: false,
                              builder: (context) => const SuccessWidget(),
                            );

                            // 2. Wait 3 seconds, close the dialog, and navigate to HomePage
                            Future.delayed(
                              const Duration(milliseconds: 3000),
                              () {
                                if (context.mounted) {
                                  Navigator.pop(context); // Close dialog
                                  Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) {
                                        return LoginPage();
                                      },
                                    ),
                                  );
                                }
                              },
                            );
                          } else if (state is AuthFailureState) {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) {
                                  return HomePage(message: state.message);
                                },
                              ),
                            );
                          }
                        },
                      ),
                      SizedBox(height: 24),
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

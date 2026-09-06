import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grow_edge_app/features/auth/persentation/controller/auth_cubit/auth_cubit.dart';
import 'package:grow_edge_app/features/auth/persentation/controller/auth_cubit/auth_state.dart';
import 'package:grow_edge_app/constants/app_colors.dart';
import 'package:grow_edge_app/features/auth/data/models/user_type_models/coach_model.dart';
import 'package:grow_edge_app/features/auth/data/models/user_type_models/participant_model.dart';
import 'package:grow_edge_app/pages/home_page.dart';
import 'package:grow_edge_app/features/auth/persentation/screens/login_page.dart';
import 'package:grow_edge_app/features/auth/persentation/widgets/bio_text_field.dart';
import 'package:grow_edge_app/widgets/custom_button.dart';
import 'package:grow_edge_app/widgets/form_container.dart';
import 'package:grow_edge_app/widgets/labeled_text_field.dart';
import 'package:grow_edge_app/widgets/logo_container.dart';
import 'package:grow_edge_app/features/auth/persentation/widgets/success_widget.dart';
import 'package:grow_edge_app/widgets/text_field_title.dart';

class CompleteSignupCoachSecondPage extends StatefulWidget {
  const CompleteSignupCoachSecondPage({
    super.key,
    required this.coachModel,
    required this.live_image,
  });
  final CoachModel coachModel;
  final dynamic live_image;

  @override
  State<CompleteSignupCoachSecondPage> createState() =>
      _CompleteSignupCoachSecondPageState();
}

class _CompleteSignupCoachSecondPageState
    extends State<CompleteSignupCoachSecondPage> {
  final TextEditingController _skillController = TextEditingController();
  final TextEditingController careerFieldEn = TextEditingController();
  final TextEditingController careerFieldAr = TextEditingController();
  final TextEditingController workExpEn = TextEditingController();
  final TextEditingController workExpdAr = TextEditingController();
  final TextEditingController bioAr = TextEditingController();
  final TextEditingController bioEn = TextEditingController();
  final List<String> _skillsList = [];
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
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: LabeledTextField(
                              title: 'Skills',
                              controller: _skillController,
                              hintText: 'Enter your Skill',
                              isPassword: false,
                            ),
                          ),
                          SizedBox(width: 8),
                          Padding(
                            padding: const EdgeInsets.only(top: 24.0),
                            child: ElevatedButton(
                              onPressed: () {
                                if (_skillController.text.trim().isNotEmpty) {
                                  setState(() {
                                    _skillsList.add(
                                      _skillController.text.trim(),
                                    );
                                    _skillController.clear();
                                  });
                                }
                              },
                              child: Text('Add'),
                            ),
                          ),
                        ],
                      ),

                      Wrap(
                        spacing: 8.0,
                        children: List<Widget>.generate(_skillsList.length, (
                          index,
                        ) {
                          final skill = _skillsList[index];
                          return Chip(
                            label: Text(skill),
                            onDeleted: () {
                              setState(() {
                                _skillsList.removeAt(index);
                              });
                            },
                          );
                        }),
                      ),
                      SizedBox(height: 16),
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: LabeledTextField(
                          title: 'Career Field(En)',
                          controller: careerFieldEn,
                          hintText: 'Enter Career Field',
                          isPassword: false,
                        ),
                      ),
                      SizedBox(width: 16),
                      Expanded(
                        child: LabeledTextField(
                          title: 'Career Field(Ar)',
                          controller: careerFieldAr,
                          hintText: 'Enter Career Field',
                          isPassword: false,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: LabeledTextField(
                          title: 'Work Exp (En)',
                          controller: workExpEn,
                          hintText: 'Enter Work Exp',
                          isPassword: false,
                        ),
                      ),
                      SizedBox(width: 16),
                      Expanded(
                        child: LabeledTextField(
                          title: 'Work Exp (Ar)',
                          controller: workExpdAr,
                          hintText: 'Enter Work Exp',
                          isPassword: false,
                        ),
                      ),
                    ],
                  ),
                  TextFieldTitle(title: 'Bio (En)'),
                  SizedBox(height: 8),
                  BioTextField(bio: bioEn, hintText: 'Write here...'),
                  SizedBox(height: 16),
                  TextFieldTitle(title: 'Bio (Ar)'),
                  SizedBox(height: 8),
                  BioTextField(bio: bioAr, hintText: 'Write here...'),
                ],
              ),
            ),
            SizedBox(height: 27),
            Container(
              color: Colors.white,
              height: 84,
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: AppColors.Blueprimary),
                      ),
                      height: 44,
                      width: 66,
                      child: const Center(
                        child: Text(
                          'Back',
                          style: TextStyle(
                            color: AppColors.Blueprimary,
                            fontWeight: FontWeight.w700,
                            fontSize: 13,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: BlocConsumer<AuthCubit, AuthState>(
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
                              builder: (context) =>
                                  HomePage(message: state.message),
                            ),
                          );
                        }
                      },
                      builder: (context, state) {
                        return state is AuthLoadingState
                            ? Center(child: CircularProgressIndicator())
                            : CustomButton(
                                text: 'Complete Profile',
                                onTap: () {
                                  widget.coachModel.bio_ar = bioAr.text;
                                  widget.coachModel.bio_en = bioEn.text;
                                  widget.coachModel.working_field_ar =
                                      careerFieldAr.text;
                                  widget.coachModel.working_field_en =
                                      careerFieldEn.text;
                                  widget.coachModel.experience_en =
                                      workExpEn.text;
                                  widget.coachModel.experience_ar =
                                      workExpdAr.text;

                                  BlocProvider.of<AuthCubit>(
                                    context,
                                  ).registerCoach(
                                    caochmoodel: widget.coachModel,
                                    live_photo: widget.live_image,
                                    skills: _skillsList,
                                  );
                                },
                                buttonColor: AppColors.Greenprimary,
                              );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

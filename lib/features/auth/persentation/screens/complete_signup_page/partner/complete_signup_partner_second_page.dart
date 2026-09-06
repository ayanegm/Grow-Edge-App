import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grow_edge_app/features/auth/persentation/controller/auth_cubit/auth_cubit.dart';
import 'package:grow_edge_app/features/auth/persentation/controller/auth_cubit/auth_state.dart';
import 'package:grow_edge_app/constants/app_colors.dart';
import 'package:grow_edge_app/features/auth/data/models/user_type_models/startup_model.dart';
import 'package:grow_edge_app/pages/home_page.dart';
import 'package:grow_edge_app/features/auth/persentation/screens/login_page.dart';
import 'package:grow_edge_app/features/auth/persentation/widgets/cr_image_widget.dart';
import 'package:grow_edge_app/widgets/custom_button.dart';
import 'package:grow_edge_app/widgets/form_container.dart';
import 'package:grow_edge_app/widgets/labeled_text_field.dart';
import 'package:grow_edge_app/widgets/logo_container.dart';
import 'package:grow_edge_app/features/auth/persentation/widgets/success_widget.dart';
import 'package:grow_edge_app/widgets/text_field_title.dart';
import 'package:image_picker/image_picker.dart';

class CompleteSignupPartnerSecondPage extends StatefulWidget {
  const CompleteSignupPartnerSecondPage({
    super.key,
    required this.company_logo,
    required this.startupModel,
  });
  final StartupModel startupModel;
  final dynamic company_logo;

  @override
  State<CompleteSignupPartnerSecondPage> createState() =>
      _CompleteSignupPartnerSecondPageState();
}

class _CompleteSignupPartnerSecondPageState
    extends State<CompleteSignupPartnerSecondPage> {
  final TextEditingController businessField = TextEditingController();
  final TextEditingController companySize = TextEditingController();
  final TextEditingController commercialRegisterNo = TextEditingController();
  final TextEditingController website = TextEditingController();
  final TextEditingController foundationDateController =
      TextEditingController();

  static const List<String> _companySizes = [
    "1-10",
    "11-50",
    "51-200",
    "201-500",
    "500+",
  ];

  Future<void> _selectFoundationDate(BuildContext context) async {
    // Unfocus any active text field first to prevent layout/focus exceptions
    FocusScope.of(context).unfocus();

    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );

    if (picked != null) {
      setState(() {
        foundationDateController.text =
            "${picked.month.toString().padLeft(2, '0')}/${picked.day.toString().padLeft(2, '0')}/${picked.year}";
      });
    }
  }

  final ImagePicker _picker = ImagePicker();
  File? _crImageFile;
  XFile? _crImageWeb;
  String? selectedItem;

  Future<void> pickCrImage() async {
    final pickFile = await _picker.pickImage(source: ImageSource.gallery);
    if (pickFile != null) {
      setState(() {
        if (kIsWeb) {
          _crImageWeb = pickFile;
        } else {
          _crImageFile = File(pickFile.path);
        }
      });
    }
  }

  String _getCrFileName() {
    if (kIsWeb) {
      return _crImageWeb?.name ?? 'No file chosen';
    } else {
      return _crImageFile != null
          ? _crImageFile!.path.split('/').last
          : 'No file chosen';
    }
  }

  @override
  void dispose() {
    businessField.dispose();
    companySize.dispose();
    commercialRegisterNo.dispose();
    website.dispose();
    foundationDateController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    LogoContainer(
                      childWidget: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 56),
                          GestureDetector(
                            onTap: () => Navigator.pop(context),
                            child: const Padding(
                              padding: EdgeInsets.symmetric(horizontal: 20),
                              child: ImageIcon(
                                AssetImage('assets/images/Container.png'),
                                size: 32,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 16),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const FormContainer(
                            title: 'Complete Your Profile',
                            subTitle:
                                'Help us personalize your experience and opportunities.',
                          ),
                          const SizedBox(height: 24),
                          LabeledTextField(
                            title: 'Business Field',
                            controller: businessField,
                            hintText: 'Select your Skills',
                            isPassword: false,
                          ),
                          const TextFieldTitle(title: 'Company size'),
                          const SizedBox(height: 8),
                          DropdownButtonFormField<String>(
                            initialValue: selectedItem,
                            hint: const Text(
                              'Select Company size',
                              style: TextStyle(
                                color: Color(0xFF969FA8),
                                fontSize: 13,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            icon: const Icon(
                              Icons.keyboard_arrow_down,
                              color: Color(0xFF969FA8),
                            ),
                            decoration: const InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0xFFDEE2E6),
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: AppColors.Blueprimary,
                                ),
                              ),
                              fillColor: Colors.white,
                              filled: true,
                              contentPadding: EdgeInsets.symmetric(
                                horizontal: 12.0,
                                vertical: 14.0,
                              ),
                            ),
                            items: _companySizes.map((String size) {
                              return DropdownMenuItem<String>(
                                value: size,
                                child: Text(
                                  size,
                                  style: const TextStyle(
                                    fontSize: 13,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.black87,
                                  ),
                                ),
                              );
                            }).toList(),
                            onChanged: (String? newValue) {
                              setState(() {
                                selectedItem = newValue;
                              });
                            },
                          ),
                          const SizedBox(height: 16),
                          LabeledTextField(
                            title: 'Commercial Register Number',
                            controller: commercialRegisterNo,
                            hintText: 'Enter Commercial Register Number',
                            isPassword: false,
                          ),
                          const TextFieldTitle(
                            title: 'Commercial Register File',
                          ),
                          const SizedBox(height: 8),
                          CrImageWidget(
                            fileName: _getCrFileName(),
                            onTap: pickCrImage,
                          ),
                          const SizedBox(height: 16),
                          const TextFieldTitle(title: 'Foundation Date'),
                          const SizedBox(height: 8),
                          // Clean implementation avoiding AbsorbPointer wrapper issues
                          TextField(
                            controller: foundationDateController,
                            readOnly: true,
                            onTap: () => _selectFoundationDate(context),
                            decoration: InputDecoration(
                              hintText: 'mm/dd/yyyy',
                              hintStyle: const TextStyle(
                                color: Color(0xFF969FA8),
                                fontSize: 13,
                                fontWeight: FontWeight.w400,
                              ),
                              suffixIcon: const Icon(
                                Icons.calendar_today,
                                color: Color(0xFF969FA8),
                                size: 18,
                              ),
                              enabledBorder: const OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0xFFDEE2E6),
                                ),
                              ),
                              focusedBorder: const OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: AppColors.Blueprimary,
                                ),
                              ),
                              fillColor: Colors.white,
                              filled: true,
                              contentPadding: const EdgeInsets.symmetric(
                                horizontal: 12.0,
                                vertical: 14.0,
                              ),
                            ),
                          ),
                          const SizedBox(height: 16),
                          LabeledTextField(
                            title: 'Website',
                            controller: website,
                            hintText: 'Enter company website',
                            isPassword: false,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 27),
                  ],
                ),
              ),
            ),
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
                                  widget.startupModel.working_field =
                                      businessField.text;
                                  widget.startupModel.company_size =
                                      selectedItem;
                                  widget.startupModel.cr =
                                      commercialRegisterNo.text;
                                  widget.startupModel.foundation =
                                      foundationDateController.text;
                                  widget.startupModel.website = website.text;
                                  final crImageToSend = kIsWeb
                                      ? _crImageWeb
                                      : _crImageFile;

                                  BlocProvider.of<AuthCubit>(
                                    context,
                                  ).registerSatartup(
                                    startupmoodel: widget.startupModel,
                                    company_logo: widget.company_logo,
                                    cr_image: crImageToSend,
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

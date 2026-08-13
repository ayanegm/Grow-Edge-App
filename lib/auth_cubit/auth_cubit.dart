import 'dart:convert';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:grow_edge_app/auth_cubit/auth_state.dart';
import 'package:grow_edge_app/models/user_type_models/base_user_model.dart';
import 'package:grow_edge_app/models/user_type_models/coach_model.dart';
import 'package:grow_edge_app/models/user_type_models/startup_model.dart';
import 'package:http/http.dart' as http;

class AuthFlowData {
  String? email;
  String? token;
  String? otp;
}

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitialState());
  AuthFlowData flowData = AuthFlowData();
  void register({
    required String email,
    required String password,
    required String password_confirmation,
    required String user_type,
  }) async {
    emit(AuthLoadingState());
    try {
      http.Response response = await http.post(
        Uri.parse('https://dev.growedge.net/api/auth/register'),
        headers: {'Accept': 'application/json'},
        body: {
          'email': email,
          'password': password,
          'password_confirmation': password_confirmation,
          'user_type': user_type,
        },
      );

      var responseBody = jsonDecode(response.body);

      if (response.statusCode == 200 || response.statusCode == 201) {
        emit(AuthSuccessState());
      } else {
        emit(
          AuthFailureState(
            message: responseBody['message'] ?? 'Failed to register',
          ),
        );
      }
    } catch (e) {
      emit(AuthFailureState(message: e.toString()));
    }
  }

  void verify_otp({required String email, required String otp}) async {
    emit(AuthLoadingState());
    try {
      http.Response response = await http.post(
        Uri.parse('https://dev.growedge.net/api/auth/register/verify-otp'),
        headers: {'Accept': 'application/json'},
        body: {'email': email, 'otp': otp},
      );

      var responseBody = jsonDecode(response.body);

      if (response.statusCode == 200 || response.statusCode == 201) {
        emit(AuthSuccessState());
      } else {
        emit(
          AuthFailureState(
            message: responseBody['message'] ?? 'Failed to verify otp',
          ),
        );
      }
    } catch (e) {
      emit(AuthFailureState(message: e.toString()));
    }
  }

  login({required String email, required String password}) async {
    emit(AuthLoadingState());
    try {
      http.Response response = await http.post(
        Uri.parse('https://dev.growedge.net/api/auth/login'),
        body: {'email': email, 'password': password},
        headers: {'Accept': 'application/json'},
      );
      var responseBody = jsonDecode(response.body);
      if (response.statusCode == 200 || response.statusCode == 201) {
        emit(AuthSuccessState());
      } else {
        emit(AuthFailureState(message: responseBody['message']));
      }
    } catch (e) {
      emit(AuthFailureState(message: e.toString()));
    }
  }

  registerParticipant({
    required String email,
    required String country,
    required String city,
    required String otp,
    required String phone_number,
    required String bio,
    required String gender,
    required String full_name,
    required dynamic live_photo, // الصورة (File للموبايل أو XFile للويب)
  }) async {
    emit(AuthLoadingState());
    try {
      var request = http.MultipartRequest(
        'POST',
        Uri.parse(
          'https://dev.growedge.net/api/auth/register/completeRegisterUser',
        ),
      );

      request.fields['email'] = email;
      request.fields['otp'] = otp;
      request.fields['country'] = country;
      request.fields['city'] = city;
      request.fields['phone_number'] = phone_number;
      request.fields['bio'] = bio;
      request.fields['full_name'] = full_name;
      request.fields['gender'] = gender;

      if (live_photo != null) {
        if (kIsWeb) {
          var bytes = await live_photo.readAsBytes();
          request.files.add(
            http.MultipartFile.fromBytes(
              'live_photo',
              bytes,
              filename: live_photo.name ?? 'upload.jpg',
            ),
          );
        } else {
          request.files.add(
            await http.MultipartFile.fromPath(
              'live_photo',
              (live_photo as File).path,
            ),
          );
        }
      }
      request.headers.addAll({'Accept': 'application/json'});
      var streamedResponse = await request.send();
      var response = await http.Response.fromStream(streamedResponse);

      var responseBody = jsonDecode(response.body);

      if (response.statusCode == 200 || response.statusCode == 201) {
        if (responseBody.containsKey('errors')) {
          var errors = responseBody['errors'];
          String errorMessage = '';
          if (errors is Map && errors.isNotEmpty) {
            errorMessage = errors.values.first[0];
          } else {
            errorMessage = responseBody['message'] ?? 'validation failed';
          }
          emit(AuthFailureState(message: errorMessage));
        } else {
          emit(AuthSuccessState());
        }
      } else {
        emit(
          AuthFailureState(message: responseBody['message'] ?? 'Server error'),
        );
      }
    } catch (e) {
      emit(AuthFailureState(message: e.toString()));
    }
  }

  Future<void> registerSatartup({
    required StartupModel startupmoodel,
    required dynamic company_logo,
    required dynamic cr_image,
  }) async {
    emit(AuthLoadingState());
    try {
      var request = http.MultipartRequest(
        'POST',
        Uri.parse(
          'https://dev.growedge.net/api/auth/register/completeRegisterCompany',
        ),
      );

      request.fields['email'] = startupmoodel.email!;
      request.fields['otp'] = startupmoodel.otp!;
      request.fields['country'] = startupmoodel.country!;
      request.fields['city'] = startupmoodel.city!;
      request.fields['phone_number'] = startupmoodel.phone_number!;
      request.fields['website'] = startupmoodel.website!;
      request.fields['foundation'] = startupmoodel.foundation!;
      request.fields['company_size'] = startupmoodel.company_size!;
      request.fields['working_field'] = startupmoodel.working_field!;
      request.fields['cr'] = startupmoodel.cr!;
      request.fields['full_name'] = startupmoodel.full_name!;

      if (company_logo != null) {
        if (kIsWeb) {
          var bytes = await company_logo.readAsBytes();
          request.files.add(
            http.MultipartFile.fromBytes(
              'company_logo',
              bytes,
              filename: company_logo.name ?? 'logo.jpg',
            ),
          );
        } else {
          request.files.add(
            await http.MultipartFile.fromPath(
              'company_logo',
              (company_logo as File).path,
            ),
          );
        }
      }

      if (cr_image != null) {
        if (kIsWeb) {
          var bytes = await cr_image.readAsBytes();
          request.files.add(
            http.MultipartFile.fromBytes(
              'cr_image',
              bytes,
              filename: cr_image.name ?? 'cr.jpg',
            ),
          );
        } else {
          request.files.add(
            await http.MultipartFile.fromPath(
              'cr_image',
              (cr_image as File).path,
            ),
          );
        }
      }
      request.headers.addAll({'Accept': 'application/json'});
      var streamedResponse = await request.send();
      var response = await http.Response.fromStream(streamedResponse);

      var responseBody = jsonDecode(response.body);

      if (response.statusCode == 200 || response.statusCode == 201) {
        if (responseBody.containsKey('errors')) {
          var errors = responseBody['errors'];
          String errorMessage = '';
          if (errors is Map && errors.isNotEmpty) {
            errorMessage = errors.values.first[0];
          } else {
            errorMessage = responseBody['message'] ?? 'validation failed';
          }
          emit(AuthFailureState(message: errorMessage));
        } else {
          emit(AuthSuccessState());
        }
      } else {
        emit(
          AuthFailureState(message: responseBody['message'] ?? 'Server error'),
        );
      }
    } catch (e) {
      emit(AuthFailureState(message: e.toString()));
    }
  }

  Future<void> registerCoach({
    required CoachModel caochmoodel,
    required dynamic live_photo,
    required List<String> skills,
  }) async {
    emit(AuthLoadingState());
    try {
      var request = http.MultipartRequest(
        'POST',
        Uri.parse(
          'https://dev.growedge.net/api/auth/register/completeRegisterCoach',
        ),
      );
      request.fields['full_name'] = caochmoodel.full_name ?? '';
      request.fields['email'] = caochmoodel.email ?? '';
      request.fields['otp'] = caochmoodel.otp ?? '';
      request.fields['country'] = caochmoodel.country ?? '';
      request.fields['city'] = caochmoodel.city ?? '';
      request.fields['phone_number'] = caochmoodel.phone_number ?? '';
      request.fields['bio_en'] = caochmoodel.bio_en ?? '';
      request.fields['experience_en'] = caochmoodel.experience_en ?? '';
      request.fields['languages'] = caochmoodel.languages ?? '';
      request.fields['nationality'] = caochmoodel.nationality ?? '';
      request.fields['gender'] = caochmoodel.gender ?? 'male';
      request.fields['working_field_en'] = caochmoodel.working_field_en ?? '';
      request.fields['calcom_username'] = caochmoodel.calcom_username ?? '';
      request.fields['bio_ar'] = caochmoodel.bio_ar ?? '';
      request.fields['experience_ar'] = caochmoodel.experience_ar ?? '';
      request.fields['working_field_ar'] = caochmoodel.working_field_ar ?? '';
      for (int i = 0; i < skills.length; i++) {
        request.fields['skills[$i]'] = skills[i];
      }
      if (live_photo != null) {
        if (kIsWeb) {
          var bytes = await live_photo.readAsBytes();
          request.files.add(
            http.MultipartFile.fromBytes(
              'company_logo',
              bytes,
              filename: live_photo.name ?? 'logo.jpg',
            ),
          );
        } else {
          request.files.add(
            await http.MultipartFile.fromPath(
              'company_logo',
              (live_photo as File).path,
            ),
          );
        }
      }

      request.headers.addAll({'Accept': 'application/json'});
      var streamedResponse = await request.send();
      var response = await http.Response.fromStream(streamedResponse);

      var responseBody = jsonDecode(response.body);

      if (response.statusCode == 200 || response.statusCode == 201) {
        if (responseBody.containsKey('errors')) {
          var errors = responseBody['errors'];
          String errorMessage = '';
          if (errors is Map && errors.isNotEmpty) {
            errorMessage = errors.values.first[0];
          } else {
            errorMessage = responseBody['message'] ?? 'validation failed';
          }
          emit(AuthFailureState(message: errorMessage));
        } else {
          emit(AuthSuccessState());
        }
      } else {
        emit(
          AuthFailureState(message: responseBody['message'] ?? 'Server error'),
        );
      }
    } catch (e) {
      emit(AuthFailureState(message: e.toString()));
    }
  }

  forgetPassword({required String email}) async {
    emit(AuthLoadingState());
    try {
      http.Response response = await http.post(
        Uri.parse('https://dev.growedge.net/api/auth/forgotPassword'),
        headers: {'Accept': 'application/json'},
        body: {'email': email},
      );

      var responseBody = jsonDecode(response.body);

      if (response.statusCode == 200 || response.statusCode == 201) {
        emit(AuthSuccessState(data: responseBody));
      } else {
        emit(
          AuthFailureState(
            message: responseBody['message'] ?? 'Failed to verify otp',
          ),
        );
      }
    } catch (e) {
      emit(AuthFailureState(message: e.toString()));
    }
  }

  resetPassword({
    required String email,
    required String otp,
    required String password,
    required String password_confirmation,
    required String token,
  }) async {
    emit(AuthLoadingState());
    try {
      http.Response response = await http.post(
        Uri.parse('https://dev.growedge.net/api/auth/forgotPassword'),
        headers: {'Accept': 'application/json'},
        body: {
          'email': email,
          'token': token,
          'password': password,
          'password_confirmation': password_confirmation,
          'otp': otp,
        },
      );

      var responseBody = jsonDecode(response.body);

      if (response.statusCode == 200 || response.statusCode == 201) {
        emit(AuthSuccessState());
      } else {
        emit(
          AuthFailureState(
            message: responseBody['message'] ?? 'Failed to verify otp',
          ),
        );
      }
    } catch (e) {
      emit(AuthFailureState(message: e.toString()));
    }
  }
}

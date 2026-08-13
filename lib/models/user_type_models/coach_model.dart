import 'package:grow_edge_app/models/user_type_models/base_user_model.dart';

class CoachModel extends BaseUserModel {
  String? live_photo;
  String? gender;
  String? country;
  String? phone_number;
  String? bio_en;
  String? city;
  @override
  String? email;
  @override
  String? otp;
  String? full_name;
  String? nationality;
  String? experience_en;
  String? languages;
  String? working_field_en;
  String? calcom_username;
  String? bio_ar;
  String? experience_ar;
  String? working_field_ar;

  CoachModel({
    this.live_photo,
    this.gender,
    this.country,
    this.phone_number,
    this.city,
    this.email,
    this.otp,
    this.bio_ar,
    this.bio_en,
    this.calcom_username,
    this.experience_ar,
    this.experience_en,
    this.full_name,
    this.languages,
    this.nationality,
    this.working_field_ar,
    this.working_field_en,
  });

  factory CoachModel.fromJson(Map<String, dynamic> json) {
    return CoachModel(
      gender: json['gender'],
      country: json['country'],
      phone_number: json['phone_number'],
      city: json['city'],
      email: json['email'],
      otp: json['otp'],
      bio_ar: json['bio_ar'],
      bio_en: json['bio_en'],
      calcom_username: json['calcom_username'],
      experience_ar: json['experience_ar'],
      experience_en: json['experience_en'],
      full_name: json['full_name'],
      languages: json['languages'],
      nationality: json['nationality'],
      working_field_ar: json['working_field_ar'],
      working_field_en: json['working_field_en'],
    );
  }
  @override
  Map<String, dynamic> toJson() {
    return {
      'gender': gender,
      'country': country,
      'phone_number': phone_number,
      'city': city,
      'email': email,
      'otp': otp,
      'bio_ar': bio_ar,
      'bio_en': bio_en,
      'calcom_username': calcom_username,
      'experience_ar': experience_ar,
      'experience_en': experience_en,
      'full_name': full_name,
      'languages': languages,
      'nationality': nationality,
      'working_field_ar': working_field_ar,
      'working_field_en': working_field_en,
    };
  }
}

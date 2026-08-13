import 'package:grow_edge_app/models/user_type_models/base_user_model.dart';

class StartupModel extends BaseUserModel {
  String? working_field;
  String? company_size;
  String? foundation;
  String? website;
  String? country;
  String? city;
  String? phone_number;
  String? cr;
  String? full_name;

  @override
  String? email;
  @override
  String? otp;
  StartupModel({
    this.working_field,
    this.company_size,
    this.foundation,
    this.website,
    this.country,
    this.city,
    this.phone_number,
    this.email,
    this.otp,
    this.cr,
    this.full_name,
  });
  factory StartupModel.fromJson(Map<String, dynamic> json) {
    return StartupModel(
      working_field: json['working_field'],
      company_size: json['company_size'],
      foundation: json['foundation'],
      website: json['website'],
      country: json['country'],
      city: json['city'],
      phone_number: json['phone_number'],
      otp: json['otp'],
      email: json['email'],
      cr: json['cr'],
      full_name: json['full_name'],
    );
  }
  @override
  Map<String, dynamic> toJson() {
    return {
      'working_field': working_field,
      'company_size': company_size,
      'foundation': foundation,
      'website': website,
      'country': country,
      'city': city,
      'otp': otp,
      'full_name': full_name,

      'email': email,

      'phone_number': phone_number,
      'cr': cr,
    };
  }
}

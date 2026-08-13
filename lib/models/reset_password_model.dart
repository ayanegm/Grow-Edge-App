import 'package:grow_edge_app/models/user_type_models/base_user_model.dart';

class ResetPasswordModel extends BaseUserModel {
  String? token;
  @override
  String? email;
  String? password;
  String? password_confirmation;
  @override
  String? otp;
  ResetPasswordModel({
    this.password,
    this.password_confirmation,
    this.token,
    this.email,
    this.otp,
  });
  factory ResetPasswordModel.fromJson(Map<String, dynamic> json) {
    return ResetPasswordModel(
      password_confirmation: json['password_confirmation'],
      password: json['password'],
      token: json['token'],

      otp: json['otp'],
      email: json['email'],
    );
  }
  @override
  Map<String, dynamic> toJson() {
    return {
      'password_confirmation': password_confirmation,
      'password': password,
      'token': token,

      'otp': otp,

      'email': email,
    };
  }
}

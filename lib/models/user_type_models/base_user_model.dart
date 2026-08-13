abstract class BaseUserModel {
  String? email;
  String? otp;
  String? userType;
  BaseUserModel({this.email, this.otp, this.userType});
  Map<String, dynamic> toJson();
}

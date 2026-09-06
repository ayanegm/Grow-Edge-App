import 'package:grow_edge_app/features/auth/data/models/user_type_models/base_user_model.dart';

class ParticipantModel extends BaseUserModel {
  String? live_photo;
  String? gender;
  String? country;
  String? phone_number;
  String? bio;
  String? city;
  @override
  String? email;
  @override
  String? otp;

  ParticipantModel({
    this.live_photo,
    this.gender,
    this.country,
    this.phone_number,
    this.bio,
    this.city,
    this.email,
    this.otp,
  });

  factory ParticipantModel.fromJson(Map<String, dynamic> json) {
    return ParticipantModel(
      live_photo: json['live_photo'],
      gender: json['gender'],
      country: json['country'],
      phone_number: json['phone_number'],
      bio: json['bio'],
      city: json['city'],
      email: json['email'],
      otp: json['otp'],
    );
  }
  @override
  Map<String, dynamic> toJson() {
    return {
      'live_photo': live_photo,
      'gender': gender,
      'country': country,
      'phone_number': phone_number,
      'bio': bio,
      'city': city,
      'user_type': userType,
      'email': email,
      'otp': otp,
    };
  }
}

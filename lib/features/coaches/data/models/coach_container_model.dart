class CoachContainerModel {
  String? name;
  String? live_photo;
  String? working_field;
  String? languages;
  String? experience;
  String? bio;
  int? id;
  List<String>? skills;
  int? show_package;
  CoachContainerModel({
    this.live_photo,
    this.name,
    this.working_field,
    this.languages,
    this.experience,
    this.bio,
    this.id,
    this.skills,
    this.show_package,
  });
  factory CoachContainerModel.fromJson(Map<String, dynamic> json) {
    return CoachContainerModel(
      live_photo: json['live_photo'],
      name: json['name'],
      working_field: json['working_field'],
      languages: json['languages'],
      experience: json['experience'],
      bio: json['bio'],
      id: json['id'],
      show_package: json['show_package'],
      skills: json['skills'] != null ? List<String>.from(json['skills']) : null,
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'live_photo': live_photo,
      'name': name,
      'working_field': working_field,
      'languages': languages,
      'experience': experience,
      'bio': bio,
      'skills': skills,
      'show_package': show_package,
    };
  }
}

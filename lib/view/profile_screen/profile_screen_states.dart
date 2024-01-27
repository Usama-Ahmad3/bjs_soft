import 'package:equatable/equatable.dart';

enum Status { loading, success, failure }

class ProfileScreenState extends Equatable {
  String image;
  String title;
  String role;
  String email;
  String gender;
  String dob;
  String file;
  bool fileImage;
  Status status;
  bool accountSwitch;
  bool notificationSwitch;
  bool themeSwitch;
  ProfileScreenState(
      {this.image = '',
      this.role = '',
      this.title = '',
      this.email = '',
      this.dob = '',
      this.gender = '',
        this.file = '',
        this.fileImage = false,
      this.accountSwitch = false,
      this.notificationSwitch = false,
      this.themeSwitch = false,
      this.status = Status.loading});
  ProfileScreenState copyWith(
      {String? image,
      String? title,
      String? role,
      String? email,
      String? gender,
      String? dob,
        String? file,
        bool? fileImage,
      bool? accountSwitch,
      bool? notificationSwitch,
      bool? themeSwitch,
      Status? status}) {
    return ProfileScreenState(
        image: image ?? this.image,
        role: role ?? this.role,
        title: title ?? this.title,
        email: email ?? this.email,
        dob: dob ?? this.dob,
        file: file ?? this.file,
        fileImage: fileImage ?? this.fileImage,
        accountSwitch: accountSwitch ?? this.accountSwitch,
        notificationSwitch: notificationSwitch ?? this.notificationSwitch,
        themeSwitch: themeSwitch ?? this.themeSwitch,
        gender: gender ?? this.gender,
        status: status ?? this.status);
  }

  @override
  List<Object?> get props => [
        image,
        title,
        role,
        email,
        gender,
        dob,
        status,
    file,fileImage,
        themeSwitch,
        notificationSwitch,
        accountSwitch
      ];
}

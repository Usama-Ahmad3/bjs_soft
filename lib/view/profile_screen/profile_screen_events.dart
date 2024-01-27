import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

abstract class ProfileScreenEvents extends Equatable {}

class ProfileScreenEditButtonClick extends ProfileScreenEvents {
  String image;
  String title;
  String role;
  String email;
  String gender;
  String dob;
  String file;
  bool fileImage;
  BuildContext context;
  ProfileScreenEditButtonClick(
      {required this.image,
      required this.role,
      required this.context,
      required this.title,
      required this.email,
      required this.dob,
      required this.file,
      required this.fileImage,
      required this.gender});
  @override
  List<Object?> get props =>
      [image, title, role, email, gender, dob, file, fileImage];
}

class ProfileScreenInitial extends ProfileScreenEvents {
  @override
  List<Object?> get props => [];
}

class ProfileScreenAccountSwitchOnOff extends ProfileScreenEvents {
  ProfileScreenAccountSwitchOnOff();
  @override
  List<Object?> get props => [];
}

class ProfileScreenNotificationSwitchOnOff extends ProfileScreenEvents {
  ProfileScreenNotificationSwitchOnOff();
  @override
  List<Object?> get props => [];
}

class ProfileScreenThemeSwitchOnOff extends ProfileScreenEvents {
  ProfileScreenThemeSwitchOnOff();
  @override
  List<Object?> get props => [];
}

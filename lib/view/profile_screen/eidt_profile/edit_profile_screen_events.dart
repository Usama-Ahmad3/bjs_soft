import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

abstract class EditProfileEvents extends Equatable {}

class EditProfileInitialEvent extends EditProfileEvents {
  Map detail;
  EditProfileInitialEvent({required this.detail});
  @override
  List<Object?> get props => [];
}

class EditProfileSaveButtonEvent extends EditProfileEvents {
  String title;
  String email;
  String gender;
  String dob;
  String file;
  bool fileImage;
  BuildContext context;
  EditProfileSaveButtonEvent(
      {required this.title,
      required this.email,
      required this.gender,
      required this.context,
      this.file = '',
      required this.fileImage,
      required this.dob});
  @override
  List<Object?> get props =>
      [title, email, gender, dob, context, file, fileImage];
}

class EditProfileCancelButtonEvent extends EditProfileEvents {
  BuildContext context;
  EditProfileCancelButtonEvent({required this.context});
  @override
  List<Object?> get props => [context];
}

class EditProfileScreenCameraEvent extends EditProfileEvents {
  @override
  List<Object?> get props => [];
}

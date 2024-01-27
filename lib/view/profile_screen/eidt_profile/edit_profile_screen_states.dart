import 'package:equatable/equatable.dart';
import 'package:untitled1/view/profile_screen/profile_screen_states.dart';

class EditProfileScreenStates extends Equatable {
  String image;
  String title;
  String role;
  String email;
  String gender;
  String dob;
  String? file;
  bool fileImage;
  Status status;
  EditProfileScreenStates(
      {this.image = '',
      this.role = '',
      this.title = '',
      this.email = '',
      this.dob = '',
      this.gender = '',
      this.fileImage = false,
      this.status = Status.loading,
      this.file});
  EditProfileScreenStates copyWith(
      {String? image,
      String? title,
      String? role,
      String? email,
      String? gender,
      String? dob,
      String? file,
      bool? fileImage,
      Status? status}) {
    return EditProfileScreenStates(
        image: image ?? this.image,
        role: role ?? this.role,
        title: title ?? this.title,
        email: email ?? this.email,
        dob: dob ?? this.dob,
        file: file ?? this.file,
        fileImage: fileImage ?? this.fileImage,
        gender: gender ?? this.gender,
        status: status ?? this.status);
  }

  @override
  List<Object?> get props =>
      [image, title, role, email, gender, dob, file, status, fileImage];
}

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:untitled1/utils/image_picker_utils.dart';
import 'package:untitled1/view/profile_screen/eidt_profile/edit_profile_screen_events.dart';
import 'package:untitled1/view/profile_screen/profile_screen.dart';
import 'package:untitled1/view/profile_screen/profile_screen_states.dart';

import 'edit_profile_screen_states.dart';

class EditProfileBloc extends Bloc<EditProfileEvents, EditProfileScreenStates> {
  final ImagePickerUtils imagePickerUtils;
  EditProfileBloc({required this.imagePickerUtils})
      : super(EditProfileScreenStates()) {
    on<EditProfileInitialEvent>(_loadDate);
    on<EditProfileSaveButtonEvent>(_saveData);
    on<EditProfileCancelButtonEvent>(_cancel);
    on<EditProfileScreenCameraEvent>(_openCamera);
  }

  void _loadDate(
      EditProfileInitialEvent event, Emitter<EditProfileScreenStates> emit) {
    emit(state.copyWith(
        role: event.detail['role'],
        gender: event.detail['gender'],
        dob: event.detail['dob'],
        image: event.detail['image'],
        email: event.detail['email'],
        title: event.detail['title'],
        fileImage: event.detail['fileImage'],
        file: event.detail['file'],
        status: Status.success));
  }

  Future<void> _saveData(EditProfileSaveButtonEvent event,
      Emitter<EditProfileScreenStates> emit) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('title', event.title);
    prefs.setString('email', event.email);
    prefs.setString('gender', event.gender);
    prefs.setString('dob', event.dob);
    prefs.setString('file', event.file);
    prefs.setBool('fileImage', event.fileImage);
    // ignore: use_build_context_synchronously
    Navigator.pushReplacement(
        event.context,
        MaterialPageRoute(
          builder: (context) => ProfileScreen(),
        ));
  }

  void _cancel(EditProfileCancelButtonEvent event,
      Emitter<EditProfileScreenStates> emit) {
    Navigator.pop(event.context);
  }

  Future<void> _openCamera(EditProfileScreenCameraEvent event,
      Emitter<EditProfileScreenStates> emit) async {
    final XFile? file = await imagePickerUtils.cameraCapture();
    emit(state.copyWith(
        file: file!.path.toString(), fileImage: true, status: Status.success));
  }
}

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:untitled1/main.dart';
import 'package:untitled1/view/profile_screen/profile_screen_events.dart';
import 'package:untitled1/view/profile_screen/profile_screen_states.dart';

import 'eidt_profile/edit_profile_screen.dart';

class ProfileScreenBloc extends Bloc<ProfileScreenEvents, ProfileScreenState> {
  ProfileScreenBloc() : super(ProfileScreenState()) {
    on<ProfileScreenInitial>(_circularProgress);
    on<ProfileScreenEditButtonClick>(_navigateToEdit);
    on<ProfileScreenAccountSwitchOnOff>(_accountSwitchChange);
    on<ProfileScreenNotificationSwitchOnOff>(_notificationSwitchChange);
    on<ProfileScreenThemeSwitchOnOff>(_themeSwitchChange);
  }
  Future<void> _circularProgress(
      ProfileScreenEvents events, Emitter<ProfileScreenState> emit) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String image;
    String title;
    String role;
    String email;
    String gender;
    String dob;
    String file;
    bool fileImage;
    bool accountSwitch;
    bool notificationSwitch;
    bool themeSwitch;
    image = prefs.getString('image') ??
        'https://tse1.mm.bing.net/th?id=OIP.leRaZskYpTKA55a0St0tZgHaJa&pid=Api&P=0&h=220';
    title = prefs.getString('title') ?? 'Mark Adam';
    email = prefs.getString('email') ?? 'usama.ahmad435750@gmail.com';
    gender = prefs.getString('gender') ?? 'Male';
    dob = prefs.getString('dob') ?? '15/05/2000';
    role = prefs.getString('role') ?? 'Developer';
    file = prefs.getString('file') ?? '';
    fileImage = prefs.getBool('fileImage') ?? false;
    accountSwitch = prefs.getBool('account') ?? false;
    themeSwitch = prefs.getBool('theme') ?? false;
    notificationSwitch = prefs.getBool('notification') ?? false;
    emit(state.copyWith(
        title: title,
        email: email,
        image: image,
        dob: dob,
        gender: gender,
        role: role,
        file: file,
        fileImage: fileImage,
        themeSwitch: themeSwitch,
        notificationSwitch: notificationSwitch,
        accountSwitch: accountSwitch,
        status: Status.success));
  }

  void _navigateToEdit(
      ProfileScreenEditButtonClick event, Emitter<ProfileScreenState> emit) {
    Map detail = {
      'title': state.title,
      'email': state.email,
      'image': state.image,
      'dob': state.dob,
      'gender': state.gender,
      "role": state.role,
      'file': state.file,
      'fileImage': state.fileImage
    };
    Navigator.push(
        event.context,
        MaterialPageRoute(
          builder: (context) => EditProfileScreen(
            detail: detail,
          ),
        ));
  }

  void _accountSwitchChange(
      ProfileScreenAccountSwitchOnOff event, Emitter<ProfileScreenState> emit) {
    emit(state.copyWith(
        accountSwitch: state.accountSwitch == false ? true : false));
  }

  void _notificationSwitchChange(ProfileScreenNotificationSwitchOnOff event,
      Emitter<ProfileScreenState> emit) {
    emit(state.copyWith(
        notificationSwitch: state.notificationSwitch == false ? true : false));
  }

  void _themeSwitchChange(
      ProfileScreenThemeSwitchOnOff event, Emitter<ProfileScreenState> emit) {
    state.themeSwitch == false ? MyApp.mode = ThemeMode.light : ThemeMode.dark;
    emit(
        state.copyWith(themeSwitch: state.themeSwitch == false ? true : false));
  }
}

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled1/res/app_colors/app_colors.dart';
import 'package:untitled1/res/common_widgets/big_button.dart';
import 'package:untitled1/res/common_widgets/text_field_widget.dart';
import 'package:untitled1/res/common_widgets/text_widget.dart';
import 'package:untitled1/view/profile_screen/eidt_profile/edit_profile_screen_bloc.dart';
import 'package:untitled1/view/profile_screen/eidt_profile/edit_profile_screen_events.dart';
import 'package:untitled1/view/profile_screen/eidt_profile/edit_profile_screen_states.dart';
import 'package:untitled1/view/profile_screen/profile_screen_states.dart';

class EditProfileScreen extends StatefulWidget {
  Map detail;
  EditProfileScreen({super.key, required this.detail});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  final nameController = TextEditingController();

  final emailController = TextEditingController();

  final genderController = TextEditingController();

  final dobController = TextEditingController();

  @override
  void initState() {
    context
        .read<EditProfileBloc>()
        .add(EditProfileInitialEvent(detail: widget.detail));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.sizeOf(context).height;
    double width = MediaQuery.sizeOf(context).width;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Edit Profile',
          style: Theme.of(context)
              .textTheme
              .titleLarge!
              .copyWith(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
                height: height * 0.25,
                padding: EdgeInsets.symmetric(
                    horizontal: width * 0.055, vertical: height * 0.03),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      AppColors.blue.withOpacity(0.3),
                      AppColors.blue.withOpacity(0.5),
                      AppColors.blue.withOpacity(0.8)
                    ],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                ),
                child: BlocBuilder<EditProfileBloc, EditProfileScreenStates>(
                  // buildWhen: (previous, current) =>
                  //     previous.file != current.file,
                  builder: (context, state) {
                    switch (state.status) {
                      case Status.loading:
                        return const Center(child: CircularProgressIndicator());
                      case Status.failure:
                        return const Text('Some thing went wrong');
                      case Status.success:
                        return Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            InkWell(
                              onTap: () {
                                context
                                    .read<EditProfileBloc>()
                                    .add(EditProfileScreenCameraEvent());
                              },
                              child: state.fileImage == true
                                  ? CircleAvatar(
                                      radius: height * 0.09,
                                      backgroundColor: Colors.blue,
                                      backgroundImage:
                                          FileImage(File(state.file!)),
                                    )
                                  : CircleAvatar(
                                      radius: height * 0.09,
                                      backgroundColor: Colors.blue,
                                      backgroundImage:
                                          NetworkImage(state.image),
                                    ),
                            ),
                            SizedBox(
                              width: width * 0.05,
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  state.title,
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleLarge!
                                      .copyWith(fontWeight: FontWeight.bold),
                                ),
                                SizedBox(
                                  height: height * 0.008,
                                ),
                                Text(
                                  state.role,
                                  style: Theme.of(context).textTheme.bodyMedium,
                                ),
                              ],
                            )
                          ],
                        );
                    }
                  },
                )),
            SizedBox(
              height: height * 0.03,
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: width * 0.055, vertical: height * 0.03),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextWidget('User Name', context, width),
                  SizedBox(
                    height: height * 0.01,
                  ),
                  BlocBuilder<EditProfileBloc, EditProfileScreenStates>(
                    builder: (context, state) {
                      nameController.text = state.title;
                      return TextFieldWidget(
                          border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.circular(height * 0.01),
                              borderSide: BorderSide.none),
                          controller: nameController,
                          hintText: 'Mark Adam');
                    },
                  ),
                  SizedBox(
                    height: height * 0.02,
                  ),
                  TextWidget('Email', context, width),
                  SizedBox(
                    height: height * 0.01,
                  ),
                  BlocBuilder<EditProfileBloc, EditProfileScreenStates>(
                    builder: (context, state) {
                      emailController.text = state.email;
                      return TextFieldWidget(
                          border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.circular(height * 0.01),
                              borderSide: BorderSide.none),
                          controller: emailController,
                          hintText: 'abc123@email.com');
                    },
                  ),
                  SizedBox(
                    height: height * 0.02,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TextWidget('Gender', context, width),
                          SizedBox(
                            height: height * 0.01,
                          ),
                          SizedBox(
                            width: width * 0.42,
                            child: BlocBuilder<EditProfileBloc,
                                EditProfileScreenStates>(
                              builder: (context, state) {
                                genderController.text = state.gender;
                                return TextFieldWidget(
                                    border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(
                                            height * 0.01),
                                        borderSide: BorderSide.none),
                                    controller: genderController,
                                    hintText: 'Male');
                              },
                            ),
                          )
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TextWidget('Dob', context, width),
                          SizedBox(
                            height: height * 0.01,
                          ),
                          SizedBox(
                            width: width * 0.42,
                            child: BlocBuilder<EditProfileBloc,
                                EditProfileScreenStates>(
                              builder: (context, state) {
                                dobController.text = state.dob;
                                return TextFieldWidget(
                                    border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(
                                            height * 0.01),
                                        borderSide: BorderSide.none),
                                    controller: dobController,
                                    hintText: '15/05/2000');
                              },
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                  SizedBox(
                    height: height * 0.08,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      BigButtons(
                        text: 'Cancel',
                        onTap: () {
                          context.read<EditProfileBloc>().add(
                              EditProfileCancelButtonEvent(context: context));
                        },
                        color: AppColors.white,
                        textColor: AppColors.blue,
                      ),
                      BlocBuilder<EditProfileBloc, EditProfileScreenStates>(
                        builder: (context, state) {
                          return BigButtons(
                            text: 'Save',
                            onTap: () {
                              context.read<EditProfileBloc>().add(
                                  EditProfileSaveButtonEvent(
                                      title: nameController.text,
                                      email: emailController.text,
                                      gender: genderController.text,
                                      dob: dobController.text,
                                      fileImage: state.fileImage!,
                                      file: state.file.toString(),
                                      context: context));
                            },
                            color: AppColors.blue,
                          );
                        },
                      )
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

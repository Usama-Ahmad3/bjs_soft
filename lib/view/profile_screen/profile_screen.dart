import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled1/res/app_colors/app_colors.dart';
import 'package:untitled1/res/common_widgets/profile_screen_tile.dart';
import 'package:untitled1/res/common_widgets/text_field_widget.dart';
import 'package:untitled1/res/common_widgets/text_widget.dart';
import 'package:untitled1/view/profile_screen/profile_pic_widget.dart';
import 'package:untitled1/view/profile_screen/profile_screen_bloc.dart';
import 'package:untitled1/view/profile_screen/profile_screen_events.dart';
import 'package:untitled1/view/profile_screen/profile_screen_states.dart';

class ProfileScreen extends StatefulWidget {
  ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final emailController = TextEditingController();

  final genderController = TextEditingController();

  final dobController = TextEditingController();
  @override
  void initState() {
    context.read<ProfileScreenBloc>().add(ProfileScreenInitial());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.sizeOf(context).height;
    double width = MediaQuery.sizeOf(context).width;
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: Text(
          'Profile Screen',
          style: Theme.of(context)
              .textTheme
              .titleLarge!
              .copyWith(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: width * 0.055, vertical: height * 0.03),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              BlocBuilder<ProfileScreenBloc, ProfileScreenState>(
                buildWhen: (previous, current) =>
                    previous.email != current.email ||
                    previous.dob != current.dob ||
                    previous.title != current.title ||
                    previous.gender != current.gender ||
                    previous.fileImage != current.fileImage ||
                    previous.file != current.file ||
                    previous.image != current.image,
                builder: (context, state) {
                  switch (state.status) {
                    case Status.loading:
                      return const Center(child: CircularProgressIndicator());
                    case Status.failure:
                      return const Text('Some thing went wrong');
                    case Status.success:
                      return ProfilePicWidget(
                        title: state.title,
                        fileImage: state.fileImage,
                        file: state.file,
                        role: state.role,
                        image: state.image,
                        onTap: () {
                          context.read<ProfileScreenBloc>().add(
                              ProfileScreenEditButtonClick(
                                  image: state.image,
                                  role: state.role,
                                  title: state.title,
                                  email: state.email,
                                  dob: state.dob,
                                  file: state.file,
                                  fileImage: state.fileImage,
                                  gender: state.gender,
                                  context: context));
                        },
                      );
                  }
                },
              ),
              SizedBox(
                height: height * 0.04,
              ),
              TextWidget('Email', context, width),
              SizedBox(
                height: height * 0.01,
              ),
              BlocBuilder<ProfileScreenBloc, ProfileScreenState>(
                builder: (context, state) {
                  emailController.text = state.email;
                  return TextFieldWidget(
                    controller: emailController,
                    enable: false,
                    hintText: 'abc123@gmail.com',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(height * 0.01),
                        borderSide: BorderSide.none),
                  );
                },
              ),
              SizedBox(
                height: height * 0.03,
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
                          child: BlocBuilder<ProfileScreenBloc,
                              ProfileScreenState>(builder: (context, state) {
                            genderController.text = state.gender;
                            return TextFieldWidget(
                                enable: false,
                                border: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.circular(height * 0.01),
                                    borderSide: BorderSide.none),
                                controller: genderController,
                                hintText: 'Male');
                          }))
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
                          child: BlocBuilder<ProfileScreenBloc,
                              ProfileScreenState>(
                            builder: (context, state) {
                              dobController.text = state.dob;
                              return TextFieldWidget(
                                  enable: false,
                                  border: OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.circular(height * 0.01),
                                      borderSide: BorderSide.none),
                                  controller: dobController,
                                  hintText: '15/05/2000');
                            },
                          ))
                    ],
                  )
                ],
              ),
              SizedBox(
                height: height * 0.04,
              ),
              BlocBuilder<ProfileScreenBloc, ProfileScreenState>(
                buildWhen: (previous, current) =>
                    previous.accountSwitch != current.accountSwitch,
                builder: (context, state) {
                  return ProfileScreenTile(
                    title: 'Account',
                    subTitle: 'Public',
                    color: AppColors.grey,
                    switchValue: state.accountSwitch,
                    onChange: (value) {
                      context
                          .read<ProfileScreenBloc>()
                          .add(ProfileScreenAccountSwitchOnOff());
                    },
                  );
                },
              ),
              SizedBox(
                height: height * 0.03,
              ),
              BlocBuilder<ProfileScreenBloc, ProfileScreenState>(
                buildWhen: (previous, current) =>
                    previous.notificationSwitch != current.notificationSwitch,
                builder: (context, state) {
                  return ProfileScreenTile(
                    title: 'Notification',
                    subTitle: '',
                    color: AppColors.grey,
                    switchValue: state.notificationSwitch,
                    onChange: (value) {
                      context
                          .read<ProfileScreenBloc>()
                          .add(ProfileScreenNotificationSwitchOnOff());
                    },
                  );
                },
              ),
              SizedBox(
                height: height * 0.03,
              ),
              BlocBuilder<ProfileScreenBloc, ProfileScreenState>(
                buildWhen: (previous, current) =>
                    previous.themeSwitch != current.themeSwitch,
                builder: (context, state) {
                  return ProfileScreenTile(
                    title: 'Switch Theme',
                    subTitle: "Dark Mode",
                    color: AppColors.grey,
                    switchValue: state.themeSwitch,
                    onChange: (onChange) {
                      context
                          .read<ProfileScreenBloc>()
                          .add(ProfileScreenThemeSwitchOnOff());
                    },
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}

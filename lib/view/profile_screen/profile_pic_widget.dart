import 'dart:io';

import 'package:flutter/material.dart';
import 'package:untitled1/res/common_widgets/button_widget.dart';

class ProfilePicWidget extends StatelessWidget {
  String title;
  String role;
  bool isVisible;
  VoidCallback? onTap;
  String image;
  String file;
  bool fileImage;
  ProfilePicWidget(
      {super.key,
      required this.title,
      required this.role,
      this.onTap,
      this.isVisible = true,
      required this.fileImage,
      required this.file,
      required this.image});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.sizeOf(context).height;
    double width = MediaQuery.sizeOf(context).width;
    print(fileImage);
    print(file);
    print(image);
    return Row(
      children: [
        fileImage == true
            ? CircleAvatar(
                radius: height * 0.09,
                backgroundColor: Colors.blue,
                backgroundImage: FileImage(File(file)),
              )
            : CircleAvatar(
                radius: height * 0.09,
                backgroundColor: Colors.blue,
                backgroundImage: NetworkImage(image),
              ),
        SizedBox(
          width: width * 0.08,
        ),
        Column(
          children: [
            Text(
              title,
              style: Theme.of(context)
                  .textTheme
                  .titleLarge!
                  .copyWith(fontWeight: FontWeight.bold),
            ),
            Text(
              role,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            SizedBox(
              height: height * 0.02,
            ),
            isVisible
                ? ButtonWidget(text: 'Edit Profile', onTap: onTap ?? () {})
                : const SizedBox.shrink(),
          ],
        )
      ],
    );
  }
}

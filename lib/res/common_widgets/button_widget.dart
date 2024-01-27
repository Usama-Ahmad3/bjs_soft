import 'package:flutter/material.dart';

import '../app_colors/app_colors.dart';

class ButtonWidget extends StatelessWidget {
  final VoidCallback onTap;
  final String text;
  final bool loading;
  const ButtonWidget(
      {super.key,
      required this.text,
      required this.onTap,
      this.loading = false});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return InkWell(
      onTap: onTap,
      child: Container(
        height: height * 0.045,
        width: width * 0.3,
        decoration: BoxDecoration(
            color: AppColors.blue,
            borderRadius: BorderRadius.circular(height * 0.01)),
        child: Center(
            child: loading
                ? const CircularProgressIndicator(
                    color: AppColors.white,
                  )
                : Text(
                    text,
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium!
                        .copyWith(color: AppColors.white),
                  )),
      ),
    );
  }
}

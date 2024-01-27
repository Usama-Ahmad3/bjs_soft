import 'package:flutter/material.dart';
import 'package:untitled1/res/app_colors/app_colors.dart';

class BigButtons extends StatelessWidget {
  final VoidCallback onTap;
  final String text;
  final bool loading;
  final Color color;
  final Color textColor;
  const BigButtons(
      {super.key,
      required this.text,
      this.textColor = AppColors.white,
      required this.color,
      required this.onTap,
      this.loading = false});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return InkWell(
      onTap: onTap,
      child: Container(
        height: height * 0.058,
        width: width * 0.42,
        decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(height * 0.01),
            border: Border.all(color: AppColors.blue)),
        child: Center(
            child: loading
                ? const CircularProgressIndicator(
                    color: AppColors.white,
                  )
                : Text(
                    text,
                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                        color: textColor, fontWeight: FontWeight.bold),
                  )),
      ),
    );
  }
}

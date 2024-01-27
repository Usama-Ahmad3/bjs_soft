import 'package:flutter/material.dart';
import 'package:untitled1/res/app_colors/app_colors.dart';

class ProfileScreenTile extends StatelessWidget {
  String title;
  String subTitle;
  Color color;
  bool switchValue;
  FormFieldValidator onChange;
  ProfileScreenTile(
      {super.key,
      required this.title,
      required this.onChange,
      required this.switchValue,
      required this.subTitle,
      this.color = AppColors.black});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.sizeOf(context).height;
    double width = MediaQuery.sizeOf(context).width;
    return Container(
      height: height * 0.06,
      width: width,
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(height * 0.01),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: width * 0.03),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium!
                  .copyWith(color: color),
            ),
            Row(
              children: [
                Text(subTitle ?? '',
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium!
                        .copyWith(color: AppColors.grey)),
                SizedBox(
                  width: width * 0.03,
                ),
                Switch(
                    activeColor: AppColors.white,
                    focusColor: AppColors.white,
                    activeTrackColor: AppColors.green,
                    splashRadius: 1,
                    value: switchValue,
                    onChanged: onChange)
              ],
            )
          ],
        ),
      ),
    );
  }
}

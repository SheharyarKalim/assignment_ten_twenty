import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../config/colors/app_colors.dart';

class GenericButton extends StatelessWidget {
  final Function() onPressed;
  final Widget title;
  final Color? color;
  final double? borderRadius;
  final Widget? leading, trailing;
  final double? width, height;
  final EdgeInsets? margin;
  final Color? borderColor;

  const GenericButton(
      {Key? key,
      required this.onPressed,
      required this.title,
      this.width,
      this.height,
      this.color,
      this.margin,
      this.borderRadius,
      this.borderColor,
      this.leading,
      this.trailing})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width ?? 243.w,
      height: height ?? 50.h,
      child: MaterialButton(
          onPressed: onPressed,
          elevation: 5,
          color: color ?? Colors.transparent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius ?? 10.h),
            side: color == null ? BorderSide(
              width: 2,
              color: AppColors.instance.liteBlue
            ) : BorderSide(
              color: color!
            )
          ),
          child: Stack(
            fit: StackFit.expand,
            children: [
              if (leading != null || trailing != null)
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    if (leading != null)
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 35),
                        child: leading!,
                      ),
                    if (trailing != null)
                      Expanded(
                        child: Align(
                          alignment: Alignment.centerRight,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: trailing!,
                          ),
                        ),
                      ),
                  ],
                ),
              Center(
                child: title,
              ),
            ],
          )),
    );
  }
}

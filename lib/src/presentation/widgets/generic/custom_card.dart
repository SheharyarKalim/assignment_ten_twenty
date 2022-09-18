import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../config/colors/app_colors.dart';
import '../../../config/styles/app_text_styles.dart';

class CustomCard extends StatelessWidget {
  final double? height, width;
  final String? imageUrl, movieName;

  const CustomCard(
      {Key? key, this.height, this.width, this.imageUrl, this.movieName})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.h),
      ),
      child: SizedBox(
        height: height ?? 180.h,
        width: width ?? 335.w,
        child: Stack(
          fit: StackFit.expand,
          alignment: Alignment.bottomLeft,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10.h),
              child: CachedNetworkImage(
                imageUrl: imageUrl!,
                fit: BoxFit.cover,
                progressIndicatorBuilder: (context, url, downloadProgress) =>
                    Center(
                  child: CircularProgressIndicator(
                    value: downloadProgress.progress,
                    color: AppColors.instance.black,
                  ),
                ),
                errorWidget: (context, url, error) => const Icon(Icons.error),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                  color: AppColors.instance.black.withOpacity(0.25),
                  borderRadius: BorderRadius.circular(10.h)
              ),
            ),
            Positioned(
              bottom: 20.h,
              left: 20.w,
              right: 20.w,
              child: Align(
                alignment: Alignment.topLeft,
                child: Text(
                  movieName ?? "loading...",
                  style: AppTextStyles.instance.bold16.copyWith(color: AppColors.instance.white), maxLines: 2, overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

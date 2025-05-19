import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../utils/elegant_notifications/resources/colors.dart' as AppColors;

class ImageViewSquare extends StatelessWidget {
  final String? image;
  double? progressSize = 32.0;
  String? placeholder;
  double? height;
  double? width;
  BoxFit? fit;

  ImageViewSquare(
      {Key? key,
        required this.image,
        this.height,
        this.progressSize,
        this.fit,
        this.placeholder, this. width})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height ?? Get.height,
      width: width??Get.width,
      child: (image != null && image?.contains("http") == true)
          ? CachedNetworkImage(
        imageUrl: image!,
        imageBuilder: (context, imageProvider) {
          return Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: imageProvider,
                fit: fit??BoxFit.cover,
              ),
            ),
          );
        },
        placeholder: (context, url) {
          return Center(
            child: SizedBox(
              width: progressSize,
              height: progressSize,
              child: const CircularProgressIndicator(
                valueColor:
                AlwaysStoppedAnimation<Color>(AppColors.greyColor),
                strokeWidth: 3.5,
              ),
            ),
          );
        },
        errorWidget: (context, url, error) {
          return Image.asset(placeholder ?? "assets/no_pic.png",
              fit: BoxFit.cover);
        },
      )
          : Container(
        height: 43,
        width: 43,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(width: 1, color: Colors.white),
          image: const DecorationImage(
              image: AssetImage("assets/no_pic.png"),
              fit: BoxFit.cover),
        ),
      ),
    );
  }
}

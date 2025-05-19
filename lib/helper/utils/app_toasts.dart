import 'package:flutter/material.dart';
import 'package:interview_task/generated/assets.dart';
import 'package:interview_task/helper/app_helpers/app_text.dart';
import 'package:interview_task/helper/colors/app_colors.dart';
import 'package:interview_task/helper/utils/elegant_notifications/elegant_notification.dart';
import 'package:interview_task/helper/utils/elegant_notifications/resources/arrays.dart';
import 'package:interview_task/helper/utils/elegant_notifications/resources/stacked_options.dart';

enum MessageType { success, error }

class AppToasts {
  static callToast({required MessageType type, required BuildContext context, required String message}) {
    if (type == MessageType.success) {
      ElegantNotification(
        width: MediaQuery.of(context).size.width,
        toastDuration: const Duration(seconds: 2),
        position: Alignment.topRight,
        animation: AnimationType.fromRight,
        stackedOptions: StackedOptions(key: "top", type: StackedType.below, itemOffset: const Offset(0, 5)),
        description: AppText(
          text: message,
          textSize: 15.0,
          color: Colors.black,
          fontWeight: FontWeight.w600,
        ),
        progressIndicatorColor: AppColors.appColor.withValues(alpha: 0.6),
        showProgressIndicator: true,
        autoDismiss: true,
        onDismiss: () {},
      ).show(context);
      return;
    } else {
      ElegantNotification(
        width: MediaQuery.of(context).size.width,
        position: Alignment.topRight,
        animation: AnimationType.fromRight,
        toastDuration: const Duration(seconds: 2),
        stackedOptions: StackedOptions(key: "top", type: StackedType.below, itemOffset: const Offset(0, 10)),
        description: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              Assets.assetsIcInfo,
              height: 15,
              width: 15,
              color: AppColors.red,
            ),
            const SizedBox(
              width: 10,
            ),
            Flexible(
              child: AppText(
                text: message,
                textSize: 15.0,
                color: AppColors.red,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
        progressIndicatorColor: AppColors.red.withValues(alpha: 0.6),
        showProgressIndicator: true,
        shadow: [
          BoxShadow(
            color: Colors.grey.withValues(alpha: 0.2),
            blurRadius: 5,
            spreadRadius: 0.02,
            offset: const Offset(0.1, 0.1),
          ),
          BoxShadow(
            color: AppColors.red.withValues(alpha: 0.5),
            blurRadius: 5,
            spreadRadius: 0.2,
            offset: const Offset(0.1, 0.1),
          ),
        ],
        autoDismiss: true,
        onDismiss: () {},
      ).show(context);
    }
  }
}

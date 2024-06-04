import '../../../core/l10n/extensions/app_localizations_context.dart';
import '../../../core/constants/App_content.dart';
import '../../../core/constants/Colors.dart';
import '../../../core/utils/fontfameli_model.dart';
import 'package:flutter/material.dart';

class HelpFooterWidget extends StatelessWidget {
  const HelpFooterWidget({
    super.key,
    required this.textColor,
  });

  final Color textColor;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 35.0),
      child: Column(
        children: [
          Image.asset(
            Appcontent.phone,
            width: 40,
            height: 40,
          ),
          const SizedBox(height: 5),
          Text(
            context.localization.helpCenterFooterTitle,
            style: TextStyle(
              fontFamily: FontFamily.dMSans,
              fontWeight: FontWeight.w600,
              color: textColor,
              fontSize: 16,
            ),
          ),
          const SizedBox(height: 5),
          Text(
            context.localization.helpCenterFooterBody,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontFamily: FontFamily.dMSans,
              fontWeight: FontWeight.w400,
              color: textColor,
              fontSize: 16,
            ),
          ),
          const SizedBox(height: 10),
          GestureDetector(
            onTap: () {},
            child: Text(
              context.localization.helpCenterFooterContactButton,
              style: TextStyle(
                fontFamily: FontFamily.dMSans,
                fontWeight: FontWeight.w500,
                color: onbordingBlue,
                fontSize: 16,
              ),
            ),
          )
        ],
      ),
    );
  }
}

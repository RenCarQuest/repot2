import '../../../core/l10n/extensions/app_localizations_context.dart';
import '../../../domain/models/faq/faq_model.dart';
import '../../../presentation/features/faq/help_footer_widget.dart';
import '../../../core/constants/App_content.dart';
import '../../../core/utils/Dark_lightmode.dart';
import '../../../core/utils/fontfameli_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

class FAQAnswerScreen extends StatefulWidget {
  const FAQAnswerScreen({
    required this.answer,
    super.key,
  });

  final FaqModel answer;

  @override
  State<StatefulWidget> createState() => _FAQAnswerScreenState();
}

class _FAQAnswerScreenState extends State<FAQAnswerScreen> {
  late ColorNotifire notifire;

  @override
  Widget build(BuildContext context) {
    notifire = Provider.of<ColorNotifire>(context, listen: true);
    return Scaffold(
      backgroundColor: notifire.getbgcolor,
      appBar: AppBar(
        backgroundColor: notifire.getbgcolor,
        leading: InkWell(
          onTap: () {
            Get.back();
          },
          child: Container(
            height: 40,
            width: 40,
            padding: const EdgeInsets.all(12),
            child: Image.asset(
              Appcontent.back,
              color: notifire.getwhiteblackcolor,
            ),
          ),
        ),
        centerTitle: true,
        elevation: 0,
        title: Text(
          context.localization.helpCenterScreenTitle,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontFamily: FontFamily.gilroyBold,
            color: notifire.getwhiteblackcolor,
            fontSize: 16,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Text(
                  widget.answer.title,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: FontFamily.gilroyBold,
                    color: notifire.getwhiteblackcolor,
                    fontSize: 16,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Text(
                  widget.answer.description,
                  style: TextStyle(
                    fontFamily: FontFamily.gilroyMedium,
                    color: notifire.getwhiteblackcolor,
                    fontSize: 16,
                  ),
                ),
              ),
              const SizedBox(height: 30),
              HelpFooterWidget(textColor: notifire.getwhiteblackcolor),
            ],
          ),
        ),
      ),
    );
  }
}

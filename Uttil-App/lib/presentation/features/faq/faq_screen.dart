import '../../../core/l10n/extensions/app_localizations_context.dart';
import '../../../presentation/features/faq/faq_anwer_screen.dart';
import '../../../presentation/features/faq/faq_cubit.dart';
import '../../../presentation/features/faq/help_footer_widget.dart';
import '../../../core/constants/App_content.dart';
import '../../../core/constants/Colors.dart';
import '../../../core/utils/Dark_lightmode.dart';
import '../../../core/utils/fontfameli_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

class FaqScreen extends StatefulWidget {
  const FaqScreen({super.key});

  @override
  State<FaqScreen> createState() => _FaqScreenState();
}

class _FaqScreenState extends State<FaqScreen> {

  late ColorNotifire notifire;

  @override
  void initState() {
    super.initState();
    context.read<FaqCubit>().getFaqs(context);
  }

  @override
  Widget build(BuildContext context) {
    notifire = Provider.of<ColorNotifire>(context, listen: true);

    return Scaffold(
      backgroundColor: notifire.getbgcolor,
      appBar: AppBar(
        backgroundColor: onbordingBlue,
        elevation: 0,
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
              color: WhiteColor,
            ),
          ),
        ),
        centerTitle: true,
        title: Text(
          context.localization.helpCenterTitle,
          style: const TextStyle(
            fontFamily: FontFamily.nebulasSemiBold,
            fontSize: 18,
            color: Colors.white,
          ),
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.all(10),
            child: CircleAvatar(
              backgroundImage: AssetImage('assets/images/05.png'),
            ),
          ),
          SizedBox(width: 10),
        ],
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: Get.size.width,
                color: onbordingBlue,
                child: Padding(
                  padding: const EdgeInsets.only(
                    top: 35,
                    bottom: 15,
                    left: 15,
                    right: 15,
                  ),
                  child: Column(
                    children: [
                      Text(
                        context.localization.helpCenterHeaderMessage,
                        style: const TextStyle(
                          fontFamily: FontFamily.nebulasSemiBold,
                          fontSize: 32,
                          color: Colors.white,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 15),
                      Container(
                        decoration: BoxDecoration(
                          color: const Color(0xff534CFF),
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: TextField(
                          onChanged: context.read<FaqCubit>().onQueryChanged,
                          decoration: InputDecoration(
                            contentPadding: const EdgeInsets.all(10),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(16)),
                            focusedBorder: const OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Color(0xff534CFF))),
                            enabledBorder: const OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Color(0xff534CFF))),
                            hintText: context.localization.searchBarHint,
                            hintStyle: const TextStyle(
                                fontFamily: FontFamily.dMSans,
                                fontWeight: FontWeight.w500,
                                fontSize: 16,
                                color: Color(0xffC6C3FF)),
                            suffixIcon: Padding(
                              padding: const EdgeInsets.all(10),
                              child: Image.asset(Appcontent.search,
                                  color: Colors.white, height: 24, width: 24),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 15),
              Padding(
                padding: const EdgeInsets.only(left: 20, top: 10),
                child: Text(
                  context.localization.helpCenterSectionTitle,
                  style: TextStyle(
                    fontFamily: FontFamily.nebulasMedium,
                    color: greyScale,
                    fontSize: 15,
                  ),
                ),
              ),
              BlocBuilder<FaqCubit, FaqState>(builder: (context, state) {
                if (state.errorMessage != null) {
                  return Text(state.errorMessage!);
                } else {
                  return ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: state.faqs.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          Get.to(FAQAnswerScreen(answer: state.faqs[index]));
                        },
                        child: _faq(question: state.faqs[index].title),
                      );
                    },
                  );
                }
              }),
              Center(
                child: HelpFooterWidget(textColor: notifire.getwhiteblackcolor),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _faq({required String question}) {
    return Container(
      width: Get.size.width,
      margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: notifire.getblackwhitecolor,
      ),
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Row(
          children: [
            Image.asset(
              Appcontent.question,
              height: 16,
              width: 16,
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Text(
                question,
                style: TextStyle(
                  fontFamily: FontFamily.dMSans,
                  fontWeight: FontWeight.w700,
                  fontSize: 16,
                  color: notifire.getwhiteblackcolor,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import '../../../core/constants/App_content.dart';
import '../../../core/constants/Colors.dart';
import '../../../core/validators/validator.dart';
import '../../../core/l10n/extensions/app_localizations_context.dart';
import '../../../core/utils/Dark_lightmode.dart';
import '../../../core/helpar/routes_helper.dart';
import '../../../core/utils/fontfameli_model.dart';
import '../screen/login_flow/login_screen.dart';
import '../../widgets/custom_widget.dart';
import '../../widgets/alert_message.dart';
import '../../controller/signup/signup_controller.dart';
import 'signup_cubit.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  SignUpController signUpController = Get.find();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  late ColorNotifire notifire;

  getDarkModePreviousState() async {
    final prefs = await SharedPreferences.getInstance();
    bool? previusstate = prefs.getBool("setIsDark");
    if (previusstate == null) {
      notifire.setIsDark = false;
    } else {
      notifire.setIsDark = previusstate;
    }
  }

  _register() {
    if (_formKey.currentState?.validate() ?? false) {
      context.read<SignupCubit>().registerUser(
            signUpController.name.text.trim(),
            signUpController.email.text.trim(),
            signUpController.password.text.trim(),
          );
    } else {
      AlertMessage.showErrorMessage(context.localization.onboardingMissingInfoMsg, null);
    }
  }

  _successSignup() {
    Get.toNamed(Routes.otpScreen, arguments: {
      "route": "signUpScreen",
    });
  }

  _navigateToLogin() {
    Get.to(() => const LoginScreen());
  }

  @override
  void initState() {
    getDarkModePreviousState();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    notifire = Provider.of<ColorNotifire>(context, listen: true);

    return Scaffold(
      backgroundColor: notifire.getbgcolor,
      body: BlocBuilder<SignupCubit, SignupState>(builder: (context, state) {
        if (state.status == SignupStatus.success) {
          AlertMessage.showSuccessMessage(context.localization.signUpSuccessMessage, _successSignup);
        }
        return SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 10),
                  InkWell(
                    onTap: () {
                      Get.back();
                    },
                    child: Container(
                      height: 40,
                      width: 40,
                      alignment: Alignment.center,
                      padding: const EdgeInsets.all(6),
                      child: Image.asset(
                        Appcontent.close,
                        color: notifire.getwhiteblackcolor,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: Get.size.height * 0.03,
                  ),
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            context.localization.signUpScreenTitle,
                            style: TextStyle(
                              fontFamily: FontFamily.gilroyBold,
                              color: notifire.getwhiteblackcolor,
                              fontSize: 28,
                            ),
                          ),
                          SizedBox(
                            height: Get.size.height * 0.04,
                          ),
                          textFormFild(
                            notifire,
                            controller: signUpController.name,
                            textInputAction: TextInputAction.next,
                            prefixIcon: Padding(
                              padding: const EdgeInsets.all(12),
                              child: Image.asset(
                                Appcontent.user,
                                height: 25,
                                width: 25,
                                color: greyColor,
                              ),
                            ),
                            labelText: context.localization.signUpNameHint,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return context.localization.signUpNameError;
                              }
                              return null;
                            },
                            keyboardType: TextInputType.name,
                          ),
                          const SizedBox(height: 15),
                          textFormFild(
                            notifire,
                            controller: signUpController.email,
                            textInputAction: TextInputAction.next,
                            prefixIcon: Padding(
                              padding: const EdgeInsets.all(12),
                              child: Image.asset(
                                Appcontent.mail,
                                height: 25,
                                width: 25,
                                color: greyColor,
                              ),
                            ),
                            labelText: context.localization.signUpEmailHint,
                            validator: (p0) =>
                                Validator.validateEmail(p0, context),
                            keyboardType: TextInputType.emailAddress,
                          ),
                          const SizedBox(height: 15),
                          GetBuilder<SignUpController>(builder: (context) {
                            return textFormFild(
                              notifire,
                              controller: signUpController.password,
                              obscureText: signUpController.showPassword,
                              suffixIcon: InkWell(
                                onTap: () {
                                  signUpController.showOfPassword();
                                },
                                child: Padding(
                                  padding: const EdgeInsets.all(10),
                                  child: Image.asset(
                                    !signUpController.showPassword
                                        ? Appcontent.eye
                                        : Appcontent.eyeOff,
                                    height: 25,
                                    width: 25,
                                    color: greyColor,
                                  ),
                                ),
                              ),
                              prefixIcon: Padding(
                                padding: const EdgeInsets.all(10),
                                child: Image.asset(
                                  Appcontent.lock,
                                  height: 25,
                                  width: 25,
                                  color: greyColor,
                                ),
                              ),
                              labelText:
                                  this.context.localization.signUpPasswordHint,
                              validator: (p0) =>
                                  Validator.validatePassword(p0, this.context),
                              onFieldSubmitted: (value) {
                                _register();
                              },
                              keyboardType: TextInputType.visiblePassword,
                            );
                          }),
                          const SizedBox(height: 10),
                          Row(
                            children: [
                              const SizedBox(width: 10),
                              Text(
                                context.localization.signUpTermsPart1,
                                style: TextStyle(
                                  fontFamily: FontFamily.gilroyMedium,
                                  color: notifire.getwhiteblackcolor,
                                  fontSize: 15,
                                ),
                              ),
                              const SizedBox(width: 5),
                              Text(
                                context.localization.signUpTermsPart2,
                                style: TextStyle(
                                  fontFamily: FontFamily.gilroyBold,
                                  color: onbordingBlue,
                                  fontSize: 15,
                                ),
                              )
                            ],
                          ),
                          Row(
                            children: [
                              const SizedBox(width: 10),
                              Text(
                                context.localization.signUpTermsPart3,
                                style: TextStyle(
                                  fontFamily: FontFamily.gilroyBold,
                                  color: onbordingBlue,
                                  fontSize: 15,
                                ),
                              ),
                              const SizedBox(width: 5),
                              Text(
                                context.localization.signUpTermsPart4,
                                style: TextStyle(
                                  fontFamily: FontFamily.gilroyMedium,
                                  color: notifire.getwhiteblackcolor,
                                  fontSize: 15,
                                ),
                              ),
                              const SizedBox(width: 5),
                              Text(
                                context.localization.signUpTermsPart5,
                                style: TextStyle(
                                  fontFamily: FontFamily.gilroyBold,
                                  color: onbordingBlue,
                                  fontSize: 15,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: Get.size.height * 0.03,
                          ),
                          GestButton(
                            height: 50,
                            Width: Get.size.width,
                            margin: const EdgeInsets.symmetric(
                                horizontal: 15, vertical: 5),
                            buttoncolor: onbordingBlue,
                            buttontext: context.localization.signUpScreenTitle,
                            style: TextStyle(
                              color: WhiteColor,
                              fontFamily: FontFamily.gilroyBold,
                              fontSize: 15,
                            ),
                            onclick: _register,
                          ),
                          const SizedBox(height: 10),
                          imageButton(
                            height: 50,
                            width: Get.size.width,
                            margin: const EdgeInsets.symmetric(
                                vertical: 5, horizontal: 15),
                            image: Appcontent.google,
                            buttonText:
                                context.localization.onboardingGoogleButton,
                            style: TextStyle(
                              fontFamily: FontFamily.gilroyMedium,
                              color: notifire.getwhiteblackcolor,
                              fontSize: 15,
                            ),
                            border: Border.all(color: notifire.getborderColor),
                            color: notifire.getblackwhitecolor,
                            onTap: () {},
                          ),
                          const SizedBox(height: 10),
                          imageButton(
                            height: 50,
                            width: Get.size.width,
                            margin: const EdgeInsets.symmetric(
                                vertical: 5, horizontal: 15),
                            image: notifire.isDark
                                ? Appcontent.apple
                                : Appcontent.darkapple,
                            buttonText:
                                context.localization.onboardingAppleButton,
                            style: TextStyle(
                              fontFamily: FontFamily.gilroyMedium,
                              color: notifire.getwhiteblackcolor,
                              fontSize: 15,
                            ),
                            border: Border.all(color: notifire.getborderColor),
                            color: notifire.getblackwhitecolor,
                            onTap: () {},
                          ),
                          SizedBox(
                            height: Get.size.height * 0.10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const SizedBox(width: 10),
                              Text(
                                context.localization.signUpHaveAccountMsg,
                                style: TextStyle(
                                  fontFamily: FontFamily.gilroyMedium,
                                  color: notifire.getwhiteblackcolor,
                                  fontSize: 15,
                                ),
                              ),
                              const SizedBox(width: 5),
                              InkWell(
                                onTap: _navigateToLogin,
                                child: Text(
                                  context.localization.signInButton,
                                  style: TextStyle(
                                    fontFamily: FontFamily.gilroyBold,
                                    color: onbordingBlue,
                                    fontSize: 15,
                                  ),
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      }),
    );
  }
}

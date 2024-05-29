import '../../../core/constants/App_content.dart';
import '../../../core/constants/Colors.dart';
import '../../../core/l10n/extensions/app_localizations_context.dart';
import '../../../core/utils/Dark_lightmode.dart';
import '../../../core/utils/fontfameli_model.dart';
import '../../../core/validators/validator.dart';
import '../../controller/login/login_controller.dart';
import '../../../presentation/features/login/login_cubit.dart';
import '../bottom_navigation_bar/bottombar_screen.dart';
import '../../../presentation/features/screen/login_flow/resetpassword_screen.dart';
import '../../widgets/alert_message.dart';
import '../../widgets/custom_widget.dart';
import '../signup/signup_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  LoginController loginController = Get.find();
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

  _login() {
    if (_formKey.currentState?.validate() ?? false) {
      context.read<LoginCubit>().loginUser(
            loginController.email.text,
            loginController.password.text,
          );
    } else {
      AlertMessage.showErrorMessage(
          context.localization.onboardingMissingInfoMsg, null);
    }
  }

  _navigateSuccessLogin() {
    Get.to(() => const BottomBarScreen());
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
      body: BlocBuilder<LoginCubit, LoginState>(builder: (context, state) {
         switch (state.status) {
          case LoginStatus.success:
            AlertMessage.showSuccessMessage(context.localization.loginSuccessMessage, null);
            WidgetsBinding.instance.addPostFrameCallback((_) => _navigateSuccessLogin());
            break;
          case LoginStatus.failure:
            if (state.errorMessage != null) {
              AlertMessage.showErrorMessage(state.errorMessage!, null);
            }
            break;
          default:
            break;
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
                  SizedBox(height: Get.size.height * 0.03),
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            context.localization.loginScreenTitle,
                            style: TextStyle(
                              fontFamily: FontFamily.gilroyBold,
                              color: notifire.getwhiteblackcolor,
                              fontSize: 28,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            context.localization.loginSubtitle,
                            style: TextStyle(
                              fontFamily: FontFamily.gilroyMedium,
                              fontSize: 15,
                              color: greyScale,
                            ),
                          ),
                          SizedBox(height: Get.size.height * 0.1),
                          textFormFild(
                            notifire,
                            controller: loginController.email,
                            textInputAction: TextInputAction.next,
                            keyboardType: TextInputType.emailAddress,
                            prefixIcon: Padding(
                              padding: const EdgeInsets.all(12),
                              child: Image.asset(
                                Appcontent.mail,
                                height: 25,
                                width: 25,
                                color: greyColor,
                              ),
                            ),
                            labelText: context.localization.onboardingEmailHint,
                            validator: (p0) =>
                                Validator.validateEmail(p0, context),
                          ),
                          const SizedBox(height: 15),
                          GetBuilder<LoginController>(builder: (context) {
                            return textFormFild(
                              notifire,
                              controller: loginController.password,
                              obscureText: loginController.showPassword,
                              textInputAction: TextInputAction.done,
                              onFieldSubmitted: (_) {
                                _login();
                              },
                              suffixIcon: InkWell(
                                onTap: () {
                                  loginController.showOfPassword();
                                },
                                child: Padding(
                                  padding: const EdgeInsets.all(10),
                                  child: Image.asset(
                                    !loginController.showPassword
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
                              labelText: this
                                  .context
                                  .localization
                                  .onboardingPasswordHint,
                            );
                          }),
                          const SizedBox(height: 10),
                          InkWell(
                            onTap: () {
                              Get.to(() => ResetPasswordScreen());
                            },
                            child: Row(
                              children: [
                                const SizedBox(width: 10),
                                Text(
                                  context.localization.forgotPasswordMsg,
                                  style: TextStyle(
                                    fontFamily: FontFamily.gilroyMedium,
                                    color: notifire.getwhiteblackcolor,
                                    fontSize: 15,
                                  ),
                                ),
                                const SizedBox(width: 5),
                                Text(
                                  context.localization.forgotPasswordAction,
                                  style: TextStyle(
                                    fontFamily: FontFamily.gilroyBold,
                                    color: onbordingBlue,
                                    fontSize: 15,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: Get.size.height * 0.03),
                          GestButton(
                            height: 50,
                            Width: Get.size.width,
                            margin: const EdgeInsets.symmetric(
                                horizontal: 15, vertical: 5),
                            buttoncolor: onbordingBlue,
                            buttontext: context.localization.loginTitle,
                            style: TextStyle(
                              color: WhiteColor,
                              fontFamily: FontFamily.gilroyBold,
                              fontSize: 15,
                            ),
                            onclick: _login,
                          ),
                          SizedBox(height: Get.size.height * 0.1),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const SizedBox(width: 10),
                              Text(
                                context.localization.loginSigninInvitationMsg,
                                style: TextStyle(
                                  fontFamily: FontFamily.gilroyMedium,
                                  color: notifire.getwhiteblackcolor,
                                  fontSize: 15,
                                ),
                              ),
                              const SizedBox(width: 5),
                              InkWell(
                                onTap: () {
                                  Get.to(() => const SignUpScreen());
                                },
                                child: Text(
                                  context.localization.signUpTitle,
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

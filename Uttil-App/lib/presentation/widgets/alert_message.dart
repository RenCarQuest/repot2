import '../../core/l10n/extensions/app_localizations_context.dart';
import '../../core/constants/Colors.dart';
import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';

class AlertMessage {
  static CancelFunc? loadingCancelFunc;

  static void _show(String message, {required bool error, void Function()? onClose}) {
    BotToast.showCustomNotification(
      toastBuilder: (context) => _CustomMessage(message: message, error: error),
      duration: const Duration(seconds: 4),
      align: const Alignment(0, 0.99),
      onClose: onClose
    );
  }

  static void showSuccessMessage(String message, void Function()? onClose) {
    _show(message, error: false, onClose: onClose);
  }

  static void showErrorMessage(String message, void Function()? onClose) {
    _show(message, error: true, onClose: onClose);
  }

  static void showLoading({String message = 'loading...'}) {
    loadingCancelFunc ??= BotToast.showCustomLoading(
        backgroundColor: Colors.black.withOpacity(.3),
        toastBuilder: (context) => _LoaderOverlay(label: message));
  }

  static void hideLoading() {
    if (loadingCancelFunc != null) {
      loadingCancelFunc!();
      loadingCancelFunc = null;
    }
  }
}

class _LoaderOverlay extends StatelessWidget {
  final String label;

  const _LoaderOverlay({this.label = "Please wait..."});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 300,
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(10)),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              context.localization.generalWaitTitle,
              style: TextStyle(
                  fontSize: 16, fontWeight: FontWeight.w700, color: greycolor),
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                SizedBox(
                    width: 30,
                    height: 30,
                    child: CircularProgressIndicator(
                      strokeWidth: 2,
                      backgroundColor: BlackColor,
                    )),
                const SizedBox(width: 16),
                Text(
                  label,
                  style: TextStyle(fontSize: 12, color: BlackColor),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _CustomMessage extends StatelessWidget {
  final bool error;
  final String message;

  const _CustomMessage({
    required this.message,
    this.error = true,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: error ? Colors.redAccent : Colors.green,
          borderRadius: BorderRadius.circular(10)),
      width: double.infinity,
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(10),
      child: Row(
        children: [
          Icon(error ? Icons.info : Icons.error),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              message,
              maxLines: 5,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}

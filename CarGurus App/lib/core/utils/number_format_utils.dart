import 'package:intl/intl.dart';

abstract class NumberFormatUtils {
  NumberFormatUtils._();

  static String formatPrice(final num price) {
    return NumberFormat.currency(locale: "en_US", symbol: "\$").format(price);
  }
}

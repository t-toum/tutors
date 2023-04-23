import 'package:easy_localization/easy_localization.dart';

extension DatetimeExtension on DateTime? {
  String? shortDate() {
    final val = this;
    if (val != null) {
      final format = DateFormat("dd-MM-yyyy");
      return format.format(val);
    } else {
      return "";
    }
  }
}

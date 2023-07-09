import 'package:easy_localization/easy_localization.dart';
import 'package:tutors/generated/locale_keys.g.dart';

extension BoolExtension on bool {
  String get getStatus => this ? LocaleKeys.kOpen.tr(): LocaleKeys.kClosed.tr();
}

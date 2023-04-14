// import 'package:injectable/injectable.dart';
// import 'package:tutors/core/services/shared_preference_service.dart';

// abstract class AppLocalDatasoure {
//   String? getAuthorized({required String key});
// }

// @LazySingleton(as: AppLocalDatasoure)
// class AppLocalDatasoureImpl implements AppLocalDatasoure {
//   final SharedPreferenceService _preferenceService;

//   AppLocalDatasoureImpl(this._preferenceService);
//   @override
//   String? getAuthorized({required String key}) {
//     return _preferenceService.getData<String>(key: key);
//   }
// }

import 'package:injectable/injectable.dart';
import 'package:tutors/core/constants/shared_pref_key.dart';

import '../../../../core/services/shared_preference_service.dart';

abstract class SettingLocalDatasource {
  String? getLanguage();
  Future<bool> setLanguage({String? code});
}

@LazySingleton(as: SettingLocalDatasource)
class SettingLocalDatasourceImpl implements SettingLocalDatasource {
  final SharedPreferenceService _preferenceService;

  SettingLocalDatasourceImpl(this._preferenceService);
  @override
  String? getLanguage() {
    String? code =  _preferenceService.getData<String>(key: SharedPrefKey.language);
    return code;
  }

  @override
  Future<bool> setLanguage({String? code}) async {
    final data = await _preferenceService.setData<String>(
      key: SharedPrefKey.language,
      data: code??'en',
    );
    return data;
  }
}

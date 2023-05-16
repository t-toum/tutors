import 'package:injectable/injectable.dart';
import 'package:tutors/core/usecases/no_params.dart';

import '../../../../core/usecases/usecase_sync.dart';
import '../repositories/setting_repository.dart';

@lazySingleton
class GetLanguageUsecase implements SynchronousUseCase<String?, NoParams> {
  final SettingRepository _repository;

  GetLanguageUsecase(this._repository);
  @override
  String? call(NoParams params) {
    return _repository.getLanguage();
  }
}

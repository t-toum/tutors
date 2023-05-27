import 'package:injectable/injectable.dart';

import '../../../../core/constants/firebase_collection.dart';
import '../../../../core/models/course.dart';
import '../../../../core/services/cloud_firestore_service.dart';

abstract class CourseRemoteDatasource {
  Future<void> addCourse({required Course data});
}

@LazySingleton(as: CourseRemoteDatasource)
class CourseRemoteDatasourceImpl implements CourseRemoteDatasource {
  final CouldFireStoreService _couldFireStoreService;

  CourseRemoteDatasourceImpl(this._couldFireStoreService);

  @override
  Future<void> addCourse({required Course data}) async {
    return await _couldFireStoreService.setData(
      collection: FireCollection.courses,
      data: data.toJson(),
    );
  }
}

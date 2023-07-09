import 'package:injectable/injectable.dart';
import 'package:tutors/core/models/course.dart';
import 'package:tutors/core/models/registation.dart';

import '../../../../core/constants/firebase_collection.dart';
import '../../../../core/services/auth_service.dart';
import '../../../../core/services/cloud_firestore_service.dart';

abstract class MyCourseRemoteDatasource {
  Future<List<Registation>> getRgisteredCourse({String? arg});
  Future<List<Course>> getCreatedCourse();
}

@LazySingleton(as: MyCourseRemoteDatasource)
class MyCourseRemoteDatasourceImpl implements MyCourseRemoteDatasource {
  final CouldFireStoreService _couldFireStoreService;
  final AuthService _authService;

  MyCourseRemoteDatasourceImpl(this._couldFireStoreService, this._authService);
  @override
  Future<List<Registation>> getRgisteredCourse({String? arg}) async {
    List<Registation> registerData = [];
    final dataSnapshot = await _couldFireStoreService.getAllData(
        collection: FireCollection.registation, field: 'userId', arg: arg);
    List<Registation> listData = dataSnapshot.map((data) {
      return Registation.fromJson(data);
    }).toList();
    //Get course
    for (Registation register in listData) {
      Registation data = register;
      Course? course;
      Map<String, dynamic>? courseData =
          await _couldFireStoreService.getDataByDocs(
              collection: FireCollection.courses, doc: register.courseId ?? '');
      if (courseData != null) {
        course = Course.fromJson(courseData);
      }
      data = data.copyWith(course: course);
      registerData.add(data);
    }
    return registerData;
  }

  @override
  Future<List<Course>> getCreatedCourse() async {
    final currentUser = await _authService.getCurrentUser();
    final dataSnapshot = await _couldFireStoreService.getAllData(
        collection: FireCollection.courses,
        field: 'userId',
        arg: currentUser?.uid);
    List<Course> listData =
        dataSnapshot.map((data) => Course.fromJson(data)).toList();
    return listData;
  }
}

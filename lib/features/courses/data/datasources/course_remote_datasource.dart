import 'package:injectable/injectable.dart';

import '../../../../core/constants/firebase_collection.dart';
import '../../../../core/models/course.dart';
import '../../../../core/services/cloud_firestore_service.dart';

abstract class CourseRemoteDatasource {
  Future<void> addCourse({required Course data});
  Future<List<Course>> getAllCourse();
}

@LazySingleton(as: CourseRemoteDatasource)
class CourseRemoteDatasourceImpl implements CourseRemoteDatasource {
  final CouldFireStoreService _couldFireStoreService;

  CourseRemoteDatasourceImpl(this._couldFireStoreService);

  @override
  Future<void> addCourse({required Course data}) async {
    Map<String, dynamic> mapData = data.toJson();
    mapData.remove('users');
    return await _couldFireStoreService.setData(
      collection: FireCollection.courses,
      data: mapData,
    );
  }

  @override
  Future<List<Course>> getAllCourse() async {
    final dataSnapshot = await _couldFireStoreService.getAllData(
        collection: FireCollection.courses);
    List<Course> listData = [];
    List<Course> listCourse = dataSnapshot.map((doc) {
      return Course.fromJson(doc);
    }).toList();
    for (Course course in listCourse) {
      final user =
          await _couldFireStoreService.getUser(docID: course.userId ?? "");
      final data = course.copyWith(users: user);
      listData.add(data);
    }
    return listData;
  }
}

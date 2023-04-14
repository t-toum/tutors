import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:injectable/injectable.dart';
import 'package:tutors/core/error/exceptions.dart';

abstract class CouldFireStoreService {
  Future<void> setData({
    required String collection,
    required String doc,
    required Map<String, dynamic> data,
  });

  Future<List<Map<String, dynamic>>> getAllData({required String collection});
  Future<Map<String, dynamic>?> getDataByDocs(
      {required String collection, required String doc});
  Future<void> updateData(
      {required String collection,
      required String doc,
      required Map<String, dynamic> data});
}

@LazySingleton(as: CouldFireStoreService)
class CouldFireStoreServiceImpl implements CouldFireStoreService {
  final FirebaseFirestore _firebaseFirestore;

  CouldFireStoreServiceImpl(this._firebaseFirestore);

  @override
  Future<void> setData(
      {required String collection,
      required String doc,
      required Map<String, dynamic> data}) async {
    try {
      return await _firebaseFirestore.collection(collection).doc(doc).set(data);
    } on FirebaseException catch (e) {
      throw ServerException(e.message);
    } catch (e) {
      throw ServerException(e.toString());
    }
  }

  @override
  Future<Map<String, dynamic>?> getDataByDocs(
      {required String collection, required String doc}) async {
    try {
      final documentSnapshot =
          await _firebaseFirestore.collection(collection).doc(doc).get();
      return documentSnapshot.data();
    } on FirebaseException catch (e) {
      throw ServerException(e.message);
    } catch (e) {
      throw ServerException(e.toString());
    }
  }

  @override
  Future<List<Map<String, dynamic>>> getAllData(
      {required String collection}) async {
    try {
      final documentSnapshot =
          await _firebaseFirestore.collection(collection).get();
      return documentSnapshot.docs.map((e) => e.data()).toList();
    } on FirebaseException catch (e) {
      throw ServerException(e.message);
    } catch (e) {
      throw ServerException(e.toString());
    }
  }

  @override
  Future<void> updateData(
      {required String collection,
      required String doc,
      required Map<String, dynamic> data}) async {
    try {
      return await _firebaseFirestore
          .collection(collection)
          .doc(doc)
          .update(data);
    } on FirebaseException catch (e) {
      throw ServerException(e.message);
    } catch (e) {
      throw ServerException(e.toString());
    }
  }
}

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:injectable/injectable.dart';
import 'package:tutors/core/error/exceptions.dart';

@singleton
class CouldFireStoreService {
  final FirebaseFirestore _firebaseFirestore;
  CouldFireStoreService(this._firebaseFirestore);
  
  Future<void> saveToFireStore({
    required String collection,
    required String doc,
    required Map<String, dynamic> data,
  }) async {
    try {
      await _firebaseFirestore.collection(collection).doc(doc).set(data);
    } on FirebaseException catch (e) {
      throw ServerException(e.message);
    } catch (e) {
      throw ServerException(e.toString());
    }
  }
}

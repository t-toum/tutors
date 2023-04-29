import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:injectable/injectable.dart';
import 'package:tutors/core/error/exceptions.dart';
import 'package:tutors/core/models/education.dart';
import 'package:tutors/core/models/experience.dart';

import '../constants/firebase_collection.dart';
import '../models/users.dart';

@lazySingleton
class CouldFireStoreService {
  final FirebaseFirestore _firebaseFirestore;
  CouldFireStoreService(this._firebaseFirestore);
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

  Future<String?> addExperience(
      {required Experience experience, required String docID}) async {
    try {
      final result = await _firebaseFirestore
          .collection(FireCollection.users)
          .doc(docID)
          .collection(SubCollection.experiences)
          .add(experience.toJson());
      return result.id;
    } on FirebaseException catch (e) {
      throw ServerException(e.message);
    } catch (e) {
      throw ServerException(e.toString());
    }
  }

  Future<Users> getUser({required String docID}) async {
    try {
      //get user
      final userSnapshot = await _firebaseFirestore
          .collection(FireCollection.users)
          .doc(docID)
          .get();

      //get experience
      final experienceSnapshot = await _firebaseFirestore
          .collection(FireCollection.users)
          .doc(docID)
          .collection(SubCollection.experiences)
          .get();
      List<Experience> listExperience = experienceSnapshot.docs.map((e) {
        Map<String, dynamic> mapData = e.data();
        mapData['id'] = e.id;

        return Experience.fromJson(mapData);
      }).toList();
      Map<String, dynamic> userData = userSnapshot.data() ?? {};

      //get education
      final educationSnapshot = await _firebaseFirestore
          .collection(FireCollection.users)
          .doc(docID)
          .collection(SubCollection.educations)
          .get();
      List<Education> listEducation = educationSnapshot.docs.map((e) {
        Map<String, dynamic> mapData = e.data();
        mapData['id'] = e.id;
        return Education.fromJson(mapData);
      }).toList();
      userData["experiences"] = listExperience.map((e) => e.toJson()).toList();
      userData["educations"] = listEducation.map((e) => e.toJson()).toList();
      Users users = Users.fromJson(userData);
      return users;
    } on FirebaseException catch (e) {
      throw ServerException(e.message);
    } catch (e) {
      throw ServerException(e.toString());
    }
  }

  Future<void> deleteExperience(
      {required String userId, required String experienceId}) async {
    try {
      return await _firebaseFirestore
          .collection(FireCollection.users)
          .doc(userId)
          .collection(SubCollection.experiences)
          .doc(experienceId)
          .delete();
    } on FirebaseException catch (e) {
      throw ServerException(e.message);
    } catch (e) {
      throw ServerException(e.toString());
    }
  }

  Future<void> updateExperience(
      {required String userId,
      required String experienceId,
      required Map<String, dynamic> data}) async {
    try {
      return await _firebaseFirestore
          .collection(FireCollection.users)
          .doc(userId)
          .collection(SubCollection.experiences)
          .doc(experienceId)
          .update(data);
    } on FirebaseException catch (e) {
      throw ServerException(e.message);
    } catch (e) {
      throw ServerException(e.toString());
    }
  }

  Future<String?> addEducation(
      {required String userId, required Map<String, dynamic> data}) async {
    try {
      final result = await _firebaseFirestore
          .collection(FireCollection.users)
          .doc(userId)
          .collection(SubCollection.educations)
          .add(data);
      return result.id;
    } on FirebaseException catch (e) {
      throw ServerException(e.message);
    } catch (e) {
      throw ServerException(e.toString());
    }
  }
}

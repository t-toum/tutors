import 'package:firebase_auth/firebase_auth.dart';

extension FirebaseUserExtension on User? {
  Map<String, dynamic> toJson() => {
        'id': this?.uid,
        'firstName':this?.displayName,
        'lastName': null,
        'role': null,
        'email': this?.email,
        'tel': this?.phoneNumber,
        'profileUrl': this?.photoURL,
        'coverUrl': null,
        'jobTitle': null,
        'position': null,
        'industry': null,
        'country': null,
        'city': null,
        'gender': null,
        'birthDay': null,
        'address': null,
        'educations': null,
        'experiences': null,
        'skills': null,
        'about': null,
      };
}

import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:injectable/injectable.dart';
import 'package:tutors/core/error/exceptions.dart';
import 'package:tutors/core/extensions/file_extension.dart';


abstract class StorageService {
  Future<String?> uploadImage({required File file, String? ref});
}

@LazySingleton(as: StorageService)
class StorageServiceImpl implements StorageService {
  final FirebaseStorage _storage;
  StorageServiceImpl(this._storage);

  @override
  Future<String?> uploadImage({required File file, String? ref}) async {
    try {
      final storageRef =
          _storage.ref(ref).child(file.getFullName() ?? 'test');
      final task = await storageRef.putFile(file);
      String? url = await task.ref.getDownloadURL();
      return url;
    } on FirebaseException catch (e) {
      throw ServerException(e.message);
    } catch (e) {
      throw ServerException(e.toString());
    }
  }
}

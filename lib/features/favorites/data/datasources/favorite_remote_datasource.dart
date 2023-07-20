import 'package:injectable/injectable.dart';
import 'package:tutors/core/constants/firebase_collection.dart';
import 'package:tutors/core/models/favorite.dart';
import 'package:tutors/core/services/cloud_firestore_service.dart';

abstract class FavoriteRemoteDatasource {
  Future<List<Favorite>> getFavorite({required String userId});
  Future<void> addToFavorite({required Favorite data});
  Future<void> removeFavorite({required String id});
}

@LazySingleton(as: FavoriteRemoteDatasource)
class FavoriteRemoteDatasourceImpl implements FavoriteRemoteDatasource {
  final CouldFireStoreService _fireStoreService;

  FavoriteRemoteDatasourceImpl(this._fireStoreService);
  @override
  Future<void> addToFavorite({required Favorite data}) async {
    return await _fireStoreService.setData(
      collection: FireCollection.favorites,
      data: data.toJson(),
    );
  }

  @override
  Future<List<Favorite>> getFavorite({required String userId}) async {
    final dataSnapshot = await _fireStoreService.getAllData(
        collection: FireCollection.favorites, arg: userId, field: 'userId');

    List<Favorite> listFavorite =
        dataSnapshot.map((docs) => Favorite.fromJson(docs)).toList();
    return listFavorite;
  }

  @override
  Future<void> removeFavorite({required String id}) async {
    return await _fireStoreService.deleteDoc(
        collection: FireCollection.favorites, docID: id);
  }
}

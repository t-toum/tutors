part of 'favorite_cubit.dart';

@freezed
class FavoriteState with _$FavoriteState {
  const factory FavoriteState({
    @Default(DataStatus.initial)
    DataStatus status,
    String? error,
    List<Favorite>? listFavorite,
    Users? currentUser,

  }) = _Initial;
}

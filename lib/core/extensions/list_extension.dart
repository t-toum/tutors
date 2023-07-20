extension ListExtension<T> on List<T>? {
  T? firstWhereOrNull(bool Function(T element) test, {T Function()? orElse}) {
    return this != null ? this!.firstWhere(test, orElse: orElse) : null;
  }
}

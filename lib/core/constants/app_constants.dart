enum DataStatus {
  initial,
  loading,
  success,
  failure,
}

enum ImageType {
  none,
  cover,
  profile,
  course,
}

enum AppLanguage { lo, en }

enum CourseType {
  online,
  offine,
}


class UserRole {
  static const String student = "student";
  static const String teacher = "teacher";
}
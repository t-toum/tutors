class AddCourseParams {
  final String title;
  final Map<String, dynamic> data;
  final bool isUpdate;
  AddCourseParams({
    required this.title,
    required this.data,
    this.isUpdate = false,
  });
}

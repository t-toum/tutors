import 'package:tutors/core/models/course.dart';

extension CourseExtension on Course {
  Map<String, dynamic> get toJsonWithoutConvert => {
        'id': id,
        'userId': userId,
        'title': title,
        'subject': subject,
        'location': location,
        'category': category,
        'startDate': startDate,
        'endDate': endDate,
        'description': description,
        'users': users,
        'createdDate': createdDate,
        'imageUrl': imageUrl,
        'status': status,
        'maximum': maximum.toString(),
      };
}

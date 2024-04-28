import 'package:bit_connect/utils/constants/gpa_constants.dart';
double calculateGpa(List<Map<String, dynamic>> courseData) {
  GpaConstants gpaConstants = GpaConstants();
  double totalValue = 0;
  double totalWeight = 0;
  for (var course in courseData) {
    if (course['value'] != null || course['grade'] != null) {
      totalValue += (course['value'] as double) * gpaConstants.gradeValue[course['grade']]!;
      totalWeight += course['value'] as double;
    }
  }
  return totalWeight == 0 ? 0 : totalValue / totalWeight;
}

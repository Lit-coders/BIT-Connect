Map<String, double> gradeValue = {
      'A': 4,
      'A-': 3.75,
      'B+': 3.5,
      'B': 3,
      'B-': 2.75,
      'C+': 2.5,
      'C': 2,
      'C-': 1.75,
      'D': 1,
      'F': 0,
  }; 
 
 
 
  double calculateGpa(List<Map<String, dynamic>> courseData) {
    double totalValue = 0;
    double totalWeight = 0;
    for (var course in courseData) {
      if (course['value'] != null || course['grade'] != null) {
        totalValue += (course['value'] as double) * gradeValue[course['grade']]!;
        totalWeight += course['value'] as double;
      }
    }
    return totalWeight == 0 ? 0 : totalValue / totalWeight;
  }
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/widgets.dart';

class GpaCalculatorScreen extends StatefulWidget {
  GpaCalculatorScreen({Key? key}) : super(key: key);
  @override
  _GpaCalculatorScreenState createState() => _GpaCalculatorScreenState();
}

class _GpaCalculatorScreenState extends State<GpaCalculatorScreen> {
  List<Map<String, dynamic>> courseData = [];

  double calculateGpa() {
    Map<String, int> gradeValue = {
      'A': 4,
      'B': 3,
      'C': 2,
      'D': 1,
      'F': 0,
    };
    int totalValue = 0;
    int totalWeight = 0;
    for (var course in courseData) {
      if (course['value'] != null) {
        totalValue +=
            (course['value'] as int) * gradeValue[course['grade']]!;
        totalWeight += course['value'] as int;
      }
    }
    if (totalWeight == 0) {
      return 0.0;
    }
    return totalValue / totalWeight;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('GPA Calculator'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: courseData.length,
                itemBuilder: (context, index) {
                  return CourseInputRow(
                    courseData: courseData[index],
                    onCourseDataChanged: (newData) {
                      setState(() {
                        courseData[index] = newData;
                      });
                    },
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: InkWell(
                onTap: () {
                  setState(() {
                    courseData.add({});
                  });
                },
                child: DottedBorder(
                  dashPattern: [5, 5],
                  color: Colors.grey,
                  strokeWidth: 2,
                  child: Container(
                    padding: const EdgeInsets.all(20),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.add_circle,
                          color: Colors.red,
                          size: 20,
                        ),
                        SizedBox(width: 10),
                        Text(
                          'Add Course',
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 40),
            ElevatedButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: Text('Calculation Result'),
                      content: Text(
                          'The result is: ${calculateGpa().toStringAsFixed(2)}'),
                      actions: <Widget>[
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: Text('OK'),
                        ),
                      ],
                    );
                  },
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                padding: const EdgeInsets.all(25),
              ),
              child: const Text(
                'Calculate GPA',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }
}

class CourseInputRow extends StatelessWidget {
  final Map<String, dynamic> courseData;
  final ValueChanged<Map<String, dynamic>> onCourseDataChanged;

  const CourseInputRow({
    required this.courseData,
    required this.onCourseDataChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.blue.shade500, width: 2),
        ),
        child: Row(
          children: [
            Expanded(
              child: Column(
                children: [
                  TextField(
                    onChanged: (value) {
                      courseData['courseName'] = value;
                      onCourseDataChanged(courseData);
                    },
                    decoration: const InputDecoration(
                      contentPadding: EdgeInsets.all(10),
                      hintText: 'Course Name',
                      border: UnderlineInputBorder(),
                    ),
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          decoration: const BoxDecoration(
                            border: Border(
                              right: BorderSide(color: Colors.black),
                            ),
                          ),
                          child: DropdownButtonFormField<String>(
                            value: courseData['grade'],
                            onChanged: (newValue) {
                              courseData['grade'] = newValue!;
                              onCourseDataChanged(courseData);
                            },
                            items: <String>['A', 'B', 'C', 'D', 'F']
                                .map((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              );
                            }).toList(),
                            decoration: const InputDecoration(
                              contentPadding: EdgeInsets.all(5),
                              hintText: 'Grade',
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          child: DropdownButtonFormField<int>(
                            value: courseData['value'],
                            onChanged: (newValue) {
                              courseData['value'] = newValue!;
                              onCourseDataChanged(courseData);
                            },
                            items: <int>[30, 7, 6, 5, 4].map((int value) {
                              return DropdownMenuItem<int>(
                                value: value,
                                child: Text(value.toString()),
                              );
                            }).toList(),
                            decoration: const InputDecoration(
                              contentPadding: EdgeInsets.all(5),
                              hintText: 'Value',
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(width: 2 , color: Colors.red),
              ),
              child: IconButton(
                onPressed: () {
                  onCourseDataChanged({});
                },
                icon: const Icon(Icons.close,color: Colors.red,),
              ),
            )
          ],
        ),
      ),
    );
  }
}

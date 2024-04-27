import 'package:flutter/material.dart';
import 'package:dotted_border/dotted_border.dart';

class GpaCalculatorScreen extends StatefulWidget {
  GpaCalculatorScreen({Key? key}) : super(key: key);
  @override
  _GpaCalculatorScreenState createState() => _GpaCalculatorScreenState();
}

class _GpaCalculatorScreenState extends State<GpaCalculatorScreen> {
  List<Map<String, dynamic>> courseData = [];

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
            InkWell(
              onTap: () {
                setState(() {
                  courseData.add({});
                });
              },
              child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: DottedBorder(
                    dashPattern: [5, 5],
                    color: Colors.grey,
                    strokeWidth: 2,
                    child: Expanded(
                      child: Container(
                          // decoration: BoxDecoration(
                          //   border: Border.all(color: Colors.blueAccent),
                          // ),
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
                          )),
                    ),
                  )),
            ),
            const SizedBox(height: 40),
            ElevatedButton(
              onPressed: () {
                courseData.add({});
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green, // Background color
                padding: const EdgeInsets.all(25), // Padding
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
          decoration:
              BoxDecoration(border: Border.all(color: Colors.blueAccent)),
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
              Row(children: [
                Expanded(
                  child: Container(
                    decoration: const BoxDecoration(
                        border: Border(
                      right: BorderSide(color: Colors.black),
                    )),
                    child: DropdownButtonFormField<String>(
                      value: courseData['grade'],
                      onChanged: (newValue) {
                        courseData['grade'] = newValue!;
                        onCourseDataChanged(courseData);
                      },
                      items: <String>['A', 'B', 'C'].map((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                      decoration: const InputDecoration(
                          contentPadding: EdgeInsets.all(10),
                          hintText: 'Grade',
                          border: InputBorder.none),
                    ),
                  ),
                ),
                Expanded(
                  child: DropdownButtonFormField<int>(
                    value: courseData['value'],
                    onChanged: (newValue) {
                      courseData['value'] = newValue!;
                      onCourseDataChanged(courseData);
                    },
                    items: <int>[4, 3, 2, 1].map((int value) {
                      return DropdownMenuItem<int>(
                        value: value,
                        child: Text(value.toString()),
                      );
                    }).toList(),
                    decoration: const InputDecoration(
                      hintText: 'Value',
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ])
            ],
          ),
        ));
  }
}

double calculateGpa(List<Map<String, dynamic>> courseData) {
  int totalValue = 0;
  int totalWeight = 0;
  for (var course in courseData) {
    if (course['value'] != null) {
      totalValue += int.parse(course['value']) * int.parse(course['grade']);
      totalWeight += int.parse(course['value']);
    }
  }
  return totalValue / totalWeight;
}
import 'package:flutter/material.dart';

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
            ElevatedButton(
              onPressed: () {
                setState(() {
                  courseData.add({});
                });
              },
              child: const Text('Add Course'),
            ),
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
      padding: const EdgeInsets.all(15.0),
      child:
      Container (
       decoration : BoxDecoration(
          border: Border.all(color: Colors.blueAccent)
       ),
       child :Column(
        children: [
          TextField(
              onChanged: (value) {
                courseData['courseName'] = value;
                onCourseDataChanged(courseData);
              },
              decoration: const InputDecoration(
                hintText: 'Course Name',
                border: UnderlineInputBorder(),

              ),
            ),
          Row(children: [
            Expanded(
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
                  hintText: 'Grade',
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
                ),
              ),
            ),
          ])
        ],
      ),
      )
    );
  }
}

import 'package:bit_connect/presentation/sims/api/sims_general_status.dart';
import 'package:bit_connect/presentation/sims/helpers/sims_helpers.dart';
import 'package:flutter/material.dart';

class StatusTable extends StatefulWidget {
  const StatusTable({super.key});

  @override
  State<StatusTable> createState() => _StatusTableState();
}

class _StatusTableState extends State<StatusTable> {
  final status = {
    'Academic Year': ['2020/2021', '2020/2021'],
    'Batch': ['1', '1'],
    'Semester': ['I', "II"],
    'Registration Date': ['7/23/2021', '10/8/2021'],
    'Reg Condition': ["Normal Load", "Normal Load"],
    'SGPA': ['1.2', '3.4'],
    'CGPA': ['2.3', '2.3'],
    'prevStatus': ['Pass', 'Pass'],
    'finalStatus': ['Pass', 'Pass'],
  };
  // academicyear: tds[1].innerText,
  //           year: tds[2].innerText,
  //           semester: tds[3].innerText,
  //           registrationDate: tds[4].innerText,
  //           registrationCondition: tds[6].innerText,
  //           sgpa: tds[7].innerText,
  //           cgpa: tds[8].innerText,
  //           prevStatus: tds[9].innerText,
  //           finalStatus: tds[10].innerText,

  DataColumn tHeader(value) {
    return DataColumn(
      label: Container(
        child: Text(
          value,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  Future<void> getGeneralStatus() async {
    try {
      final String token = await getLoggedInStd();
      final response = await fetchGeneralStatus(token);
      print(token);
    } catch (e) {
      print("error: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    getGeneralStatus();

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: DataTable(
        columnSpacing: 20.0,
        columns: status.keys.map((String key) {
          return DataColumn(label: Text(key));
        }).toList(),
        rows: List<DataRow>.generate(
          status.values.first.length,
          (index) => DataRow(
            cells: status.keys.map((String key) {
              return DataCell(Text(status[key]![index]));
            }).toList(),
          ),
        ),
      ),
    );
  }
}

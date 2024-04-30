import 'package:flutter/material.dart';

class StatusTable extends StatefulWidget {
  const StatusTable({super.key});

  @override
  State<StatusTable> createState() => _StatusTableState();
}

class _StatusTableState extends State<StatusTable> {
  final status = {
    'Academic Year': [
      '2020/2021',
      '2020/2021',
      '2020/2021',
      '2020/2021',
      '2020/2021',
      '2020/2021'
    ],
    'Batch': ['1', '1', '1', '1', '1', '1'],
    'Semester': ['I', "II", 'I', "II", 'I', "II"],
    'Registration Date': [
      '7/23/2021',
      '10/8/2021',
      '7/23/2021',
      '10/8/2021',
      '7/23/2021',
      '10/8/2021'
    ],
    'Reg Condition': [
      "Normal Load",
      "Normal Load",
      "Normal Load",
      "Normal Load",
      "Normal Load",
      "Normal Load"
    ],
    'SGPA': ['1.2', '3.4', '1.2', '3.4', '1.2', '3.4'],
    'CGPA': ['2.3', '2.3', '2.3', '2.3', '2.3', '2.3'],
    'prevStatus': ['Pass', 'Pass', 'Pass', 'Pass', 'Pass', 'Pass'],
    'finalStatus': ['Pass', 'Pass', 'Pass', 'Pass', 'Pass', 'Pass'],
  };

  Widget th(value, isTh, isLast) {
    return Container(
      alignment: Alignment.center,
      padding: const EdgeInsets.symmetric(horizontal: 8),
      decoration: BoxDecoration(
        color: isTh
            ? const Color.fromARGB(79, 87, 172, 246)
            : const Color.fromARGB(49, 87, 172, 246),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(isTh ? 10 : 0),
          topRight: Radius.circular(isTh ? 10 : 0),
          bottomLeft: Radius.circular(!isTh && isLast ? 10 : 0),
          bottomRight: Radius.circular(isLast ? 10 : 0),
        ),
      ),
      child: Text(
        value,
        textAlign: TextAlign.center,
        style: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: DataTable(
          showBottomBorder: false,
          horizontalMargin: 0,
          columnSpacing: 6.0,
          columns: status.keys.map((String key) {
            return DataColumn(label: th(key, true, false));
          }).toList(),
          rows: List<DataRow>.generate(
            status.values.first.length,
            (index) => DataRow(
              cells: status.keys.map((String key) {
                return DataCell(
                  th(
                    status[key]![index],
                    false,
                    index == status.values.first.length - 1,
                  ),
                );
              }).toList(),
            ),
          ),
        ),
      ),
    );

    // return Container(
    //   child: GridView.builder(
    //     shrinkWrap: true,
    //     scrollDirection: Axis.horizontal,
    //     gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
    //       crossAxisCount: 1,
    //     ),
    //     itemCount: status.values.toList()[0].length + 1,
    //     itemBuilder: (context, index) {
    //       return ListView.builder(
    //         shrinkWrap: true,
    //         itemCount: status.values.toList()[0].length + 1,
    //         itemBuilder: (context, index) {
    //           if (index == 0) {
    //             return Row(
    //               children: status.keys.map((key) => th(key)).toList(),
    //             );
    //           }

    //           return Row(
    //             children: status.keys.map((String key) {
    //               return th(status[key]![index - 1]);
    //             }).toList(),
    //           );
    //         },
    //       );
    //     },
    //   ),
    // );
  }
}

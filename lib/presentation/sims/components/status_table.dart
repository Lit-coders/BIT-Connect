import 'package:bit_connect/presentation/sims/components/title.dart';
import 'package:bit_connect/presentation/sims/model/general_status.dart';
import 'package:flutter/material.dart';

class StatusTable extends StatefulWidget {
  List<GeneralStatus> generalStatus;
  StatusTable({super.key, required this.generalStatus});

  @override
  State<StatusTable> createState() => _StatusTableState();
}

class _StatusTableState extends State<StatusTable> {
  final headers = [
    'Academic Year',
    'Batch',
    'Semester',
    'Registration Date',
    'Reg Condition',
    'SGPA',
    'CGPA',
    'prevStatus',
    'finalStatus',
  ];

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
    final List<GeneralStatus> status = widget.generalStatus;
    print('list of general status: ${status.length}');
    return Column(
      children: [
        title(context, 'Tabulated Academic Summary'),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: DataTable(
              showBottomBorder: false,
              horizontalMargin: 0,
              columnSpacing: 6.0,
              columns: headers
                  .map(
                    (e) => DataColumn(
                      label: th(e, true, false),
                    ),
                  )
                  .toList(),
              rows: status.map((gStatus) {
                return DataRow(cells: [
                  DataCell(Text(gStatus.academicYear)),
                  DataCell(Text(gStatus.semester)),
                  DataCell(Text(gStatus.batch)),
                  DataCell(Text(gStatus.regDate)),
                  DataCell(Text(gStatus.regCondition)),
                  DataCell(Text(gStatus.sGpa)),
                  DataCell(Text(gStatus.cGpa.toString())),
                  DataCell(Text(gStatus.prevStatus.toString())),
                  DataCell(Text(gStatus.finalStatus.toString())),
                ]);
              }).toList(),
            ),
          ),
        ),
      ],
    );
  }
}

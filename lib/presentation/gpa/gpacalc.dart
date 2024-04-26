import 'package:bit_connect/utils/constants/color_assets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class GpaCalculator extends StatefulWidget {
  const GpaCalculator({super.key});

  @override
  State<GpaCalculator> createState() => _GpaCalculatorState();
}

class _GpaCalculatorState extends State<GpaCalculator> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            leading: Icon(
              size: 26,
              Icons.keyboard_return_rounded,
              color: ColorAssets.white,
            ),
            backgroundColor: ColorAssets.bduColor,
            toolbarHeight: 80,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(10),
                    bottomRight: Radius.circular(10))),
          ),
          body: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Semester',
                  textAlign: TextAlign.left,
                  style: TextStyle(fontSize: 18,fontWeight:FontWeight.w900,color: ColorAssets.bduColor),
                ),
                SizedBox(
                  height: 20,
                ),
                TextField(
                  decoration: InputDecoration(
                    labelText: 'Course Name',
                    hintText: 'Amharic',
                    prefixIcon: Icon(Icons.abc), // Icon before the input field
                    border:
                        OutlineInputBorder(), // Border around the input field
                    filled: true, // Fill the input field with background color
                    fillColor: const Color.fromARGB(255, 223, 241,
                        255), // Background color of the input field
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: DropdownMenu(
                          enableFilter: true,
                          label: const Text('Grades'),
                          width: 280,
                          onSelected: (grade) => {
                                if (grade != null)
                                  {
                                    setState(() {
                                      grade += 1;
                                    })
                                  }
                              },
                          dropdownMenuEntries: <DropdownMenuEntry>[
                            DropdownMenuEntry(value: 'A', label: 'A'),
                            DropdownMenuEntry(value: 'B', label: 'B'),
                            DropdownMenuEntry(value: 'C', label: 'C'),
                            DropdownMenuEntry(value: 'D', label: 'D'),
                            DropdownMenuEntry(value: 'F', label: 'F'),
                          ]),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Container(
                      decoration: BoxDecoration(color: ColorAssets.bduColor,borderRadius: BorderRadius.circular(50)),
                      child: IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.add,
                          size: 32,
                          color: ColorAssets.white,
                        ),
                        
                        
                      ),
                    )
                  ],
                )
                ,
                
              ],
            ),
          ),
        ),
      ),
    );
  }
}

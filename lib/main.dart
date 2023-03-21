import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scan_element/enums.dart';

import 'avaz_button.dart';
import 'bloc/scan_bloc.dart';
import 'scanner.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider<ScanBloc>(
      create: (context) => ScanBloc(),
      child: MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: const HomePage()),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  GlobalKey key1 = GlobalKey();
  bool isOverLapping = false;
  var isStopped = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: InkWell(
        onTap: () {
          BlocProvider.of<ScanBloc>(context)
              .add(const ChangeXScanStatus(xScanStatus: ScanStatus.off));
        },
        child: Stack(
          alignment: Alignment.topLeft,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  height: 100,
                  margin:
                      const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Colors.black)),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      children: [
                        AvazButton(
                          xGlobalKey: key1,
                          value: '1',
                        ),
                        AvazButton(
                          xGlobalKey: key1,
                          value: '2',
                        ),
                        AvazButton(
                          xGlobalKey: key1,
                          value: '3',
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        AvazButton(
                          xGlobalKey: key1,
                          value: '4',
                        ),
                        AvazButton(
                          xGlobalKey: key1,
                          value: '5',
                        ),
                        AvazButton(
                          xGlobalKey: key1,
                          value: '6',
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        AvazButton(
                          xGlobalKey: key1,
                          value: '7',
                        ),
                        AvazButton(
                          xGlobalKey: key1,
                          value: '8',
                        ),
                        AvazButton(
                          xGlobalKey: key1,
                          value: '9',
                        ),
                      ],
                    )
                  ],
                ),
              ],
            ),
            Scanner(
              globalkey: key1,
            )
          ],
        ),
      ),
    );
  }
}

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scan_element/bloc/scan_bloc.dart';
import 'package:scan_element/enums.dart';

class Scanner extends StatefulWidget {
  final GlobalKey globalkey;
  const Scanner({super.key, required this.globalkey});

  @override
  State<Scanner> createState() => _ScannerState();
}

class _ScannerState extends State<Scanner> with TickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation _animation;

  @override
  void initState() {
    // X SCANNER
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    );
    _animationController.repeat(reverse: true);
    _animation = Tween(begin: 0.0, end: 1.0).animate(_animationController);
    // Y SCANNER
    super.initState();
  }

  var isXstopped = false;

  @override
  Widget build(BuildContext context) {
    double maxWidth = MediaQuery.of(context).size.width;
    double maxHeight = MediaQuery.of(context).size.height;
    return BlocListener<ScanBloc, ScanState>(
      listener: (context, state) {
        if (state.xScanStatus == ScanStatus.off) {
          if (state.yScanStatus == ScanStatus.on) {
            _animationController.repeat(reverse: true);
            BlocProvider.of<ScanBloc>(context)
                .add(const ChangeYScanStatus(yScanStatus: ScanStatus.running));
          }
        }

        log('X Scanning is ${state.xScanStatus}, Y Scanning is ${state.yScanStatus}');
        // else {
        //   log('${state.xStopped}');
        //   _animationController.repeat(reverse: true);
        // }
      },
      child: AnimatedBuilder(
          animation: _animation,
          builder: (context, child) {
            var translateX = _animation.value * (maxWidth - 100);
            BlocProvider.of<ScanBloc>(context).add(SendXScanPositions(
                xScanPositions: Offset(translateX, maxHeight / 3)));
            return Transform.translate(
                offset: Offset(_animation.value * (maxWidth - 100), 0),
                child: Container(
                    key: widget.globalkey,
                    height: maxHeight,
                    width: 100,
                    color: Colors.blue.withOpacity(0.5)));
          }),
    );
  }
}

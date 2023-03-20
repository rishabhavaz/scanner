import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scan_element/bloc/scan_bloc.dart';

class Scanner extends StatefulWidget {
  final GlobalKey globalkey;
  const Scanner({super.key, required this.globalkey});

  @override
  State<Scanner> createState() => _ScannerState();
}

class _ScannerState extends State<Scanner> with TickerProviderStateMixin {
  late AnimationController _xAnimationController;
  late Animation _xAnimation;
  late AnimationController _yAnimationController;
  late Animation _yAnimation;

  @override
  void initState() {
    // X SCANNER
    _xAnimationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    );
    _xAnimationController.repeat(reverse: true);
    _xAnimation = Tween(begin: 0.0, end: 1.0).animate(_xAnimationController);
    // Y SCANNER
    _yAnimationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    );
    _yAnimation = Tween(begin: 0.0, end: 1.0).animate(_yAnimationController);
    super.initState();
  }

  var isXstopped = false;

  @override
  Widget build(BuildContext context) {
    double maxWidth = MediaQuery.of(context).size.width;
    double maxHeight = MediaQuery.of(context).size.height;
    return BlocListener<ScanBloc, ScanState>(
      listener: (context, state) {
        if (state.xStopped == true) {
          log('${state.xStopped}');
          _xAnimationController.stop();
          var isXstopped = state.xStopped;
          _yAnimationController.repeat(reverse: true);
        }
        // else {
        //   log('${state.xStopped}');
        //   _animationController.repeat(reverse: true);
        // }
      },
      child: AnimatedBuilder(
          animation: isXstopped ? _yAnimation : _xAnimation,
          builder: (context, child) {
            var translateX = _xAnimation.value * (maxWidth - 100);
            var translateY = _yAnimation.value * (maxHeight - 100);
            BlocProvider.of<ScanBloc>(context).add(SendXScanPositions(
                xScanPositions: Offset(translateX, maxHeight / 3)));
            return Transform.translate(
                offset: isXstopped
                    ? Offset(_yAnimation.value * (maxHeight - 100), 0)
                    : Offset(_xAnimation.value * (maxWidth - 100), 0),
                child: Container(
                    key: widget.globalkey,
                    height: maxHeight,
                    width: 100,
                    color: Colors.blue.withOpacity(0.5)));
          }),
    );
  }
}

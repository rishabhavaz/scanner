import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scan_element/enums.dart';
import 'package:scan_element/session_helper.dart';

import 'bloc/scan_bloc.dart';

class AvazButton extends StatefulWidget {
  final GlobalKey xGlobalKey;
  final String value;
  const AvazButton({super.key, required this.xGlobalKey, required this.value});

  @override
  State<AvazButton> createState() => _AvazButtonState();
}

class _AvazButtonState extends State<AvazButton> {
  bool isOverLapping = false;

  checkOverlap(GlobalKey xGlobalKey) {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      final RenderBox? box1 =
          xGlobalKey.currentContext?.findRenderObject() as RenderBox?;
      final RenderBox? box2 = context.findRenderObject() as RenderBox?;
      final Offset offset1 = box1!.localToGlobal(Offset.zero);
      final Offset offset2 = box2!.localToGlobal(Offset.zero);
      final Rect rect1 = Rect.fromLTWH(
          offset1.dx, offset1.dy, box1.size.width, box1.size.height);
      final Rect rect2 = Rect.fromLTWH(
          offset2.dx, offset2.dy, box2.size.width, box2.size.height);
      isOverLapping = rect1.overlaps(rect2);
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ScanBloc, ScanState>(
      listener: (context, state) {
        if (state.xScanStatus == ScanStatus.off) {
          if (isOverLapping) {
            xScanKeys.add(Key(widget.value));
          }
          log('X Scanned Keys are $xScanKeys');
        }
      },
      builder: (context, state) {
        checkOverlap(widget.xGlobalKey);
        return Container(
            alignment: Alignment.center,
            margin: const EdgeInsets.symmetric(vertical: 8),
            key: Key(widget.value),
            height: 100,
            width: 100,
            color: isOverLapping ? Colors.amber : Colors.green,
            child: Text(
              widget.value,
              style: TextStyle(fontSize: 30),
            ));
      },
    );
  }
}

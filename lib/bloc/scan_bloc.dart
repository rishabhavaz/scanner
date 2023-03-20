import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'scan_event.dart';
part 'scan_state.dart';

class ScanBloc extends Bloc<ScanEvent, ScanState> {
  ScanBloc() : super(const ScanState(xScanPosition: Offset(0, 0))) {
    on<SendXScanPositions>((event, emit) {
      emit(state.copyWith(
        xScanPosition: event.xScanPositions,
      ));
    });
    on<StopXScanner>((event, emit) {
      emit(state.copyWith(
        xStopped: event.stopped,
      ));
    });
  }
}

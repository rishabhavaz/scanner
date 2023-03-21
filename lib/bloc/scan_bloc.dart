import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:scan_element/enums.dart';

part 'scan_event.dart';
part 'scan_state.dart';

class ScanBloc extends Bloc<ScanEvent, ScanState> {
  ScanBloc() : super(const ScanState(xScanPosition: Offset(0, 0))) {
    on<SendXScanPositions>((event, emit) {
      emit(state.copyWith(
        xScanPosition: event.xScanPositions,
      ));
    });
    on<ChangeXScanStatus>((event, emit) {
      emit(state.copyWith(xScanStatus: event.xScanStatus));
      add(const ChangeYScanStatus(yScanStatus: ScanStatus.on));
    });
    on<ChangeYScanStatus>((event, emit) {
      emit(state.copyWith(yScanStatus: event.yScanStatus));
    });
  }
}

part of 'scan_bloc.dart';

abstract class ScanEvent extends Equatable {
  const ScanEvent();

  @override
  List<Object> get props => [];
}

class SendXScanPositions extends ScanEvent {
  final Offset xScanPositions;
  const SendXScanPositions({required this.xScanPositions});
}

class ChangeXScanStatus extends ScanEvent {
  final ScanStatus xScanStatus;
  const ChangeXScanStatus({required this.xScanStatus});
}

class ChangeYScanStatus extends ScanEvent {
  final ScanStatus yScanStatus;
  const ChangeYScanStatus({required this.yScanStatus});
}

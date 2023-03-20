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

class StopXScanner extends ScanEvent {
  final bool stopped;
  const StopXScanner({this.stopped = false});
}

class StartYScanner extends ScanEvent {
  final bool started;
  const StartYScanner({this.started = false});
}

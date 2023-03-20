part of 'scan_bloc.dart';

class ScanState extends Equatable {
  final Offset xScanPosition;
  final bool xStopped;
  const ScanState({required this.xScanPosition, this.xStopped = false});

  ScanState copyWith({
    Offset? xScanPosition,
    bool? xStopped,
  }) {
    return ScanState(
      xScanPosition: xScanPosition ?? this.xScanPosition,
      xStopped: xStopped ?? this.xStopped,
    );
  }

  @override
  List<Object> get props => [
        xScanPosition,
        xStopped,
      ];
}

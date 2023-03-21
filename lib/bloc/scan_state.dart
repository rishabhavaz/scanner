part of 'scan_bloc.dart';

class ScanState extends Equatable {
  final Offset xScanPosition;
  final ScanStatus xScanStatus;
  final ScanStatus yScanStatus;
  const ScanState(
      {required this.xScanPosition,
      this.xScanStatus = ScanStatus.on,
      this.yScanStatus = ScanStatus.off});

  ScanState copyWith({
    Offset? xScanPosition,
    ScanStatus? xScanStatus,
    ScanStatus? yScanStatus,
  }) {
    return ScanState(
      xScanPosition: xScanPosition ?? this.xScanPosition,
      xScanStatus: xScanStatus ?? this.xScanStatus,
      yScanStatus: yScanStatus ?? this.yScanStatus,
    );
  }

  @override
  List<Object> get props => [
        xScanPosition,
        xScanStatus,
        yScanStatus,
      ];
}

class BarcodeScannerStatus {
  final bool isCameraAvailable;
  final bool stopScanner;
  final String error;
  final String barcode;

  BarcodeScannerStatus({
    this.isCameraAvailable = false,
    this.stopScanner = false,
    this.error = '',
    this.barcode = '',
  });

  factory BarcodeScannerStatus.available() => BarcodeScannerStatus(
        isCameraAvailable: true,
      );

  factory BarcodeScannerStatus.barcode(String barcode) => BarcodeScannerStatus(
        error: barcode,
        stopScanner: true,
      );

  factory BarcodeScannerStatus.error(String message) => BarcodeScannerStatus(
        error: message,
        stopScanner: true,
      );

  bool get showCamera => isCameraAvailable && error.isEmpty;

  bool get hasError => error.isNotEmpty;

  bool get hasBarcode => barcode.isNotEmpty;

  BarcodeScannerStatus copyWith({
    bool? isCameraAvailable,
    bool? stopScanner,
    String? error,
    String? barcode,
  }) {
    return BarcodeScannerStatus(
      isCameraAvailable: isCameraAvailable ?? this.isCameraAvailable,
      stopScanner: stopScanner ?? this.stopScanner,
      error: error ?? this.error,
      barcode: barcode ?? this.barcode,
    );
  }
}

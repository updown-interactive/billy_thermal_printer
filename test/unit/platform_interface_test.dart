import 'dart:typed_data';

import 'package:flutter_test/flutter_test.dart';
import 'package:billy_thermal_printer/billy_thermal_printer_method_channel.dart';
import 'package:billy_thermal_printer/billy_thermal_printer_platform_interface.dart';
import 'package:billy_thermal_printer/utils/printer.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockBillyThermalPrinterPlatform extends BillyThermalPrinterPlatform
    with MockPlatformInterfaceMixin {
  @override
  Future<String?> getPlatformVersion() async => 'Mock Platform';
}

class InvalidPlatform extends BillyThermalPrinterPlatform {}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  group('BillyThermalPrinterPlatform', () {
    late BillyThermalPrinterPlatform originalInstance;

    setUp(() {
      originalInstance = BillyThermalPrinterPlatform.instance;
    });

    tearDown(() {
      BillyThermalPrinterPlatform.instance = originalInstance;
    });

    test('default instance is MethodChannelBillyThermalPrinter', () {
      expect(
        BillyThermalPrinterPlatform.instance,
        isA<MethodChannelBillyThermalPrinter>(),
      );
    });

    test('can set custom instance with valid token', () {
      final mockPlatform = MockBillyThermalPrinterPlatform();
      BillyThermalPrinterPlatform.instance = mockPlatform;

      expect(BillyThermalPrinterPlatform.instance, mockPlatform);
    });

    test('InvalidPlatform can be created but lacks MockPlatformInterfaceMixin',
        () {
      final invalidPlatform = InvalidPlatform();
      expect(invalidPlatform, isA<BillyThermalPrinterPlatform>());
    });

    group('unimplemented methods throw UnimplementedError', () {
      late BillyThermalPrinterPlatform basePlatform;

      setUp(() {
        basePlatform = MockBillyThermalPrinterPlatform();
      });

      test('startUsbScan throws UnimplementedError', () async {
        expect(
          () => basePlatform.startUsbScan(),
          throwsA(isA<UnimplementedError>()),
        );
      });

      test('connect throws UnimplementedError', () async {
        final printer = Printer();
        expect(
          () => basePlatform.connect(printer),
          throwsA(isA<UnimplementedError>()),
        );
      });

      test('printText throws UnimplementedError', () async {
        final printer = Printer();
        final data = Uint8List.fromList([1, 2, 3]);
        expect(
          () => basePlatform.printText(printer, data),
          throwsA(isA<UnimplementedError>()),
        );
      });

      test('isConnected throws UnimplementedError', () async {
        final printer = Printer();
        expect(
          () => basePlatform.isConnected(printer),
          throwsA(isA<UnimplementedError>()),
        );
      });

      test('convertImageToGrayscale throws UnimplementedError', () async {
        final data = Uint8List.fromList([1, 2, 3]);
        expect(
          () => basePlatform.convertImageToGrayscale(data),
          throwsA(isA<UnimplementedError>()),
        );
      });

      test('disconnect throws UnimplementedError', () async {
        final printer = Printer();
        expect(
          () => basePlatform.disconnect(printer),
          throwsA(isA<UnimplementedError>()),
        );
      });

      test('stopScan throws UnimplementedError', () async {
        expect(
          () => basePlatform.stopScan(),
          throwsA(isA<UnimplementedError>()),
        );
      });

      test('getPrinters throws UnimplementedError', () async {
        expect(
          () => basePlatform.getPrinters(),
          throwsA(isA<UnimplementedError>()),
        );
      });
    });

    group('base class getPlatformVersion', () {
      test('throws UnimplementedError by default', () {
        final basePlatform = _BasePlatformForTest();
        expect(
          basePlatform.getPlatformVersion,
          throwsA(isA<UnimplementedError>()),
        );
      });
    });
  });
}

class _BasePlatformForTest extends BillyThermalPrinterPlatform
    with MockPlatformInterfaceMixin {}

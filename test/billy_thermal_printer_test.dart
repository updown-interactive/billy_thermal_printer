import 'dart:typed_data';

import 'package:flutter_test/flutter_test.dart';
import 'package:billy_thermal_printer/billy_thermal_printer.dart';
import 'package:billy_thermal_printer/billy_thermal_printer_method_channel.dart';
import 'package:billy_thermal_printer/billy_thermal_printer_platform_interface.dart';
import 'package:billy_thermal_printer/utils/printer.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockBillyThermalPrinterPlatform
    with MockPlatformInterfaceMixin
    implements BillyThermalPrinterPlatform {
  @override
  Future<String?> getPlatformVersion() async => '42';

  @override
  Future<dynamic> startUsbScan() async => [];

  @override
  Future<bool> connect(Printer device) async => true;

  @override
  Future<void> printText(
    Printer device,
    Uint8List data, {
    String? path,
  }) async {}

  @override
  Future<bool> isConnected(Printer device) async => false;

  @override
  Future<dynamic> convertImageToGrayscale(Uint8List? value) async => value;

  @override
  Future<bool> disconnect(Printer device) async => true;

  @override
  Future<void> stopScan() async {}

  @override
  Future<void> getPrinters() async {}
}

void main() {
  final initialPlatform = BillyThermalPrinterPlatform.instance;

  group('BillyThermalPrinterPlatform', () {
    test('MethodChannelBillyThermalPrinter is the default instance', () {
      expect(
        initialPlatform,
        isInstanceOf<MethodChannelBillyThermalPrinter>(),
      );
    });
  });

  group('BillyThermalPrinter', () {
    test('instance returns singleton', () {
      final instance1 = BillyThermalPrinter.instance;
      final instance2 = BillyThermalPrinter.instance;

      expect(identical(instance1, instance2), true);
    });

    test('instance is BillyThermalPrinter type', () {
      expect(
        BillyThermalPrinter.instance,
        isA<BillyThermalPrinter>(),
      );
    });

    test('devicesStream is available', () {
      expect(
        BillyThermalPrinter.instance.devicesStream,
        isA<Stream<List<Printer>>>(),
      );
    });

    test('isBleTurnedOnStream is available', () {
      expect(
        BillyThermalPrinter.instance.isBleTurnedOnStream,
        isA<Stream<bool>>(),
      );
    });
  });

  group('Exports', () {
    test('ConnectionType is exported', () {
      expect(ConnectionType.BLE, isNotNull);
      expect(ConnectionType.USB, isNotNull);
      expect(ConnectionType.NETWORK, isNotNull);
    });

    test('Printer is exported', () {
      final printer = Printer(name: 'Test');
      expect(printer, isA<Printer>());
    });

    test('BillyThermalPrinterNetwork is exported', () {
      final network = BillyThermalPrinterNetwork('192.168.1.1');
      expect(network, isA<BillyThermalPrinterNetwork>());
    });
  });
}

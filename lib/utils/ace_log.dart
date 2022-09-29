import 'package:logger/logger.dart';

///logger
class AceLog {
  static final _logger = Logger(printer: PrettyPrinter(methodCount: 0));

  String? tag;

  static void e({required String? msg}) {
    _logger.e("$msg");
  }

  static void d(String? msg) {
    _logger.d("$msg");
  }

  static void i(String? msg) {
    _logger.i("$msg");
  }

  static void close() {
    _logger.close();
  }
}

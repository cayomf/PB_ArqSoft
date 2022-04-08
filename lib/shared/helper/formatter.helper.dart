import 'package:intl/intl.dart';

class Formatter {
  static String currency(double value, {String symbol = ''}) {
    return NumberFormat.currency(symbol: symbol).format(value);
  }

  static String date(DateTime date, {required String format}) {
    return DateFormat(format, 'pt_BR').format(date);
  }

  static String cpf(String cpf) {
    var numbers = cpf.replaceAll(RegExp(r'[^0-9]'), '');
    if (numbers.length != 11) return cpf;
    return "${numbers.substring(0, 3)}.${numbers.substring(3, 6)}.${numbers.substring(6, 9)}-${numbers.substring(9)}";
  }

  static String cpfObscured(String cpf) {
    if (cpf.length == 11) cpf = Formatter.cpf(cpf);
    cpf = "***${cpf.substring(3, 12)}**";
    return cpf;
  }

  static String cnpj(String cnpj) {
    var numbers = cnpj.replaceAll(RegExp(r'[^0-9]'), '');
    if (numbers.length != 14) return cnpj;
    return "${numbers.substring(0, 2)}.${numbers.substring(2, 5)}.${numbers.substring(5, 8)}/${numbers.substring(8, 12)}-${numbers.substring(12, 14)}";
  }
}

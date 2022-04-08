class Validation {
  static final RegExp emailRegex = RegExp(r"^[a-zA-Z0-9_.+-]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+$");
  static final RegExp cpfRegex = RegExp(r"^\d{3}\d{3}\d{3}\d{2}$");

  /// Valida um email
  static bool isValidEmail(String email) {
    return emailRegex.hasMatch(email);
  }

  /// Valida um cpf
  static bool isValidCpf(String cpf) {
    return cpfRegex.hasMatch(cpf);
  }
}

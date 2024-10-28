class TFormatExceptions implements Exception {
  TFormatExceptions(
      [this.message =
          'An Unexcepted format error occurred. Please check your input. ']);

  factory TFormatExceptions.fromMessage(String message) {
    return TFormatExceptions(message);
  }

  factory TFormatExceptions.fromCode(String code) {
    switch (code) {
      case 'invalid-email-format':
        return TFormatExceptions(
            'The email address format is invalid. Please enter a valid email.');
      default:
        return TFormatExceptions(
            'An unexpected Firebase error occurred. Please try gain');
    }
  }
  final String message;

  String get formattedMessage => message;
}

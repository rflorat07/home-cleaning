class TFirebaseExceptions implements Exception {
  /// Contractors that taken an error code
  TFirebaseExceptions(this.code);

  /// The error code
  final String code;

  /// error message
  String get message {
    switch (code) {
      case 'email-already-in-use':
        return 'The email address is already registered. please use a different message';
      case 'invalid-email':
        return 'The email address is provide is invalid. please enter a valid email';
      case 'weak-password':
        return 'The password is too week. Please choose a wrong password ';
      case 'wrong-password':
        return 'The password is wrong. Please check your password ';
      case 'user-disable':
        return 'The User account has been disabled. Please connect from assistance';
      case 'user-not-found':
        return 'Invalid Login details. User not found';
      case 'invalid-verification-code':
        return 'Invalid Verification code. Please enter a valid code';
      case 'invalid-verification-id':
        return 'Invalid Verification Id. Please enter request a new verification code';
      case 'quote-exceeded':
        return 'Quote exceeded. Please try again later.';
      case 'email-already-exists':
        return 'The email address already exists. Please Use a different mail';
      case ' provide-already-linked':
        return ' The account already linked with another provider';
      case 'requires-recent-login':
        return 'This operation is sensitive and require recent authentication.please log in again';
      case 'credential-already-in-use':
        return 'The credential already associated with different user account';
      default:
        return 'An unexpected Firebase error occurred. Please try gain';
    }
  }
}

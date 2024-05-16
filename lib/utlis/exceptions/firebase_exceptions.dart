class TFirebaseException implements Exception {
  final String code;

  //Constructor
  TFirebaseException(this.code);

  String get message {
    switch (code) {
      case 'unknown':
        return 'An unknown Firebase error occured. please try again.';

      case 'invalid-customer-token':
        return 'The custome format token is incorrect. please check your custom token';

      case 'custom-token-mismatch':
        return 'the custom token corresponds to  diffirent audience';

      case 'User Disabled':
        return 'The user account is disabled';

      case 'user not found':
        return 'no user found for the gmail or UID';

      case 'invalid email':
        return 'the email adrress provided is invalid. please enter a valid email';

      case 'email already in use':
        return 'the email adress is already is registered. please use a diffirent emailllll.';

      case 'Wrong password':
        return 'InCorrect password. please check your password and try again.';

      case 'Weak password':
        return 'The weak is too weak. please choose a Stronger password';

      case 'Provider already linked':
        return 'The account is already linked with another provider';

      case 'operation-not-allowed':
        return 'This operation is not allowed.Contact support for assistance';

      case 'invalid-credential':
        return 'the supplied credential is malformed or has expired';

      case 'invalid verfication-code':
        return 'Invalid verfication code.Please enter a valid code';

      case 'invalid-verification-id':
        return 'Invalid verification ID. Please request a new verification code.';

      case 'captcha-check-failed':
        return 'The reCAPTCHA response is invalid. Please try again.';

      case 'app-not-authorized':
        return 'The app is not authorized to use Firebase Authentication with the provided API key.';

      case 'keychain-error':
        return 'A keychain error occurred. Please check the keychain and try again.';

      case 'internal-error':
        return 'An internal authentication error occurred. Please try again later.';

      case 'invalid-app-credential':
        return 'The app credential is invalid. Please provide a valid app credential.';

      case 'user-mismatch':
        return 'The supplied credentials do not correspond to the previously signed-in user.';

      case 'requires-recent-login':
        return 'This operation is sensitive and requires recent authentication. Please log in again.';

      case 'quota-exceeded':
        return 'Quota exceeded. Please try again later.';

      case 'account-exists-with-different-credential':
        return 'An account already exists with the same email but different sign-in credentials.';

      case 'missing-iframe-start':
        return 'The email template is missing the iframe start tag.';

      case 'missing-iframe-end':
        return 'The email template is missing the iframe end tag.';

      case 'missing-iframe-sro':
        return 'The email template is missing the iframe src attribute.';

      case 'missing-app-credential':
        return 'The app credential is missing. Please provide valid app credentials.';
        
      case 'session-cookie-expired':
        return 'The Firebase session cookie has expired. Please sign in again.';

      case 'uid-already-exists':
        return 'The provided user ID is already in use by another user.';

      case 'web-storage-unsupported':
        return 'Web storage is not supported or is disabled.';

      case 'app-deleted':
        return 'This instance of FirebaseApp has been deleted. ';

      case 'user-token-mismatch':
        return 'The provided user\'s token has a mismatch with the authenticated user\'s user ID.';

      case 'invalid-message-payload':
        return 'The email template verification message payload is invalid.';

      case 'invalid-sender':
        return 'The email template sender is invalid. Please verify the sender\'s email.';
        
      case 'invalid-recipient-email':
        return 'The recipient email address is invalid. Please provide a valid recipient email.';

      case 'missing-action-code':
        return 'The action code is missing. Please provide a valid action code.';

      case 'user-token-expired':
        return 'The user\'s token has expired, and authentication is required. Please sign in again.';

      case 'INVALID_LOGIN_CREDENTIALS':
        return 'Invalid login credentials.';

      case 'expired-action-code':
        return 'The action code has expired. Please request a new action code.';

      case 'invalid-action-code':
        return 'The action code is invalid. Please check the code and try again.';

      case 'credential-already-in-use':
        return 'This credential is already associated with a different user account.';

      default:
        return 'An unexpected Firebase error occurred. Please try again.';
    }
  }
}
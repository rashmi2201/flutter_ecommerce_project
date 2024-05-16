class TFirebaseAuthException implements Exception {
  //the error code assoociated with the exception
  final String code;

  //Constructor that takes on error code
  TFirebaseAuthException(this.code);

  //get the correspondinmg error meesage based on the error code.
  String get message {
    switch (code) {
      case 'email-already-in-use':
        return 'The email address is already registered. Please use a different email.';
       
       case 'invalid-email':
        return 'The email adddress provided is invalid. Please enter a valid email.';
      
      case 'weak-password':
        return 'The password is too weak. Please choose a stronger password.';
      
      case 'user-disabled':
        return 'This user account has been disabled.Please contact for assistance';
     
      case 'user-not-found':
        return 'Invalid login details.user not found.';
      
      case 'wrong-password':
        return 'Incorrect password.Please check your password and try again';
      
      case 'invalid -verfication-code':
        return 'Invalid verfication code.Please enter a valid code';
      
      case 'invalid -verfication-id ':
        return 'Invalid verfication ID. Please request a new verfication code';
      
      case 'quota-exceeded':
        return 'Quota-exceeded.Please try again later.';
      
      case 'email-already-exists':
        return 'The email address alreday exists.Please use a different email.';
      
      case 'provider-already-linked':
        return 'The account is already linked with another provider.';
      
      case 'requires-recent-linked':
        return 'This operation is sensitive and requires recent authentication.Please log in again.';
      
      case 'credential-already-in-use':
        return 'This credential is already associated with a different user account.';
      
      case 'user-mismatch':
        return 'The supplied credential do not correspond to the previously signed in user.';
      
      case 'account-exists-with different-credential':
        return 'An account already exists with the same email but different sign-in credential.';
      
      case 'operation-not-allowed':
        return 'This operation is not allowed.Contact support for assistance';
      
      case 'expired-cation-code':
        return 'this action code has expired.Please request a new action code';
      
      case 'invalid action code':
        return 'The action code is invalid.Please check the code and try again';
      
      case 'missing-action-code':
        return 'the cation code is missing.Please provide a valid action code';
      
      case 'user-token-expired':
        return 'The user\'s token has expired ,and authentication is required.Please sign in again';
      
      case 'user-not-found':
        return 'No user found for the given email or UID.';
      
      case 'invalid-credential':
        return 'the supplied credential is malformed or has expired';
      
      case 'wrong-password':
        return 'The password is invalid.Please check your password and try again';
      
      case 'user-token-revoked':
        return 'The user\'s token has been revoked.Please sign in again.';
      
      case 'invalid-message-payload':
        return 'The email template verfication message payload is invalid.';
      
      case 'invalid-sender':
        return 'the email template ender is inavlid.Please verify the sender\'s email.';
      
      case 'invalid-recipient-email':
        return 'The recipient email address is invalid.Please provide a valid recipient address';
      
      default:
        return 'An error occured';
    }
  }
}

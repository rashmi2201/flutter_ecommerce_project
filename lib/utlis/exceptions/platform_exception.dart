class TPlatformExceptions implements Exception{
  final String code;
    TPlatformExceptions(this.code);
  
  String get message {
    switch (code) {
      
      case 'invalid-login-credential':
        return 'Invalid login credentails. please double check your information';

         case 'too many requests':
        return 'too many requests, please try again later';

         case 'invalid argument':
        return 'Invalid argument provided to the authentication method';

         case 'invalid password':
        return 'Invalid password. please try again';

         case 'invalid phone number':
        return 'Invalid phone number';

        case 'operation-not-allowed':
        return 'This operation is not allowed.Contact support for assistance';

        case 'session cookie expired':
        return 'This operation is not allowed.Contact support for assistance';

        case 'Uid Already exists':
        return 'The provided user id is already in use by another user';

         case 'Sign in failed':
        return 'Sign in failed. please try again';

        case 'Network requests failed':
        return 'Network requests failed. please try again';

        case 'internal error':
        return 'internal error, please try again ';

        case 'invalid verfication-code':
        return 'Invalid verfication code.Please enter a valid code';


      default:
        return 'An error occured';
    }
  }
}
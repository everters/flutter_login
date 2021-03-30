import 'package:flutter/material.dart';

import '../../flutter_login.dart';
import '../models/login_data.dart';

enum AuthMode { Signup, Login }

/// The result is an error message, callback successes if message is null
typedef AuthCallback = Future<String> Function(dynamic);

/// The result is an error message, callback successes if message is null
typedef ProviderAuthCallback = Future<String> Function();

/// The result is an error message, callback successes if message is null
typedef RecoverCallback = Future<String> Function(String);

class Auth with ChangeNotifier {
  Auth({
    this.loginProviders,
    this.onLogin,
    this.onSignup,
    this.onRecoverPassword,
    String email = '',
    String password = '',
    String confirmPassword = '',
    String firstName = '',
    String familyName = ''
  })  : _email = email,
        _password = password,
        _confirmPassword = confirmPassword,
        _firstName = firstName,
        _familyName = familyName
  ;

  final AuthCallback onLogin;
  final AuthCallback onSignup;
  final RecoverCallback onRecoverPassword;
  final List<LoginProvider> loginProviders;

  AuthMode _mode = AuthMode.Login;

  AuthMode get mode => _mode;
  set mode(AuthMode value) {
    _mode = value;
    notifyListeners();
  }

  bool get isLogin => _mode == AuthMode.Login;
  bool get isSignup => _mode == AuthMode.Signup;
  bool isRecover = false;

  AuthMode opposite() {
    return _mode == AuthMode.Login ? AuthMode.Signup : AuthMode.Login;
  }

  AuthMode switchAuth() {
    if (mode == AuthMode.Login) {
      mode = AuthMode.Signup;
    } else if (mode == AuthMode.Signup) {
      mode = AuthMode.Login;
    }
    return mode;
  }

  String _email = '';
  String get email => _email;
  set email(String email) {
    _email = email;
    notifyListeners();
  }

  String _password = '';
  String get password => _password;
  set password(String password) {
    _password = password;
    notifyListeners();
  }

  String _confirmPassword = '';
  String get confirmPassword => _confirmPassword;
  set confirmPassword(String confirmPassword) {
    _confirmPassword = confirmPassword;
    notifyListeners();
  }

  String _firstName = '';
  String get firstName => _firstName;
  set firstName(String firstName) {
    _firstName = firstName;
    notifyListeners();
  }

  String _familyName = '';
  String get familyName => _familyName;
  set familyName(String familyName) {
    _familyName = familyName;
    notifyListeners();
  }
}

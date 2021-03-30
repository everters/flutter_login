import 'package:flutter/foundation.dart';
import 'package:quiver/core.dart';

class SignupData {
  final String name;
  final String password;
  final String firstName;
  final String familyName;

  SignupData({
    @required this.name,
    @required this.password,
    @required this.firstName,
    @required this.familyName
  });

  @override
  String toString() {
    return '$runtimeType($name, $password, $firstName, $familyName)';
  }

  @override
  bool operator ==(Object other) {
    if (other is SignupData) {
      return name == other.name && password == other.password && firstName == other.firstName && familyName == other.familyName;
    }
    return false;
  }

  @override
  int get hashCode => hash2(name, password);
}

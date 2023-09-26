/// Checks if password has [minLength]
bool hasMinLength(String password, int minLength) {
  if (password.length >= minLength) {
    return true;
  } else {
    return false;
  }
}

/// Checks if password has [maxLength]
bool hasMaxLength(String password, int maxLength) {
  if (password.length <= maxLength) {
    return true;
  } else {
    return false;
  }
}

/// Email regex expression
final RegExp emailRegExp = RegExp(
  r'^(([^<>()\[\]\\.,;:\s@"]+(\.[^<>()\[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$',
);

/// First Name regex expression
final RegExp firstNameRegExp = RegExp(r'^[a-zA-Z\s]{1,255}$');

/// Last Name regex expression
final RegExp lastNameRegExp = RegExp(r'^[a-zA-Z\s]{1,255}$');

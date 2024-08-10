String? validator(String? value, String type) {
  if (value == null || value.isEmpty) {
    return 'This field is required';
  }
  switch (type) {
    case 'name':
      if (value.length <= 2) {
        return 'Username should be at least 3 characters long';
      }
      break;
    case 'username':
      if (value.length != value.replaceAll(' ', '').length) {
        return 'Username must not contain any spaces';
      }
      if (int.tryParse(value[0]) != null) {
        return 'Username must not start with a number';
      }
      if (value.length <= 2) {
        return 'Username should be at least 3 characters long';
      }
      break;
    case 'email':
      final emailRegExp = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
      if (!emailRegExp.hasMatch(value)) {
        return 'Enter a valid email address';
      }
      break;
    case 'password':
      if (value.length < 8) {
        return 'Password should be at least 8 characters long';
      }
      break;

    default:
  }
  return null;
}

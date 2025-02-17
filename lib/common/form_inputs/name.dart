import 'package:formz/formz.dart';

enum NameValidationError { invalid }

class Name extends FormzInput<String, String> {
  const Name.pure() : super.pure('');

  const Name.dirty([super.value = '']) : super.dirty();

  @override
  String? validator(String? value) {
    return value == null || value.isEmpty ? 'Name is required' : null;
  }
}

import 'package:freezed_annotation/freezed_annotation.dart';
part 'login_freezed.freezed.dart';

@freezed
class LoginObject with _$LoginObject{
  const factory LoginObject(String email, String password) = _LoginObject;
}

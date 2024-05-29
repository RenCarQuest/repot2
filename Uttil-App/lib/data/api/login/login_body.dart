import 'package:freezed_annotation/freezed_annotation.dart';

part 'login_body.g.dart';

@JsonSerializable()
class LoginBody {
  LoginBody({
    required this.email,
    required this.password,
  });

  String email;
  String password;

  factory LoginBody.fromJson(Map<String, dynamic> json) => _$LoginBodyFromJson(json);
  Map<String, dynamic> toJson() => _$LoginBodyToJson(this);
}

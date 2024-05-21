import 'package:freezed_annotation/freezed_annotation.dart';

part 'register_body.g.dart';

@JsonSerializable()
class Register {
  Register({
    required this.name,
    required this.email,
    required this.password,
  });

  String name;
  String email;
  String password;

  factory Register.fromJson(Map<String, dynamic> json) => _$RegisterFromJson(json);
  Map<String, dynamic> toJson() => _$RegisterToJson(this);
}

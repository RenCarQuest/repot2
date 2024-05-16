import 'package:freezed_annotation/freezed_annotation.dart';

part 'faq_model.freezed.dart';

@freezed
class FaqModel with _$FaqModel {
  const factory FaqModel({
    required String title,
    required String description,
  }) = _FaqModel;
}

import 'package:uttil/domain/models/faq/faq_model.dart';
import 'package:uttil/domain/repositories/faq/faq_repository.dart';
import 'package:flutter/widgets.dart';
import 'package:injectable/injectable.dart';
import '../../../core/utils/results.dart';

@lazySingleton
class GetFaqsUseCase {
  GetFaqsUseCase(this._faqRepository);

  final FaqRepository _faqRepository;

  Future<Result<List<FaqModel>>> invoke(BuildContext context) {
    return _faqRepository.getFaq(context);
  }
}

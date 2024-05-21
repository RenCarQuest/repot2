import '../../../core/utils/results.dart';
import '../../../domain/models/faq/faq_model.dart';
import '../../../domain/repositories/faq/faq_repository.dart';
import 'package:flutter/widgets.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class GetFaqsUseCase {
  GetFaqsUseCase(this._faqRepository);

  final FaqRepository _faqRepository;

  Future<Result<List<FaqModel>>> invoke(BuildContext context) {
    return _faqRepository.getFaq(context);
  }
}

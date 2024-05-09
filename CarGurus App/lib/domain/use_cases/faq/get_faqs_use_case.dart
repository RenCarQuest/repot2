import 'package:carguru/domain/models/faq/faq_model.dart';
import 'package:carguru/domain/repositories/faq/faq_repository.dart';
import 'package:injectable/injectable.dart';
import '../../../core/utils/results.dart';

@lazySingleton
class GetFaqsUseCase {
  GetFaqsUseCase(this._faqRepository);

  final FaqRepository _faqRepository;

  Future<Result<List<FaqModel>>> invoke() {
    return _faqRepository.getFaq();
  }
}

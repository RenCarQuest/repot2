import 'package:carguru/core/utils/results.dart';
import 'package:carguru/data/data_sources/faq/faq_data_source.dart';
import 'package:carguru/domain/models/faq/faq_model.dart';
import 'package:carguru/domain/repositories/faq/faq_repository.dart';

class FaqRepositoryImpl implements FaqRepository {
  FaqRepositoryImpl(this._faqDataSource);

  final FaqDataSource _faqDataSource;

  @override
  Future<Result<List<FaqModel>>> getFaq() {
    return _faqDataSource.getFaq().then((result) {
      return result;
    });
  }
}

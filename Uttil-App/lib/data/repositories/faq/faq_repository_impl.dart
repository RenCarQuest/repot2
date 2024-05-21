import '../../../core/utils/results.dart';
import '../../../data/data_sources/faq/faq_data_source.dart';
import '../../../domain/models/faq/faq_model.dart';
import '../../../domain/repositories/faq/faq_repository.dart';
import 'package:flutter/widgets.dart';

class FaqRepositoryImpl implements FaqRepository {
  FaqRepositoryImpl(this._faqDataSource);

  final FaqDataSource _faqDataSource;

  @override
  Future<Result<List<FaqModel>>> getFaq(BuildContext context) {
    return _faqDataSource.getFaq(context).then((result) {
      return result;
    });
  }
}

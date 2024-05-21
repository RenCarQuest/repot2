import '../../../core/utils/results.dart';
import '../../../data/data_sources/faq/faq_data_source.dart';
import '../../../data/repositories/faq/faq_repository_impl.dart';
import '../../../domain/models/faq/faq_model.dart';
import 'package:flutter/widgets.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
abstract class FaqRepository {
  Future<Result<List<FaqModel>>> getFaq(BuildContext context);

  @factoryMethod
  static FaqRepository create({
    required final FaqDataSource faqDataSource,
  }) =>
      FaqRepositoryImpl(faqDataSource);
}

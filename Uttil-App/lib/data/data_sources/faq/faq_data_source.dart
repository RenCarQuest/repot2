import 'package:uttil/data/data_sources/faq/faq_data_source_impl.dart';
import 'package:uttil/domain/models/faq/faq_model.dart';
import 'package:flutter/widgets.dart';
import 'package:injectable/injectable.dart';
import '../../../core/utils/results.dart';

@lazySingleton
abstract class FaqDataSource {
  Future<Result<List<FaqModel>>> getFaq(BuildContext context);

  @factoryMethod
  static FaqDataSource create() => FaqDataSourceImpl();
}

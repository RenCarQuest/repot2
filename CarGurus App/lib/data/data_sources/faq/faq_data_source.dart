import 'package:carguru/data/data_sources/faq/faq_data_source_impl.dart';
import 'package:carguru/domain/models/faq/faq_model.dart';
import 'package:injectable/injectable.dart';
import '../../../core/utils/results.dart';

@lazySingleton
abstract class FaqDataSource {
  Future<Result<List<FaqModel>>> getFaq();

  @factoryMethod
  static FaqDataSource create() => FaqDataSourceImpl();
}

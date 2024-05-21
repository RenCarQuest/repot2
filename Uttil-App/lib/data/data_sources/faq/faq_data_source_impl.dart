import 'package:uttil/core/l10n/extensions/app_localizations_context.dart';
import 'package:uttil/core/utils/results.dart';
import 'package:uttil/data/data_sources/faq/faq_data_source.dart';
import 'package:uttil/domain/models/faq/faq_model.dart';
import 'package:flutter/widgets.dart';

class FaqDataSourceImpl implements FaqDataSource {
  FaqDataSourceImpl();

  @override
  Future<Result<List<FaqModel>>> getFaq(BuildContext context) {
    return _mockData(context);
  }

  Future<Result<List<FaqModel>>> _mockData(BuildContext context) async {
    return Future(() => Result.success([
          FaqModel(
            title: context.localization.faqTitle1,
            description: context.localization.faqAnswer1,
          ),
          FaqModel(
            title: context.localization.faqTitle2,
            description: context.localization.faqAnswer2,
          ),
          FaqModel(
            title: context.localization.faqTitle3,
            description: context.localization.faqAnswer3,
          ),
          FaqModel(
            title: context.localization.faqTitle4,
            description: context.localization.faqAnswer4,
          ),
          FaqModel(
            title: context.localization.faqTitle5,
            description: context.localization.faqAnswer5,
          ),
          FaqModel(
            title: context.localization.faqTitle6,
            description: context.localization.faqAnswer6,
          ),
          FaqModel(
            title: context.localization.faqTitle7,
            description: context.localization.faqAnswer7,
          ),
          FaqModel(
            title: context.localization.faqTitle8,
            description: context.localization.faqAnswer8,
          ),
          FaqModel(
            title: context.localization.faqTitle9,
            description: context.localization.faqAnswer9,
          ),
        ]));
  }
}

import '../../../domain/models/faq/faq_model.dart';
import '../../../domain/use_cases/faq/get_faqs_use_case.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:flutter/widgets.dart';

part 'faq_state.dart';
part 'faq_cubit.freezed.dart';

@injectable
class FaqCubit extends Cubit<FaqState> {
  FaqCubit(this._getFaqsUseCase) : super(FaqState.initial());

  final GetFaqsUseCase _getFaqsUseCase;
  List<FaqModel> searchFaqs = [];
  List<FaqModel> originalFaqs = [];

  void onQueryChanged(String query) {
    if (query.isEmpty) {
      emit(state.copyWith(faqs: originalFaqs));
      return;
    }

    searchFaqs = state.faqs
        .where((item) => item.title.toLowerCase().contains(query.toLowerCase()))
        .toList();

    emit(state.copyWith(faqs: searchFaqs));
  }

  Future<void> getFaqs(BuildContext context) async {
    emit(state.copyWith(isLoading: true));
    final result = await _getFaqsUseCase.invoke(context);
    if (result.isFailure) {
      emit(state.copyWith(
        errorMessage: result.error.toString(),
        isLoading: false,
      ));
    } else {
      originalFaqs = result.data!;
      emit(state.copyWith(
        isLoading: false,
        faqs: result.data!,
        errorMessage: null,
      ));
    }
  }
}

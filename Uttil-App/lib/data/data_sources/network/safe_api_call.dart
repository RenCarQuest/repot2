import '../../../core/utils/results.dart';

Future<Result<T>> safeApiCall<T>({required final Future<T> call}) async {
  try {
    return Result.success(await call);
  } catch (e) {
    return Result.failure(FormatException(e.toString()));
  }
}

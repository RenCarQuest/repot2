import 'package:equatable/equatable.dart';

/// This abstraction contains either a success data of generic type `S` or a
/// failure error of type `Failure` as its result.
///
/// `data` property must only be retrieved when `DataResult` was constructed by
/// using `Result.success(value)`. It can be validated by calling
/// `isSuccess` first. Alternatively, `dataOrElse` can be used instead since it
/// ensures a valid value is returned in case the result is a failure.
///
/// `error` must only be retrieved when `Result` was constructed by using
/// `Result.failure(error)`. It can be validated by calling `isFailure`
/// first.
abstract class Result<S> extends Equatable {
  static Result<S> failure<S>(Exception failure) => _FailureResult(failure);
  static Result<S> success<S>(S data) => _SuccessResult(data);

  /// Get [error] value, returns null when the value is actually [data]
  Exception? get error => fold<Exception?>((error) => error, (data) => null);

  /// Get [data] value, returns null when the value is actually [error]
  S? get data => fold<S?>((error) => null, (data) => data);

  /// Returns `true` if the object is of the `SuccessResult` type, which means
  /// `data` will return a valid result.
  bool get isSuccess => this is _SuccessResult<S>;

  /// Returns `true` if the object is of the `FailureResult` type, which means
  /// `error` will return a valid result.
  bool get isFailure => this is _FailureResult<S>;

  /// Returns `data` if `isSuccess` returns `true`, otherwise it returns
  /// `other`.
  S dataOrElse(S other) => isSuccess && data != null ? data! : other;

  /// Sugar syntax that calls `dataOrElse` under the hood. Returns left value if
  /// `isSuccess` returns `true`, otherwise it returns the right value.
  S operator |(S other) => dataOrElse(other);

  /// Transforms values of [error] and [data] in new a `Result` type. Only
  /// the matching function to the object type will be executed. For example,
  /// for a `SuccessResult` object only the [fnData] function will be executed.
  Result<T> either<T>(Exception Function(Exception error) fnFailure, T Function(S data) fnData);

  /// Transforms value of [data] allowing a new `Result` to be returned.
  /// A `SuccessResult` might return a `FailureResult` and vice versa.
  Result<T> then<T>(Result<T> Function(S data) fnData);

  /// Transforms value of [data] always keeping the original identity of the
  /// `Result`, meaning that a `SuccessResult` returns a `SuccessResult` and
  /// a `FailureResult` always returns a `FailureResult`.
  Result<T> map<T>(T Function(S data) fnData);

  /// Folds [error] and [data] into the value of one type. Only the matching
  /// function to the object type will be executed. For example, for a
  /// `SuccessResult` object only the [fnData] function will be executed.
  T fold<T>(T Function(Exception error) fnFailure, T Function(S data) fnData);

  @override
  List<Object?> get props => [if (isSuccess) data else error];
}

/// Success implementation of `Result`. It contains `data`. It's abstracted
/// away by `Result`. It shouldn't be used directly in the app.
class _SuccessResult<S> extends Result<S> {
  final S _value;

  _SuccessResult(this._value);

  @override
  _SuccessResult<T> either<T>(Exception Function(Exception error) fnFailure, T Function(S data) fnData) {
    return _SuccessResult<T>(fnData(_value));
  }

  @override
  Result<T> then<T>(Result<T> Function(S data) fnData) {
    return fnData(_value);
  }

  @override
  _SuccessResult<T> map<T>(T Function(S data) fnData) {
    return _SuccessResult<T>(fnData(_value));
  }

  @override
  T fold<T>(T Function(Exception error) fnFailure, T Function(S data) fnData) {
    return fnData(_value);
  }
}

/// Failure implementation of `Result`. It contains `exception`.  It's
/// abstracted away by `Result`. It shouldn't be used directly in the app.
class _FailureResult<S> extends Result<S> {
  final Exception _value;

  _FailureResult(this._value);

  @override
  _FailureResult<T> either<T>(Exception Function(Exception error) fnFailure, T Function(S data) fnData) {
    return _FailureResult<T>(fnFailure(_value));
  }

  @override
  _FailureResult<T> map<T>(T Function(S data) fnData) {
    return _FailureResult<T>(_value);
  }

  @override
  _FailureResult<T> then<T>(Result<T> Function(S data) fnData) {
    return _FailureResult<T>(_value);
  }

  @override
  T fold<T>(T Function(Exception error) fnFailure, T Function(S data) fnData) {
    return fnFailure(_value);
  }
}

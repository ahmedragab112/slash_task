import 'package:freezed_annotation/freezed_annotation.dart';
part 'firbase_response.freezed.dart';

@Freezed()
abstract class FirbaseResponse<T> with _$FirbaseResponse<T> {
  const factory FirbaseResponse.data(T data) = Success<T>;
  const factory FirbaseResponse.error({required String error}) = Fail<T>;
}

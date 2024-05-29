import 'package:freezed_annotation/freezed_annotation.dart';

part 'car_dto.g.dart';
part 'car_dto.freezed.dart';

@freezed
abstract class CarDto with _$CarDto {
  const factory CarDto({
    required String? id,
    required String? brand,
    required String? model,
    required int year,
    required String? color,
    required String? transmissionType,
    required String? fuelType,
    required int passengerCapacity,
    required int rentalPricePerDay,
    required bool availability,
    required String? licensePlate,
    required List<String> images,
    required String? description,
    required String? typeOfUse,
    required int? mileage,
    required String? carType,
    required String? drivetrain,
    required String? fuelPolicy
  }) = _CarDto;

  const CarDto._();

  factory CarDto.fromJson(Map<String, dynamic> json) => _$CarDtoFromJson(json);
}

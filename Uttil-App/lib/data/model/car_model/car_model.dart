import '../../dtos/car_list/car_dto.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'car_model.freezed.dart';

@freezed
class CarModel with _$CarModel {
  const factory CarModel({
    required String id,
    required String brand,
    required String model,
    required int year,
    required String color,
    required String transmissionType,
    required String fuelType,
    required int passengerCapacity,
    required int rentalPricePerDay,
    required bool availability,
    required String licensePlate,
    required List<String> images,
    required String? description,
    required String typeOfUse,
    required int mileage,
    required String carType,
    required String drivetrain,
    required String fuelPolicy
  }) = _CarModel;

  factory CarModel.fromDto({required final CarDto car}) {
    return CarModel(
      id: car.id ?? '',
      brand: car.brand ?? '',
      model: car.model ?? '',
      year: car.year,
      color: car.color ?? '',
      transmissionType: car.transmissionType ?? '',
      fuelType: car.fuelType ?? '',
      passengerCapacity: car.passengerCapacity,
      rentalPricePerDay: car.rentalPricePerDay,
      availability: car.availability,
      licensePlate: car.licensePlate ?? '',
      images: car.images,
      description: car.description,
      typeOfUse: car.typeOfUse ?? '',
      mileage: car.mileage ?? 0,
      carType: car.carType ?? '',
      drivetrain: car.drivetrain ?? '',
      fuelPolicy: car.fuelPolicy ?? '',
    );
  }
}

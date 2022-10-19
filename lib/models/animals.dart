import 'package:flutter/foundation.dart' show immutable;
import 'package:rxpractice/models/things.dart';

enum AnimalType { cats, dogs, rabbit, unknown }

@immutable
class Animals extends Things {
  final AnimalType type;

  const Animals({
    required String name,
    required this.type,
  }) : super(name: name);

  @override
  String toString() => 'Animal, name: $name, type: $type';

  factory Animals.fromJson(Map<String, dynamic> json) {
    final AnimalType animalType;
    switch ((json["type"] as String).toLowerCase().trim()) {
      case "rabbit":
        animalType = AnimalType.rabbit;

        break;
      case "cat":
        animalType = AnimalType.rabbit;

        break;
      case "dog":
        animalType = AnimalType.rabbit;

        break;
      default:
        animalType = AnimalType.unknown;
    }
    return Animals(name: json["name"] as String, type: animalType);
  }
}

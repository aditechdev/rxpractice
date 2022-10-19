import 'dart:convert';
import 'dart:io';

import 'package:rxpractice/models/animals.dart';
import 'package:rxpractice/models/person.dart';
import 'package:rxpractice/models/things.dart';

typedef SearchTerm = String;

class Api {
  List<Animals>? _animals;
  List<Person>? _person;

  Api();

  List<Things>? _extractThingsUsingSearchTerm(SearchTerm searchTerm) {
    final cachedAnimal = _animals;
    final cachedPerson = _person;

    if (cachedAnimal != null && cachedPerson != null) {
      List<Things> results = [];

      // go through animal
      for (var animal in cachedAnimal) {
        if (animal.name.trimmedContains(searchTerm) ||
            (animal.type.name.trimmedContains(searchTerm))) {
          results.add(animal);
        }
      }

      // go through person
      for (var person in cachedPerson) {
        if (person.name.trimmedContains(searchTerm) ||
            person.age.toString().trimmedContains(searchTerm)) {
          results.add(person);
        }
      }
      return results;
    } else {
      return null;
    }
  }

  Future<List<dynamic>> _getJson(String url) => HttpClient()
      .getUrl(Uri.parse(url))
      .then((req) => req.close())
      .then((response) => response.transform(utf8.decoder).join())
      .then((jsonString) => json.decode(jsonString) as List<dynamic>);
}

extension TrimCaseInsestiveContaine on String {
  bool trimmedContains(String other) => trim().toLowerCase().contains(
        other.trim().toLowerCase(),
      );
}

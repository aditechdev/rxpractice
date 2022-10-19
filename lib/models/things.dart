import 'package:flutter/foundation.dart' show immutable;

@immutable
class Things {
  final String name;

  const Things({
    required this.name,
  });
}

import 'package:collection/collection.dart';

String enumToString(Object o) => o.toString().split('.').last;

T? enumFromString<T extends Object>(String key, List<T> values) =>
    values.firstWhereOrNull((element) => enumToString(element) == key);

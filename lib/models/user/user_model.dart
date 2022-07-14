import 'package:equatable/equatable.dart';
import 'package:nsu_cab/common/enums/enums.dart';

class UserModel extends Equatable {
  final int id;
  final String name;
  final String surname;
  final String patronymic;
  final List<UserRole> roles;
  final String? groupName;

  UserModel({
    required this.id,
    required this.name,
    required this.surname,
    required this.patronymic,
    required this.roles,
    this.groupName,
  });

  UserModel copyWith({
    int? id,
    String? name,
    String? surname,
    String? patronymic,
    List<UserRole>? roles,
    String? groupName,
  }) =>
      UserModel(
        id: id ?? this.id,
        name: name ?? this.name,
        surname: surname ?? this.surname,
        patronymic: patronymic ?? this.patronymic,
        roles: roles ?? this.roles,
        groupName: groupName ?? this.groupName,
      );

  @override
  List<Object?> get props => [
        id,
        name,
        surname,
        patronymic,
        roles,
        groupName,
      ];
}

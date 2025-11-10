import 'package:hive/hive.dart';
part 'team_entity.g.dart';

@HiveType(typeId: 0)
class TeamEntity {
  @HiveField(0)
  final int id;

  @HiveField(1)
  final String name;

  @HiveField(2)
  final String logo;

  TeamEntity({required this.id, required this.name, required this.logo});
}
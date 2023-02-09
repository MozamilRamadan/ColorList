import 'package:hive/hive.dart';

part 'color_list.g.dart';

@HiveType(typeId: 0)
class ColorList{

  @HiveField(0)
  final String? name;

  @HiveField(1)
  final String? code;

  ColorList({required this.name, required this.code});

}
// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:isar/isar.dart';

part 'favorite.g.dart';

@collection
class Favorite {
  Id id = Isar.autoIncrement;

  /// [ContentTypes] type
  late String type;

  /// Ayet numarası
  late int number;

  /// Arapça
  String? text1;

  /// Arapça okunuş
  String? text2;

  /// Türkçe meal
  String? text3;

  /// Klasör ismi
  @Index(unique: true)
  late String folder;
}

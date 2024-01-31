import 'package:dini_atlas/ui/common/constants/constants.dart';
import 'package:flutter/widgets.dart';

class CategoryItem {
  final String id;
  final String name;
  final String image;
  final Color color;

  CategoryItem({
    required this.id,
    required this.name,
    required this.image,
    required this.color,
  });
}

final List<CategoryItem> categoryItems = [
  CategoryItem(
    id: "pusula",
    name: "Pusula",
    image: kiCompass,
    color: kcListCardColors[0],
  ),
  CategoryItem(
    id: "favoriler",
    name: "Favoriler",
    image: kiFolder,
    color: kcListCardColors[1],
  ),
  CategoryItem(
    id: "kaza",
    name: "Kaza\nÇetelesi",
    image: kiKaza,
    color: kcListCardColors[2],
  ),
  CategoryItem(
    id: "tesbihat",
    name: "Tesbihat",
    image: kiRosary,
    color: kcListCardColors[3],
  ),
  CategoryItem(
    id: "dini_gunler",
    name: "Dini Günler",
    image: kiCalendar,
    color: kcListCardColors[4],
  ),
  CategoryItem(
    id: "40_hadis",
    name: "40 Hadis",
    image: kiBook,
    color: kcListCardColors[5],
  ),
  CategoryItem(
    id: "camiler",
    name: "Yakındaki\nCamiler",
    image: kiMosqueSvg,
    color: kcListCardColors[6],
  ),
  CategoryItem(
    id: "radyolar",
    name: "Canlı\nRadyolar",
    image: kiRadio,
    color: kcListCardColors[7],
  ),
  CategoryItem(
    id: "hadisler",
    name: "Riyâzu's\nSâlihîn",
    image: kiPaper,
    color: kcListCardColors[8],
  ),
  CategoryItem(
    id: "esmaul_husna",
    name: "Esma’ül\nHüsna",
    image: kiEsmaulHusna,
    color: kcListCardColors[9],
  ),
  CategoryItem(
    id: "dualar",
    name: "Duâlar",
    image: kiPray,
    color: kcListCardColors[10],
  ),
  CategoryItem(
    id: "cuz",
    name: "Elif Bâ",
    image: kiBook2,
    color: kcListCardColors[11],
  ),
];

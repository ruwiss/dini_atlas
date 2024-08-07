import 'package:dini_atlas/app/app.router.dart';
import 'package:dini_atlas/ui/common/constants/constants.dart';
import 'package:flutter/widgets.dart';

class CategoryItem {
  final String id;
  final String name;
  final String image;
  final Color color;
  final String route;

  CategoryItem({
    required this.id,
    required this.name,
    required this.image,
    required this.color,
    required this.route,
  });
}

final List<CategoryItem> categoryItems = [
  CategoryItem(
    id: "kaza",
    name: "Kaza\nÇetelesi",
    image: kiKaza,
    color: kcListCardColors[2],
    route: Routes.kazaView,
  ),
  CategoryItem(
    id: "tesbihat",
    name: "Tesbihat",
    image: kiRosary,
    color: kcListCardColors[3],
    route: Routes.rosaryView,
  ),
  CategoryItem(
    id: "pusula",
    name: "Pusula",
    image: kiCompass,
    color: kcListCardColors[0],
    route: Routes.compassView,
  ),
  CategoryItem(
    id: "favoriler",
    name: "Favoriler",
    image: kiFolder,
    color: kcListCardColors[1],
    route: Routes.favouritesView,
  ),
  CategoryItem(
    id: "dini_gunler",
    name: "Dini Günler",
    image: kiCalendar,
    color: kcListCardColors[4],
    route: Routes.religiousDaysView,
  ),
  CategoryItem(
    id: "40_hadis",
    name: "40 Hadis",
    image: kiBook,
    color: kcListCardColors[5],
    route: Routes.fortyHadithsView,
  ),
  CategoryItem(
    id: "hadisler",
    name: "Riyâzu's\nSâlihîn",
    image: kiPaper,
    color: kcListCardColors[8],
    route: Routes.riyazusSalihinView,
  ),
  CategoryItem(
    id: "yasin",
    name: "Yasin-i\nŞerif",
    image: kiPaper,
    color: kcListCardColors[6],
    route: Routes.yasinView,
  ),
  CategoryItem(
    id: "radyolar",
    name: "Canlı\nRadyolar",
    image: kiRadio,
    color: kcListCardColors[7],
    route: Routes.radioView,
  ),
  CategoryItem(
    id: "esmaul_husna",
    name: "Esma’ül\nHüsna",
    image: kiEsmaulHusna,
    color: kcListCardColors[9],
    route: Routes.esmaulHusnaView,
  ),
  CategoryItem(
    id: "cuz",
    name: "Elif Bâ",
    image: kiBook2,
    color: kcListCardColors[11],
    route: Routes.webviewView,
  ),
];

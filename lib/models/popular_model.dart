// ignore_for_file: prefer_typing_uninitialized_variables

class PopularModel {
  dynamic pName;
  dynamic title;
  final couleur;

  PopularModel(this.pName, this.title, this.couleur);
}

List<PopularModel> populars = popularsData
  .map((item) => PopularModel(item['pName'], item['title'], item['couleur'])) 
  .toList();

var popularsData = [
  {
    "pName": "Label 1",
    "title": "Voyages",
    "couleur": 0x06DBDBDB
  },
  {
    "pName": "Label 2",
    "title": "Chants & musique",
    "couleur": 0x06DBDBDB
  },
  {
    "pName": "Label 3",
    "title": "Lecture",
    "couleur": 0x06DBDBDB
  },
  {
    "pName": "Label 4",
    "title": "Sport & loisir",
    "couleur": 0x06DBDBDB
  }
];
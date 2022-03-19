// ignore_for_file: prefer_typing_uninitialized_variables

class BeachModel {
  dynamic title;
  dynamic image;

  BeachModel(this.title, this.image);
}

List<BeachModel> beachs = beachData
  .map((item) => BeachModel(item['title'], item['image'])) 
  .toList();

var beachData = [
  {
    "title": "Voyages",
    "image": "assets/images/jus.jpg"
  },
  
  {
    "title": "Sport & loisir",
    "image": "assets/images/kebab1.jpg"
  },
  {
    "title": "Sport & test",
    "image": "assets/images/jus1.jpg"
  }
];
// ignore_for_file: prefer_typing_uninitialized_variables

class RecommendedModel {
  final image;
  final nom;
  final tagLine;
  final description;
  final imagesL;
  final price;

  RecommendedModel(this.image, this.nom,  this.tagLine, this.description, this.imagesL, this.price);
}

List<RecommendedModel> recommendations = recommendationData
  .map((item) => RecommendedModel(
    item['image'], 
    item['nom'], 
    item['tagLine'], 
    item['description'], 
    item['imagesL'],
    item['price']))
  .toList();

final recommendationData = [
  {
    "image": "assets/images/sand.jpg",
    "nom": "Florida, United State",
    "tagLine": "Florida, USA State",
    "description": "blalalalalalalalallalalalalalalaallallalalalalalalalalal",
    "price": 34000,
    "imagesL": [
      "assets/images/sand.jpg",
      "assets/images/kebab.jpg",
      "assets/images/nusa.jpg",
      "assets/images/rio.jpg"
    ]
  },
  {
    "image": "assets/images/bali.jpg",
    "nom": "Paris, France",
    "tagLine": "Paris, France, ville de merveille",
    "description": "blalalalalalalalallalalalalalalaallallalalalalalalalalal",
    "price": 14000,
    "imagesL": [
      "assets/images/bali.jpg",
      "assets/images/sand.jpg",
      "assets/images/rio.jpg",
      "assets/images/kebab.jpg",
    ]
  },
  {
    "image": "assets/images/kebab.jpg",
    "nom": "Seoul, Coree du Sud",
    "tagLine": "Seoul, Coree du Sud, state place",
    "description": "blalalalalalalalallalalalalalalaallallalalalalalalalalal",
    "price": 26000,
    "imagesL": [
      "assets/images/kebab.jpg",
      "assets/images/rio.jpg",
      "assets/images/sand.jpg",
      "assets/images/bali.jpg",
    ]
  },
  {
    "image": "assets/images/rio.jpg",
    "nom": "Rio de Janeiro Brasil",
    "tagLine": "Florida, USA State",
    "description": "blalalalalalalalallalalalalalalaallallalalalalalalalalal",
    "price": 24000,
    "imagesL": [
      "assets/images/rio.jpg",
      "assets/images/sand.jpg",
      "assets/images/bali.jpg",
      "assets/images/kebab.jpg",
    ]
  },
  {
    "image": "assets/images/nusa.jpg",
    "nom": "Tokyo, Japan",
    "tagLine": "Tokyo, Japan pays magnifique",
    "description": "blalalalalalalalallalalalalalalaallallalalalalalalalalal",
    "price": 27000,
    "imagesL": [
      "assets/images/nusa.jpg",
      "assets/images/sand.jpg",
      "assets/images/kebab.jpg",
      "assets/images/rio.jpg",
    ]
  }
];
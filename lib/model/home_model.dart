class HomeModel {
  final String name;
  final String image;
  final String location;
  final String category;
  final num price;
  final num rate;
  bool like;

  HomeModel({required this.name,
    required this.image,
    required this.location,
    required this.category,
    required this.price,
    required this.rate,
    required this.like});

  factory HomeModel.fromJson(Map data,String categoryName){
    return HomeModel(name: data["name"],
        image: data["image"],
        location: data["location"],
        category: categoryName,
        price: data["price"],
        rate: data["rate"],
        like: data["like"] ?? false);
  }

  toJson(){
    return{
      "name" : name,
      "image" : image,
      "location" : location,
      "category" : category,
      "price" : price,
      "rate" : rate,
      "like" : like
    };
}
}
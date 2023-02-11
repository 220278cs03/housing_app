class CategoryModel {
  final String? name;

  CategoryModel({required this.name});

  factory CategoryModel.fromJson(Map data) {
    return CategoryModel(name: data["name"]);
  }
  toJson() {
    return {
      "name": name,
    };}
}
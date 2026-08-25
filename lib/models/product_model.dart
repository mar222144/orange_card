class ProductModel {
  final String id;
  final String name;
  final String description;
  final double price;
  final String image;
  final String category;

  ProductModel({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.image,
    required this.category,
  });
//el fr2 beno w ben constra ano by5lik t3ml logic gwa el fun
  //leh 3mlnha 3shan nhwel el map l product model
  factory ProductModel.fromMap(String id, Map<String, dynamic> data,) { //3shan el app yfhm
    return ProductModel(

      id: id,
      name: data['name'] ?? '',   //lw msh ktba haga f name hyzhr f ui fady bdl ma y3ml error
      description: data['description'] ?? '',
      price: (data['price'] ?? 0).toDouble(),  //lw price p null hot 0
      image: data['image'] ?? '',
      category: data['category'] ?? '',
    );
  }

  Map<String, dynamic> toMap() { //3shan firestore yfhm
    return {
      'name': name,
      'description': description,
      'price': price,
      'image': image,
      'category': category,
    };
  }
}
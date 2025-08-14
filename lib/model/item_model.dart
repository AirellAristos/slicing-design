class ItemModel {
  final int id;
  final bool isFavorited;
  final String itemName;
  final String category;
  final double price;
  final double rating;
  final String imageLocation;

  ItemModel({
    required this.id,
    required this.isFavorited,
    required this.itemName,
    required this.category,
    required this.price,
    required this.rating,
    required this.imageLocation,
  });

  // Static dummy data
  static List<ItemModel> sampleData = [
    ItemModel(
      id: 1,
      isFavorited: false,
      itemName: 'Modern Light Clothes',
      category: 'T-Shirt',
      price: 212.99,
      rating: 5.0,
      imageLocation: 'assets/images/modern-light-clothes.png',
    ),
    ItemModel(
      id: 2,
      isFavorited: true,
      itemName: 'Light Dress Bless',
      category: 'Dress Modern',
      price: 162.99,
      rating: 5.0,
      imageLocation: 'assets/images/light-dress-bless.png',
    ),
    ItemModel(
      id: 3,
      isFavorited: true,
      itemName: 'Black Leather Jacket',
      category: 'Jacket',
      price: 159.99,
      rating: 5.0,
      imageLocation: 'assets/images/black-leather-jacket.png',
    ),
    ItemModel(
      id: 4,
      isFavorited: true,
      itemName: 'Simple Yellow Dress',
      category: 'Dress',
      price: 189.99,
      rating: 5.0,
      imageLocation: 'assets/images/yellow-dress.png',
    ),
  ];
}

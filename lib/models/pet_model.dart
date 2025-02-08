class Pet {
  final String id;
  final String name;
  final int age;
  final double price;
  final String imageUrl;
  DateTime? date=DateTime.now();
  bool isAdopted;

  Pet({
    required this.id,
    required this.name,
    required this.age,
    required this.price,
    required this.imageUrl,
      this.date,
    this.isAdopted = false,
  });

  /// Method to mark the pet as adopted
  void adopt() {
    if (!isAdopted) {
      isAdopted = true;
    }
  }
}
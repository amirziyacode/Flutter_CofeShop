class ItemCoffee {
  String image;
  String name;
  double star;

  ItemCoffee({required this.image, required this.name,required this.star});
}

List<ItemCoffee> items = [
  ItemCoffee(
      image:
          "images/kisspng-cuban-espresso-latte-coffee-cortado-flat-white-5be25df01569f1.0725626815415618400877.png",
      name: "Cappuccino",star: 4.5),
  ItemCoffee(image: "images/coffee.png", name: "Coffee",star:5),
  ItemCoffee(image: "images/pngegg.png", name: "Espresso",star:4.8),
  ItemCoffee(image: "images/latte.png", name: "Latte",star:4.9),
];

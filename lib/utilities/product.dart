class Product {
  final String img;
  final String name;
  final int quantity;
  final double productPrice;

  Product({
    required this.name,
    required this.img,
    required this.quantity,
    required this.productPrice,
  });
}

// Sample Product Data
List<Product> products = [
  Product(
    name: 'Red Apple',
    img: 'https://cdn.pixabay.com/photo/2016/11/18/13/47/apple-1834639_1280.jpg',
    quantity: 1,
    productPrice: 4.99,
  ),
  Product(
    name: 'Green Apple',
    img: 'https://media.istockphoto.com/id/185284489/photo/orange.jpg?s=612x612&w=0&k=20&c=m4EXknC74i2aYWCbjxbzZ6EtRaJkdSJNtekh4m1PspE=',
    quantity: 1,
    productPrice: 3.99,
  ),
  Product(
    name: 'Banana',
    img: 'https://images.rawpixel.com/image_png_800/czNmcy1wcml2YXRlL3Jhd3BpeGVsX2ltYWdlcy93ZWJzaXRlX2NvbnRlbnQvcHUyMzM0MTgzLWltYWdlLWpvYjYyMV82LnBuZw.png', // Placeholder URL
    quantity: 1,
    productPrice: 1.99,
  ),
];

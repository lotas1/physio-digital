class Product {
  final String name;
  final String imageUrl;
  final List<String> imageThumbnails;
  final double price;
  final bool isPreferred;
  final bool isRecommended;
  final String details;
  final String features;

  Product({
    required this.name,
    required this.imageUrl,
    required this.imageThumbnails,
    required this.price,
    required this.details,
    required this.features,
    this.isPreferred = false,
    this.isRecommended = false,
  });
}

final List<Product> products = [
  Product(
    name: 'NuStep Recumbent Cross Trainer T4R',
    imageUrl: 'assets/images/onboard.jpg',
    imageThumbnails: [
      'assets/images/onboard.jpg',
      'assets/images/onboard.jpg',
      'assets/images/onboard.jpg',
    ],
    price: 500,
    isPreferred: true,
    details:
        'NuStep Recumbent Cross Trainer T4R combines a natural sitting position with a smooth stepping motion to work all major muscle groups during exercise.',
    features:
        'Features two exercise programs (quick start and pace partner), suitable for physical therapy, cardiopulmonary rehabilitation, durable, heavy-duty welded steel frame constructed with powder-coated, rust-resistant components for long-lasting operation.',
  ),
  Product(
    name: 'AM-TM700 Series Electric Platform',
    imageUrl: 'assets/images/onboard.jpg',
    imageThumbnails: [
      'assets/images/onboard.jpg',
      'assets/images/onboard.jpg',
      'assets/images/onboard.jpg',
    ],
    price: 1200,
    isRecommended: true,
    details:
        'NuStep Recumbent Cross Trainer T4R combines a natural sitting position with a smooth stepping motion to work all major muscle groups during exercise.',
    features:
        'Features two exercise programs (quick start and pace partner), suitable for physical therapy, cardiopulmonary rehabilitation, durable, heavy-duty welded steel frame constructed with powder-coated, rust-resistant components for long-lasting operation.',
  ),
  Product(
    name: 'AM-TM700 Series Electric Platform',
    imageUrl: 'assets/images/onboard.jpg',
    imageThumbnails: [
      'assets/images/onboard.jpg',
      'assets/images/onboard.jpg',
      'assets/images/onboard.jpg',
    ],
    price: 1200,
    isRecommended: true,
    details:
        'NuStep Recumbent Cross Trainer T4R combines a natural sitting position with a smooth stepping motion to work all major muscle groups during exercise.',
    features:
        'Features two exercise programs (quick start and pace partner), suitable for physical therapy, cardiopulmonary rehabilitation, durable, heavy-duty welded steel frame constructed with powder-coated, rust-resistant components for long-lasting operation.',
  ),
  Product(
    name: 'AM-TM700 Series Electric Platform',
    imageUrl: 'assets/images/onboard.jpg',
    imageThumbnails: [
      'assets/images/onboard.jpg',
      'assets/images/onboard.jpg',
      'assets/images/onboard.jpg',
    ],
    price: 1200,
    isRecommended: true,
    details:
        'NuStep Recumbent Cross Trainer T4R combines a natural sitting position with a smooth stepping motion to work all major muscle groups during exercise.',
    features:
        'Features two exercise programs (quick start and pace partner), suitable for physical therapy, cardiopulmonary rehabilitation, durable, heavy-duty welded steel frame constructed with powder-coated, rust-resistant components for long-lasting operation.',
  ),
  Product(
    name: 'AM-TM700 Series Electric Platform',
    imageUrl: 'assets/images/onboard.jpg',
    imageThumbnails: [
      'assets/images/onboard.jpg',
      'assets/images/onboard.jpg',
      'assets/images/onboard.jpg',
    ],
    price: 1200,
    isRecommended: true,
    details:
        'NuStep Recumbent Cross Trainer T4R combines a natural sitting position with a smooth stepping motion to work all major muscle groups during exercise.',
    features:
        'Features two exercise programs (quick start and pace partner), suitable for physical therapy, cardiopulmonary rehabilitation, durable, heavy-duty welded steel frame constructed with powder-coated, rust-resistant components for long-lasting operation.',
  ),
];

final Product sampleProduct = Product(
  name: 'NuStep Recumbent Cross Trainer T4R',
  imageUrl: 'assets/images/onboard.jpg', 
  imageThumbnails: [
    'assets/images/onboard.jpg', 
    'assets/images/onboard.jpg',
    'assets/images/onboard.jpg',
  ],
  price: 500,
  details: 'NuStep Recumbent Cross Trainer T4R combines a natural sitting position with a smooth stepping motion to work all major muscle groups during exercise.',
  features: 'Features two exercise programs (quick start and pace partner), suitable for physical therapy, cardiopulmonary rehabilitation, durable, heavy-duty welded steel frame constructed with powder-coated, rust-resistant components for long-lasting operation.',
);
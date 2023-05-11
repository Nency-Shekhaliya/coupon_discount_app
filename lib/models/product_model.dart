class Product {
  int id;
  String name;
  double price;
  String image;
  Product(
      {required this.name,
      required this.price,
      required this.image,
      required this.id});
}

List<Product> product = [
  Product(
      name: 'watch',
      price: 800,
      image:
          'https://media.istockphoto.com/id/697173746/photo/luxury-watch.jpg?s=612x612&w=0&k=20&c=GafBmooVbVN-HkNN-nfZqB_OGl3sSnfOwSD9Y8xIiqw=',
      id: 1),
  Product(
      name: 'Jeans',
      price: 900,
      image:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRZYT0PWRT20rmSm389D2l7pOKwsX55H992DA&usqp=CAU',
      id: 2),
  Product(
      name: 'T-shirt',
      price: 1000,
      image:
          'https://img.freepik.com/premium-photo/black-tshirts-with-copy-space_816702-240.jpg',
      id: 3),
  Product(
      name: 'Shirt',
      price: 1200,
      image:
          'https://assets.ajio.com/medias/sys_master/root/20220819/Qm9w/62fe856aaeb269176183efe0/-473Wx593H-461124702-black-MODEL.jpg',
      id: 4),
  Product(
      name: 'Laptop',
      price: 46000,
      image:
          'https://images.freeimages.com/images/previews/e49/isolated-macbook-pro-1615424.jpg',
      id: 5),
  Product(
      name: 'TV',
      price: 60000,
      image:
          'https://www.shutterstock.com/image-photo/4k-monitor-isolated-on-white-260nw-357968483.jpg',
      id: 6),
  Product(
      name: 'Mobile',
      price: 50000,
      image:
          'https://image.oppo.com/content/dam/oppo/common/mkt/v2-2/reno8-5g-en/middlebanner/reno8-shimmer-gold-640x480-6-mobile.jpg.thumb.webp',
      id: 7),
];

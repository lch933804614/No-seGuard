import 'package:flutter/material.dart';

class MarketPage extends StatelessWidget {
  final List<Product> products = [
    Product(
        name: "소음 방지 러그",
        description: "층간소음을 줄여주는 두꺼운 러그",
        price: "₩49,900",
        image: "assets/rug.png",
        rating: 4.5,
        reviews: 6800),
    Product(
        name: "방음 폼 패널",
        description: "벽에 붙여 소음을 차단하는 패널",
        price: "₩39,900",
        image: "assets/soundproof_panel.png",
        rating: 4.8,
        reviews: 15234),
    Product(
        name: "두꺼운 커튼",
        description: "소음과 빛을 차단하는 방음 커튼",
        price: "₩29,900",
        image: "assets/thick_curtain.png",
        rating: 4.6,
        reviews: 52346),
    Product(
        name: "문틈 방음 테이프",
        description: "문틈 소음을 줄여주는 실리콘 테이프",
        price: "₩9,900",
        image: "assets/door_tape.png",
        rating: 4.7,
        reviews: 45878),
    Product(
        name: "층간소음 매트",
        description: "어린이 소음 방지를 위한 쿠션 매트",
        price: "₩59,900",
        image: "assets/floor_mat.png",
        rating: 4.9,
        reviews: 33566),
    Product(
        name: "소음 차단 이어폰",
        description: "집중력을 높여주는 노이즈 캔슬링 이어폰",
        price: "₩99,900",
        image: "assets/noise_canceling_earphones.png",
        rating: 4.8,
        reviews: 27344),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: "층간소음 완화 아이템을 추천하고\n",
                    style: TextStyle(color: Colors.white, fontSize: 28),
                  ),
                  TextSpan(
                    text: "구매할 수 있는 공간입니다.",
                    style: TextStyle(
                        color: Colors.lightBlue,
                        fontSize: 28,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            Expanded(
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 12,
                  mainAxisSpacing: 12,
                  childAspectRatio: 0.7,
                ),
                itemCount: products.length,
                itemBuilder: (context, index) {
                  return _buildProductCard(products[index]);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildProductCard(Product product) {
    return Container(
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 5,
            spreadRadius: 1,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.asset(
              product.image,
              height: 100,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(height: 8),
          Text(
            product.name,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 14,
              color: Colors.black,
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          Text(
            product.description,
            style: TextStyle(
              fontSize: 12,
              color: Colors.grey.shade700,
            ),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          SizedBox(height: 4),
          Text(
            product.price,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: Colors.blue,
            ),
          ),
          Row(
            children: [
              Icon(Icons.star, color: Colors.orange, size: 16),
              SizedBox(width: 4),
              Text(
                "${product.rating} (${product.reviews.toString()})",
                style: TextStyle(fontSize: 12, color: Colors.grey.shade600),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class Product {
  final String name;
  final String description;
  final String price;
  final String image;
  final double rating;
  final int reviews;

  Product({
    required this.name,
    required this.description,
    required this.price,
    required this.image,
    required this.rating,
    required this.reviews,
  });
}

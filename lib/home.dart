import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:grocery_delivery_app/colors.dart';
import 'package:grocery_delivery_app/model.dart';
import 'package:grocery_delivery_app/product_item.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<CategoryModel> category = [
    CategoryModel(name: "Fruits", image: "images/category/bsket.png"),
    CategoryModel(name: "Milk & egg", image: "images/category/milk.png"),
    CategoryModel(name: "Beverages", image: "images/category/bevaregs.png"),
    CategoryModel(name: "Laundry", image: "images/category/laundry.png"),
    CategoryModel(name: "Vegetables", image: "images/category/fruites.png"),
  ];
  List<String> items = [
    "images/banner/Slider 1.png",
    "images/banner/Slider 2.png",
    "images/banner/Slider 3.png",
  ];
  List<ProductModel> products = [
    ProductModel(
      name: "Banana",
      image: "images/fruites/banana.png",
      rate: "4",
      ratecount: "(287)",
      price: "\$3.99",
    ),
    ProductModel(
      name: "pepper",
      image: "images/fruites/pepper.png",
      rate: "4",
      ratecount: "(287)",
      price: "\$2.99",
    ),
    ProductModel(
      name: "orange",
      image: "images/fruites/orange.png",
      rate: "4",
      ratecount: "(287)",
      price: "\$1.99",
    ),
  ];
  List<ProductModel> basketItems = [];
  void toggleSelection(ProductModel product) {
    setState(() {
      if (basketItems.contains(product)) {
        basketItems.remove(product);
      } else {
        basketItems.add(product);
      }
    });
  }

  bool isselected(ProductModel product) => basketItems.contains(product);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: SizedBox.shrink(),
        leadingWidth: 0,
        title: Row(
          children: [
            SvgPicture.asset("images/icons/motor.svg"),
            SizedBox(width: 10),
            Text("61 Hopper street.."),
            SizedBox(width: 10),
            Icon(Icons.keyboard_arrow_down, size: 30),
            Spacer(),
            SvgPicture.asset("images/icons/baskett.svg"),
          ],
        ),
      ),
      body: Column(
        children: [
          CarouselSlider.builder(
            itemCount: items.length,
            itemBuilder:
                (BuildContext context, int itemIndex, int pageViewIndex) =>
                    Image.asset(items[itemIndex]),
            options: CarouselOptions(
              height: 220,
              aspectRatio: 16 / 9,
              viewportFraction: 0.9,
              initialPage: 0,
              enableInfiniteScroll: true,
              reverse: false,
              autoPlay: true,
              autoPlayInterval: Duration(seconds: 2),
              autoPlayAnimationDuration: Duration(milliseconds: 800),
              autoPlayCurve: Curves.fastOutSlowIn,
              enlargeCenterPage: true,
              enlargeFactor: 0.3,
              scrollDirection: Axis.horizontal,
            ),
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: List.generate(category.length, (index) {
                return Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Column(
                    children: [
                      Container(
                        width: 70,
                        height: 70,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.grey[200],
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Image.asset(category[index].image, width: 50),
                        ),
                      ),
                      Text(
                        category[index].name,
                        style: TextStyle(fontSize: 12),
                      ),
                    ],
                  ),
                );
              }),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Fruits",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                Text(
                  "See all",
                  style: TextStyle(
                    color: AppColor.primary,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: List.generate(products.length, (index) {
                return ProductItem(
                  name: products[index].name,
                  image: products[index].image,
                  rate: products[index].rate,
                  ratecount: products[index].ratecount,
                  price: products[index].price,
                  ontap: () => toggleSelection(products[index]),
                  icon: isselected(products[index])
                      ? Icon(Icons.close)
                      : Icon(Icons.add),
                );
              }),
            ),
          ),
          SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Container(
              height: 70,
              width: double.infinity,
              decoration: BoxDecoration(
                color: AppColor.primary,
                borderRadius: BorderRadius.circular(7),
              ),
              child: Row(
                children: [
                  SizedBox(
                    width: 250,
                    child: ListView.builder(
                      itemExtent: 50,
                      scrollDirection: Axis.horizontal,
                      itemCount: basketItems.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: Container(
                            height: 40,
                            width: 40,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              shape: BoxShape.circle,
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(5),
                              child: Image.asset(basketItems[index].image),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(height: 35, width: 2, color: Colors.white),
                  ),
                  Text(
                    "View Basket",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(width: 8),
                  Badge(
                    label: Text(basketItems.length.toString()),
                    largeSize: 15,

                    child: SvgPicture.asset(
                      "images/icons/baskett.svg",
                      color: Colors.white,
                      height: 19,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

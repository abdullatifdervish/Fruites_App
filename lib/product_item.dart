import 'package:flutter/material.dart';

class ProductItem extends StatelessWidget {
  final String name;
  final String image;
  final String rate;
  final String ratecount;
  final String price;
  final Function()? ontap;
  final Widget icon;
  const ProductItem({
    super.key,
    required this.name,
    required this.image,
    required this.rate,
    required this.ratecount,
    required this.price, required this.ontap, required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                  color: Colors.grey.shade100,
                  borderRadius: BorderRadius.circular(10),
                ),
                height: 150,
                width: 170,
                child: Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Image.asset(image),
                  ),
                ),
              ),
              Positioned(bottom: 10, right: 10, child: Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white
                ),
                child: InkWell(
                  onTap: ontap,
                  child: icon))),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 5),
                Text(name, style: TextStyle(fontWeight: FontWeight.bold)),
                SizedBox(height: 5),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Image.asset("images/icons/star.png"),
                    Text(" $rate $ratecount"),
                  ],
                ),
                SizedBox(height: 5),
                Text(price),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:ecommerce/models/product.dart';
import 'package:ecommerce/provider/cart_provider.dart';
import 'package:ecommerce/screens/cart_screen_details.dart';
import 'package:ecommerce/widgets/available_sized.dart';
import 'package:flutter/material.dart';

class DetailsScreen extends StatelessWidget {
  final Product product;
  const DetailsScreen({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    final provider = CartProvider.of(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Details'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 36.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 220,
                height: 220,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.red.shade100,
                ),
                child: Image.asset(
                  product.image,
                  fit: BoxFit.cover,
                ),
              )
            ],
          ),
          SizedBox(
            height: 36.0,
          ),
          Container(
            padding: const EdgeInsets.all(20),
            width: double.infinity,
            height: 360,
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(40),
                topRight: Radius.circular(40),
              ),
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      product.name.toUpperCase(),
                      style: const TextStyle(
                          fontSize: 26, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      '\$' '${product.price}',
                      style: const TextStyle(
                          fontSize: 22, fontWeight: FontWeight.bold),
                    )
                  ],
                ),
               const SizedBox(
                  height: 20,
                ),
                Text(
                  product.description,
                  textAlign: TextAlign.justify,
                  style: const TextStyle(fontSize: 14),
                ),
               const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children:  [
                    Text(
                      'Available Size',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 16,
                ),
              const  Row(
                  children: [
                    AvailableSize(size: "37"),
                    AvailableSize(size: "38"),
                    AvailableSize(size: "39"),
                    AvailableSize(size: "40"),
                  ],
                ),
                const SizedBox(
                  height: 16,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text(
                      'Available Color',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 16,
                  ),
                Row(
                  children: [
                    CircleAvatar(
                      radius: 16,
                      backgroundColor: Colors.blue,
                    ),
                    SizedBox(
                      width: 8,
                    ),
                    CircleAvatar(
                      radius: 16,
                      backgroundColor: Colors.black,
                    ),
                    SizedBox(
                      width: 8,
                    ),
                    CircleAvatar(
                      radius: 16,
                      backgroundColor: Colors.red,
                    ),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
      bottomSheet: BottomAppBar(
          child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        alignment: Alignment.center,
        width: double.infinity,
        height: MediaQuery.of(context).size.height / 10,
        decoration: const BoxDecoration(
          color: Color(0xfffFCF4F1),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(10),
            topRight: Radius.circular(10),
          ),
        ),
        child: Row(children: [
          Text(
            '\$' '${product.price}',
            style: const TextStyle(
                fontSize: 34, fontWeight: FontWeight.bold, color: Colors.black),
          ),
          SizedBox(
            width: 110,
          ),
          ElevatedButton.icon(
            onPressed: () {
              provider.toggleProduct(product);
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const CartDetails(),
                  ));
            },
            icon: const Icon(Icons.send),
            label: const Text("Add to cart"),
          )
        ]),
      )),
    );
  }
}
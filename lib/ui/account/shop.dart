import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shopa/models/products_response.dart';
import 'package:shopa/ui/widgets/product_widget.dart';
import 'package:http/http.dart' as http;

class Shop extends StatefulWidget {
  const Shop({Key? key}) : super(key: key);

  @override
  _ShopState createState() => _ShopState();
}

class _ShopState extends State<Shop> {
  //  List<Map<String, dynamic>> products = [
  //   {
  //   'title': 'Freepods',
  //   'image': 'assets/images/product1.png',
  //   'price':  25000,
  //   'reviews': {'star': 4.5,'count': 10}
  //   },
  //   {
  //   'title': 'drill',
  //   'image': 'assets/images/product2.png',
  //   'price':  9000,
  //   'reviews': {'star': 5.0,'count': 40}
  //   },
  //   {
  //   'title': 'headsets',
  //   'image': 'assets/images/product3.png',
  //   'price':  15000,
  //   'reviews': {'star': 4.0,'count': 20}
  //   }
  // ];
  Future<List<ProductsResponse>> getProducts() async {
    var url = Uri.parse('https://fakestoreapi.com/products');
    final response = await http.get(url);
    List result = jsonDecode(response.body);
    List<ProductsResponse> allProducts =
        (result).map((dynamic e) => ProductsResponse.fromJson(e)).toList();

    return allProducts;
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Text(
            "shop page",
            style: Theme.of(context).textTheme.headline1,
          ),
          FutureBuilder(
              future: getProducts(),
              builder: (context, AsyncSnapshot snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                } else if (snapshot.connectionState == ConnectionState.done &&
                    snapshot.hasError) {
                  return Text('An error occured ${snapshot.error}');
                }
                List<ProductsResponse> products = snapshot.data;
                return GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 2,
                      mainAxisSpacing: 2,
                      childAspectRatio: 1 / 1.4),
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: products.length,
                  itemBuilder: (BuildContext context, int index) {
                    ProductsResponse product = products[index];
                    return ProductWidget(product: product);
                  },
                );
              }),
        ],
      ),
    );
  }
}

import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shopa/models/products_response.dart';
import 'package:shopa/ui/widgets/product_widget.dart';
import 'package:http/http.dart' as http;

class Dashboard extends StatefulWidget {
  Dashboard({
    Key? key,
    // required this.products,
  }) : super(key: key);

  // final List<Map<String, dynamic>> products;

  List<Map<String, dynamic>> products = [
    {
      'title': 'Freepods',
      'image': 'assets/images/product1.png',
      'price': 25000,
      'reviews': {'star': 4.5, 'count': 10}
    },
    {
      'title': 'drill',
      'image': 'assets/images/product2.png',
      'price': 9000,
      'reviews': {'star': 5.0, 'count': 40}
    },
    {
      'title': 'headsets',
      'image': 'assets/images/product3.png',
      'price': 15000,
      'reviews': {'star': 4.0, 'count': 20}
    }
  ];

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  Future<List<ProductsResponse>> getProducts() async {
    List<ProductsResponse> allProducts;

    print('loading');
    var url = Uri.parse('https://fakestoreapi.com/products');
    var response = await http.get(url);
    List result = jsonDecode(response.body);

    allProducts =
        (result).map((dynamic e) => ProductsResponse.fromJson(e)).toList();

    return allProducts;
  }

  Future getCategories() async {
    var url = Uri.parse('https://fakestoreapi.com/products/categories');
    final response = await http.get(url);
    return jsonDecode(response.body);
  }

  @override
  void initState() {
    // TODO: implement initState
    // getCategories();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Padding(
      padding: const EdgeInsets.all(15.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Form(
            child: TextFormField(
              decoration: InputDecoration(
                suffixIcon: Icon(
                  Icons.search,
                  size: 40,
                ),
              ),
            ),
          ),
          SizedBox(
            height: 40,
          ),
          SizedBox(
            width: 400,
            height: 250,
            child: ListView(
              scrollDirection: Axis.horizontal,
              // shrinkWrap: true,
              children: [
                buildSlider(context, "Welcome", Colors.blue),
                buildSlider(context, "Thank You!", Colors.green),
                buildSlider(context, "Yes!! FInally!",
                    Color.fromARGB(255, 107, 33, 243)),
                buildSlider(context, "Again, Thank You!",
                    Color.fromARGB(255, 175, 76, 116)),
              ],
            ),
          ),
          SizedBox(height: 40),
          GestureDetector(
            onTap: () {
              showBottomSheet(
                  context: context,
                  builder: (context) {
                    return Container(
                      height: 500,
                      width: double.infinity,
                      color: Colors.white,
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: FutureBuilder(
                            future: getCategories(),
                            builder: (context, AsyncSnapshot snapshot) {
                              if (snapshot.connectionState == ConnectionState.waiting) {
                                return Center(child: CircularProgressIndicator());
                              }else if (snapshot.connectionState == ConnectionState.done && snapshot.hasData) {
                                List<dynamic> categories = snapshot.data;
                              return GridView.builder(
                                  physics: NeverScrollableScrollPhysics(),
                                  gridDelegate:
                                      const SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2,
                                  ),
                                  itemCount: categories.length,
                                  itemBuilder: (BuildContext context, int index) {
                                    final cat = categories[index];
                                    return Text(cat);
                                  },
                                );
                              } else{
                                return Text('An error occured: ${snapshot.error.toString()} ');
                              }
                              
                            }),
                      ),
                    );
                  });
            },
            child: Text('See all'),
          ),
          SizedBox(
            width: 400,
            height: 300,
            child: FutureBuilder(
                future: getProducts(),
                builder: (context, AsyncSnapshot snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(child: CircularProgressIndicator());
                  } else if (snapshot.connectionState == ConnectionState.done &&
                      snapshot.hasError) {
                    return Text('An error occured ${snapshot.error}');
                  }
                  List<ProductsResponse> allProducts = snapshot.data;
                  return ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: allProducts.length,
                    itemBuilder: ((context, index) {
                      final product = allProducts[index];
                      return SizedBox(
                        width: 300,
                        child: ProductWidget(product: product),
                      );
                    }),
                  );
                }),
          ),
          SizedBox(
            height: 30,
          ),
          Text('Latest News', style: Theme.of(context).textTheme.bodyText1),
          ListView.builder(
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: 14,
            itemBuilder: (BuildContext context, int index) {
              return Card(
                child: ListTile(
                  title: Text(
                    'App development in Progress',
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                  subtitle: Text('App development in Progres'),
                  trailing: Container(
                    width: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      image: DecorationImage(
                          image: AssetImage('assets/images/img1.png')),
                    ),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    ));
  }

  Container buildSlider(BuildContext context, String title, Color color) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10),
      padding: EdgeInsets.all(30),
      height: 300,
      width: 300,
      decoration:
          BoxDecoration(borderRadius: BorderRadius.circular(12), color: color),
      child: Text(
        title,
        style: Theme.of(context)
            .textTheme
            .headline3
            ?.copyWith(color: Color(0xffffffff)),
      ),
    );
  }
}

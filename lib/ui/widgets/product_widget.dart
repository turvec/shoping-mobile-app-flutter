
import 'package:flutter/material.dart';
import 'package:shopa/models/products_response.dart';

class ProductWidget extends StatelessWidget {
  
   ProductWidget({
    Key? key,
    required this.product,
  }) : super(key: key);

  ProductsResponse product;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(10),
      elevation: 5,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: SizedBox(
                height: 150,
                width: 150,
                child: Image.network(product.image ?? '')),
            ),
            SizedBox(height: 5),
            Text('${product.title}', 
            maxLines: 2,
             style: Theme.of(context).textTheme.bodyText1
            ),
            SizedBox(height: 5),
            Text('N${product.price}', 
             style: Theme.of(context).textTheme.bodyText2?.copyWith(color: Colors.red)
            ),
            SizedBox(height: 5),
            // Row(
            //   children:[
            //     Icon(Icons.star,
            //     size: 17,
            //     color: Colors.yellow.shade800,),
            //     Expanded(
            //       child: Text('${product['reviews']['star']}',
            //       style: TextStyle(fontSize: 14))),
            //     Expanded(flex: 3,
            //      child: Text('${product['reviews']['count']} Reviews',
            //      style: TextStyle(fontSize: 14),)),
            //     Icon(Icons.more_vert, size: 15,)
            //   ],
            // )
          ],
        ),
      ),
    );
  }
}
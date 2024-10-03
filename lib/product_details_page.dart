import 'package:flutter/material.dart';
import 'package:shop_app_flutter/global_variables.dart';

class ProductDetailsPage extends StatefulWidget {
  final Map<String,Object> product;
  const ProductDetailsPage({super.key, required this.product});

  @override
  State<ProductDetailsPage> createState() => _ProductDetailsPageState();
}

class _ProductDetailsPageState extends State<ProductDetailsPage> {
  int selectedsize=0;
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: Text('Details'),
      ),
      body: Column(
        children: [
          Text(widget.product['title'] as String,
          style: Theme.of(context).textTheme.titleLarge,
          ),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Image.asset(widget.product['imageUrl'] as String),
          ),
          const Spacer(
            flex: 2,
          ),
          Container(
            height: 245,
            decoration: BoxDecoration(
              color: const Color.fromRGBO(245, 247, 249, 1),
              borderRadius: BorderRadius.circular(40),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
               
                Text(
                  '\$${widget.product['price']}',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                const SizedBox(height: 10),
                SizedBox(
                  height: 50,
                  
                  child: ListView.builder(
                     scrollDirection:Axis.horizontal,
                     itemCount: (widget.product['sizes'] as List<int>).length,
                      itemBuilder: (context, index){
                        final size =(widget.product['sizes'] as List<int>)[index];
                        return Padding(
                          padding: EdgeInsets.all(8.0),
                          child: GestureDetector(
                            onTap: (){
                              setState(() {
                                selectedsize=size;
                              });
                            },
                            child: Chip(
                              label: Text(size.toString()),
                              backgroundColor: selectedsize==size?   Theme.of(context).colorScheme.primary:null,
                            ),
                          ),
                        );
                      }
                  ),
                ),
               
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: ElevatedButton(
                     // ElevatedButton.icon(icon: ),
                      onPressed: (){},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Theme.of(context).colorScheme.primary,
                        fixedSize: const Size(350, 50),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                           Icon(Icons.shopping_cart,color: Color.fromRGBO(15, 0, 0, 1),),
                          const Text(
                            'Add To Cart',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 18,
                            ),
                          ),
                         
                        ],
                      ),
                    ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:shop_app_flutter/global_variables.dart';
import 'package:shop_app_flutter/product_card.dart';
import 'package:shop_app_flutter/product_details_page.dart';

class ProductList extends StatefulWidget {
  const ProductList({super.key});

  @override
  State<ProductList> createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {
  final List <String> filters= const['All', 'Adidas','Nike','Bata'];
  late String selectedFilter;
  @override
  void initState() {
    
    super.initState();
    
    selectedFilter=filters[0];
  }
  @override
  Widget build(BuildContext context) {
    const border=OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color.fromRGBO(225, 225, 225, 1)
                        ),
                        borderRadius: BorderRadius.horizontal(
                          left: Radius.circular(25),
                        )
                      );
    return  SafeArea(
        child: Column(
          children: [
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Text('Shoes\nCollection',style: Theme.of(context).textTheme.titleLarge),
                ),
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.search),
                      hintText: 'Search',
                      border: border,
                      focusedBorder: border,
                      enabledBorder: border
                    ),
                  )
                )
              ],
            ),
            SizedBox(
              height: 120,
              child: ListView.builder(
                
                itemCount:filters.length, 
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  final filter=filters[index];
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedFilter=filter;
                        });
                      },
                      child: Chip(
                        side: BorderSide(color: Color.fromRGBO(245, 247, 249, 1),),
                        label: Text(filter),
                        backgroundColor: selectedFilter==filter?Theme.of(context).colorScheme.primary:Color.fromRGBO(245, 247, 249, 1),
                        labelStyle: TextStyle(fontSize: 14),
                        padding: EdgeInsets.symmetric(horizontal: 13.0,vertical: 10),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30)
                        ),
                      ),
                    ),
                  );
                }
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount:products.length,
                itemBuilder: (context, index) {
                  final product=products[index];
                  return GestureDetector(
                    onTap: (){
                      Navigator.of(context).push(
                        MaterialPageRoute(builder: (context){
                          return ProductDetailsPage(product: product,);
                        })
                      );
                    },
                    child: ProductCard(title: product['title'] as String,
                    price: product['price'] as double,image: product['imageUrl']as String,
                    backgroundColor: index.isEven? Color.fromRGBO(216, 240, 253, 1):Color.fromRGBO(245, 247, 249, 1)));
                },),
            )
          ],
        ),
      );
  }
}
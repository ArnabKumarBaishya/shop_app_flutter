import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
   const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
    return  Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Text('Shoes\nCollection',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 35)),
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
            )
          ],
        ),
      ),
    );
  }
}
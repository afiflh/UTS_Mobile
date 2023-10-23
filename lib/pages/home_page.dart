import 'package:belanja/models/item.dart';
import 'package:belanja/pages/item_page.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  final List<Item> items = [
    Item(name: 'Sugar', price: 5000, image: 'sugar.jpg', stock: 100, rating: 4.5),
    Item(name: 'Salt', price: 2000, image: 'salt.jpg', stock: 50, rating: 3.9),
    // Add more items with photo, stock, and rating here
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Shopping List'),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(30.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Afif Lukmanul Hakim',
              style: TextStyle(color: Colors.white)),
              SizedBox(width: 50), // Memberikan jarak horizontal
              Text('2141720262',
              style: TextStyle(color: Colors.white)),
            ],
          ),
        ),
      ),
      body: Container(
        margin: EdgeInsets.all(8),
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, // You can adjust the number of columns as needed
          ),
          itemCount: items.length,
          itemBuilder: (context, index) {
            final item = items[index];
            return InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ItemPage(item: item),
                  ),
                );
              },
              child: Hero(
                tag: 'itemImage${item.name}', // Tag yang digunakan untuk animasi Hero
                child: Card(
                  child: Column(
                    children: [
                      Image.asset(
                        'assets/${item.image}',
                        height: 100,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          item.name,
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                      Text('Price: \$${item.price.toString()}'),
                      Text('Stock: ${item.stock.toString()}'),
                      Text('Rating: ${item.rating.toString()}'),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

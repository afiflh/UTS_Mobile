import 'package:flutter/material.dart';
import 'package:belanja/models/item.dart';

class ItemPage extends StatelessWidget {
  final Item item;
  
  ItemPage({required this.item});

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
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Menampilkan gambar di atas nama item
            Hero(
              tag: 'itemImage${item.name}', 
              child: Image.asset(
                'assets/${item.image}', 
                height: 300, 
              ),
            ),
            Text('Item Name: ${item.name}'), 
            Text('Item Price: \$${item.price.toString()}'), 
            Text('Item Stock: ${item.stock.toString()}'), 
            Text('Item Rating: ${item.rating.toString()}'), 
          ],
        ),
      ),
    );
  }
}

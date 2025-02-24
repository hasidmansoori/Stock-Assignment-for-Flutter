import 'package:flutter/material.dart';
import 'package:stockproject/models/stock.dart';

class StockItem extends StatelessWidget {
  final Stock stock;

  const StockItem({Key? key, required this.stock}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      child: ListTile(
        contentPadding: const EdgeInsets.all(16.0),
        title: Text(
          stock.name,
          style: Theme.of(context).textTheme.titleMedium, // Updated property
        ),
        subtitle: Text(
          stock.symbol,
          style: Theme.of(context).textTheme.bodyMedium, // Updated property
        ),
        // trailing: Text(
        //   '\$${stock.price.toStringAsFixed(2)}',
        //   style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
        // ),
        onTap: () {
          // You can navigate to a stock detail screen if needed
        },
      ),
    );
  }
}

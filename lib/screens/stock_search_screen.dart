import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:stockproject/api/stock_api.dart';
import 'package:stockproject/models/stock.dart';
import 'package:stockproject/utils/storage.dart';
import 'package:stockproject/widgets/loading_indicator.dart';
import 'package:stockproject/widgets/stock_item.dart';

class StockSearchScreen extends ConsumerStatefulWidget {
  @override
  _StockSearchScreenState createState() => _StockSearchScreenState();
}

class _StockSearchScreenState extends ConsumerState<StockSearchScreen> {
  final TextEditingController _searchController = TextEditingController();
  bool _isLoading = false;
  List<Stock> _stocks = [];

  _searchStocks() async {
    setState(() {
      _isLoading = true;
    });

    final token = await Storage.getToken();
    final stocksData = await StockAPI().searchStocks(_searchController.text, token!);

    setState(() {
      _stocks = stocksData.map((e) => Stock.fromJson(e)).toList();
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          'Search Stocks',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 20),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.blueAccent, Colors.purpleAccent],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Column(
          children: [
            SizedBox(height: 30),
            TextField(
              controller: _searchController,
              decoration: InputDecoration(
                labelText: 'Search Stocks',
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                prefixIcon: Icon(Icons.search, color: Colors.blueAccent),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _isLoading ? null : _searchStocks,
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(vertical: 16.0), backgroundColor: Colors.blueAccent,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              ),
              child: _isLoading
                  ? CircularProgressIndicator(color: Colors.white)
                  : Text(
                'Search',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(height: 30),
            Expanded(
              child: _isLoading
                  ? LoadingIndicator()
                  : ListView.builder(
                itemCount: _stocks.length,
                itemBuilder: (context, index) {
                  return StockItem(stock: _stocks[index]);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

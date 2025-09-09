import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Bidding App',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const MaximumBid(),
    );
  }
}

class MaximumBid extends StatefulWidget {
  const MaximumBid({super.key});

  @override
  State<MaximumBid> createState() => _MaximumBidState();
}

class _MaximumBidState extends State<MaximumBid> {
  int currentBid = 0;

  void increaseBid() {
    setState(() {
      currentBid += 50;
    });
    _showSnackBar("Bid increased to \$$currentBid");
  }

  void decreaseBid() {
    if (currentBid > 0) {
      setState(() {
        currentBid -= 50;
      });
      _showSnackBar("Bid decreased to \$$currentBid");
    }
  }

  void resetBid() {
    setState(() {
      currentBid = 0;
    });
    _showSnackBar("Bid reset to \$$currentBid");
  }

  void _showSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message), duration: const Duration(seconds: 1)),
    );
  }

  Color _getBackgroundColor() {
    if (currentBid < 100) return Colors.green.shade100;
    if (currentBid < 300) return Colors.orange.shade100;
    return Colors.red.shade100;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _getBackgroundColor(),
      appBar: AppBar(
        title: const Text("Bidding Page"),
        centerTitle: true,
      ),
      body: Center(
        child: Card(
          elevation: 8,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          margin: const EdgeInsets.all(20),
          child: Padding(
            padding: const EdgeInsets.all(30.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text(
                  "Current Maximum Bid",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                ),
                const SizedBox(height: 15),
                Text(
                  "\$$currentBid",
                  style: const TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue),
                ),
                const SizedBox(height: 25),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton.icon(
                      onPressed: decreaseBid,
                      icon: const Icon(Icons.arrow_downward),
                      label: const Text("Decrease"),
                    ),
                    const SizedBox(width: 20),
                    ElevatedButton.icon(
                      onPressed: increaseBid,
                      icon: const Icon(Icons.arrow_upward),
                      label: const Text("Increase"),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: resetBid,
        tooltip: "Reset Bid",
        child: const Icon(Icons.refresh),
      ),
    );
  }
}

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Water Consumption Calculator',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: WaterCalculator(),
    );
  }
}

class WaterCalculator extends StatefulWidget {
  @override
  _WaterCalculatorState createState() => _WaterCalculatorState();
}

class _WaterCalculatorState extends State<WaterCalculator> {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Water Consumption Calculator'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              controller: _controller,
              decoration: InputDecoration(
                labelText: 'Enter water amount (ml)',
              ),
              keyboardType: TextInputType.number,
            ),
          ],
        ),
      ),
    );
  }
}

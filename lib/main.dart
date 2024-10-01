import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Water Molecule Calculator',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: WaterMoleculeCalculator(),
    );
  }
}

class WaterMoleculeCalculator extends StatefulWidget {
  @override
  _WaterMoleculeCalculatorState createState() => _WaterMoleculeCalculatorState();
}

class _WaterMoleculeCalculatorState extends State<WaterMoleculeCalculator> {
  final TextEditingController _controller = TextEditingController();
  String _result = '';

  void _calculateLightYears() {
    double volumeMl = double.tryParse(_controller.text) ?? 0.0;

    // Constants
    const double molarMass = 18.0; // g/mol for water
    const double avogadroNumber = 6.022e23; // molecules/mol
    const double moleculeLength = 0.275e-9; // meters
    const double lightYear = 9.461e15; // meters

    // Calculate the number of light-years
    double mass = volumeMl; // In grams (1 ml of water = 1 g)
    double moles = mass / molarMass; // moles of water
    double numberOfMolecules = moles * avogadroNumber; // number of molecules
    double totalLength = numberOfMolecules * moleculeLength; // total length in meters
    double lightYears = totalLength / lightYear; // convert to light-years

    setState(() {
      _result = 'Molecules lined up: ${lightYears.toStringAsFixed(2)} Lj';
      _controller.clear(); // Clear input field
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Water Molecule Calculator'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _controller,
              decoration: InputDecoration(
                labelText: 'Volume of water (ml)',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _calculateLightYears,
              child: Text('Calculate Light Years'),
            ),
            SizedBox(height: 20),
            Text(
              _result,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}

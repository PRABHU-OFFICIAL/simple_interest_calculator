import 'package:flutter/material.dart';

class SimpleInterestCalculator extends StatefulWidget {
  const SimpleInterestCalculator({super.key});

  @override
  State<SimpleInterestCalculator> createState() =>
      _SimpleInterestCalculatorState();
}

class _SimpleInterestCalculatorState extends State<SimpleInterestCalculator> {
  double _principalAmount = 200000;
  double _rateOfInterest = 3.5;
  double _timeInYears = 2;

  double _calculateSimpleInterest() {
    return (_principalAmount * _rateOfInterest * _timeInYears) / 100;
  }

  void updatePrincipalValue(double newValue) {
    setState(() {
      if (newValue >= 100000 && newValue <= 2500000) {
        _principalAmount = newValue;
      }
    });
  }

  void updateRateOfInterest(double newValue) {
    setState(() {
      if (newValue >= 3.5 && newValue <= 9) {
        _rateOfInterest = newValue;
      }
    });
  }

  void updateTimeInYears(double newValue) {
    setState(() {
      if (newValue >= 2 && newValue <= 6) {
        _timeInYears = newValue;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Simple Interest Calculator')),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text('Principal Amount : $_principalAmount'),
            Slider(
              value: _principalAmount,
              onChanged: updatePrincipalValue,
              onChangeEnd: (newValue) =>
                  updatePrincipalValue(newValue.clamp(100000, 2500000)),
              min: 100000,
              max: 2500000,
              divisions: 24,
              label: _principalAmount.toStringAsFixed(2),
            ),
            Text('Rate of Interest : $_rateOfInterest'),
            Slider(
              value: _rateOfInterest,
              onChanged: updateRateOfInterest,
              onChangeEnd: (newValue) =>
                  updateRateOfInterest(newValue.clamp(3.5, 9)),
              min: 3.5,
              max: 9,
              divisions: 11,
              label: _rateOfInterest.toStringAsFixed(2),
            ),
            Text('Time In Years : $_timeInYears'),
            Slider(
              value: _timeInYears,
              onChanged: updateTimeInYears,
              onChangeEnd: (newValue) =>
                  updateTimeInYears(newValue.clamp(2, 6)),
              min: 2,
              max: 6,
              divisions: 2,
              label: _timeInYears.toStringAsFixed(2),
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text("Simple Interest : "),
                  Text(_calculateSimpleInterest().toStringAsFixed(2))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

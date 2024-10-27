import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:bmi_calculator/result.dart'; // Import the ResultPage

class BMICalculator extends StatefulWidget {
  BMICalculator({super.key});

  @override
  State<BMICalculator> createState() => _BMICalculatorState();
}

class _BMICalculatorState extends State<BMICalculator> {
  final TextEditingController heightController = TextEditingController();
  final TextEditingController weightController = TextEditingController();
  String selectedGender = 'Male'; // Gender selection
  double bmi = 0.0;

  @override
  void dispose() {
    heightController.dispose();
    weightController.dispose();
    super.dispose();
  }

  void calculateBMI(BuildContext context) {
    if (heightController.text.isEmpty || weightController.text.isEmpty) {
      Fluttertoast.showToast(msg: "Please enter valid height and weight.");
      return;
    }

    double height = double.parse(heightController.text);
    double weight = double.parse(weightController.text);

    if (height == 0) {
      Fluttertoast.showToast(msg: "Height cannot be zero.");
      return;
    }
    setState(() {
      double height = double.parse(heightController.text) / 100; // Convert cm to meters
      double weight = double.parse(weightController.text);
      bmi = weight / (height * height);
    });

    // Determine the BMI category
    String bmiMessage;
    if (bmi >= 25) {
      bmiMessage = "You are overweight.";
    } else if (bmi < 18.5) {
      bmiMessage = "You are underweight.";
    } else {
      bmiMessage = "You have a normal weight.";
    }

    // Navigate to ResultPage with BMI result and message
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ResultPage(
          bmiResult: bmi.toStringAsFixed(2),
          bmiMessage: bmiMessage,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFA0522D),
        title: const Center(
          child: Text(
            'BMI CALCULATOR',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 25,
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const SizedBox(height: 20),

            // Gender selection radio buttons
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Radio<String>(
                  value: 'Male',
                  groupValue: selectedGender,
                  onChanged: (value) {
                    setState(() {
                      selectedGender = value!;
                    });
                  },
                ),
                const Text('Male'),
                Radio<String>(
                  value: 'Female',
                  groupValue: selectedGender,
                  onChanged: (value) {
                    setState(() {
                      selectedGender = value!;
                    });
                  },
                ),
                const Text('Female'),
              ],
            ),

            const SizedBox(height: 40),
            TextField(
              controller: heightController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Height (cm)',
                hintText: 'Enter your height in cm',
              ),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 20),
            TextField(
              controller: weightController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Weight (kg)',
                hintText: 'Enter your weight in kg',
              ),
              keyboardType: TextInputType.number,
            ),

            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => calculateBMI(context),
              child: const Text(
                'Calculate BMI',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
              style: ElevatedButton.styleFrom(backgroundColor: Color(0xFFA0522D)),
            ),
          ],
        ),
      ),
    );
  }
}

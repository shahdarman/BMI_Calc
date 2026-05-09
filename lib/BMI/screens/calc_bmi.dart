import 'package:bmi_calc/BMI/screens/input_data.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CalcBmi extends StatelessWidget {
  const CalcBmi({super.key, required this.bmi});
final double bmi;
  String getState() {
    if (bmi < 18.5) {
      return "Underweight";
    } else if (bmi >= 18.5 && bmi <= 24.9) {
      return "Normal ";
    } else if (bmi >= 25 && bmi <= 29.9) {
      return "Overweight";
    } else {
      return "Obese";
    }
  }
  Color getColor() {
    if (bmi < 18.5) {
      return Colors.red;
    } else if (bmi >= 18.5 && bmi <= 24.9) {
      return Colors.green;
    }
    else if (bmi >= 25 && bmi <= 29.9) {
      return Colors.orange;
    } else {
      return Colors.red;
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(
              context,
            );
          },
          icon: Icon(Icons.arrow_back_ios, color: Colors.white),
        ),
        backgroundColor: Color(0xff1A1F38),
        title: Text(
          'Your Result',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(5.0),
          child: Column(
            children: [
              Spacer(),

              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Color(0xff1A1F38),
                ),
                height: 540,
                width: double.infinity,
                child: Column(
                  children: [
                    SizedBox(height: 19),
                    Text(
                      getState(),
                      style: TextStyle(
                        color: getColor(),
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Spacer(),
                    Text(
                     "$bmi",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Spacer(),
                    Text(
                      "culees badan malihide is daji",
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                    SizedBox(height: 19),
                  ],
                ),
              ),
              Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}

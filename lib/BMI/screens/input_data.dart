import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../widget/custom_container.dart';
import '../widget/custom_container_gender.dart';
import 'calc_bmi.dart';

class InputData extends StatefulWidget {
  const InputData({super.key});

  @override
  State<InputData> createState() => _InputDataState();
}

class _InputDataState extends State<InputData> {
  String selectedGender = '';
  double hight = 150;

  int valuehight = 0;

  int valueweight = 0;

  void incrementWeight() {
    setState(() {
      if (valueweight < 200) valueweight++;
    });
  }

  void decrementWeight() {
    setState(() {
      if (valueweight > 0) valueweight--;
    });
  }

  void incrementHeight() {
    setState(() {
      if (valuehight < 220) valuehight++;
    });
  }

  void decrementHeight() {
    setState(() {
      if (valuehight > 0) valuehight--;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff1A1F38),
        title: Text(
          'BMI calculator ',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      backgroundColor: Color(0xff010918),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              SizedBox(height: 20),

              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Row(
                  children: [
                    CustomContainerGender(
                      icon: Icons.female,
                      tittle: 'Female',
                      isSelected: selectedGender == 'female',
                      onTap: () {
                        setState(() {
                          selectedGender = 'female';
                        });
                      },
                      selectedColor: Colors.pink,
                      unselectedColor: Color(0xff1A1F38),
                    ),
                    Spacer(),
                    CustomContainerGender(
                      icon: Icons.male,
                      tittle: 'Male',
                      isSelected: selectedGender == 'male',
                      onTap: () {
                        setState(() {
                          selectedGender = 'male';
                        });
                      },
                      selectedColor: Colors.blue,
                      unselectedColor: Color(0xff1A1F38),
                    ),
                  ],
                ),
              ),

              Spacer(),

              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Color(0xff1A1F38),
                ),

                width: double.infinity,
                alignment: Alignment.center,
                child: Column(
                  children: [
                    SizedBox(height: 10),

                    Text(
                      'Height',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      '$hight',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    Slider(
                      activeColor: Colors.red,
                      inactiveColor: Colors.white,
                      min: 150,
                      max: 220,
                      value: hight,
                      onChanged: (newvalue) {
                        setState(() {
                          hight = newvalue;
                        });
                      },
                    ),
                  ],
                ),
              ),

              Spacer(),

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    CustomContainer(
                      title: 'weight',
                      value: valueweight,
                      onIncrement: incrementWeight,
                      onDecrement: decrementWeight,
                      initialValue: valueweight,
                    ),

                    SizedBox(width: 40),
                    CustomContainer(
                      title: 'Age',
                      value: valuehight,
                      onIncrement: incrementHeight,
                      onDecrement: () {
                        decrementHeight();
                      },
                      initialValue: valuehight,
                    ),
                  ],
                ),
              ),

              Spacer(),

              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  minimumSize: Size(double.infinity, 60),
                ),
                onPressed: () {
                  double bmi =
                      valueweight / ((valuehight / 100) * (valuehight / 100));

                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => CalcBmi(bmi: bmi)),
                  );
                },
                child: Text("Calculate", style: TextStyle(color: Colors.white)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

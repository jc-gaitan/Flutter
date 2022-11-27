import 'package:flutter/material.dart';

void main() {
  runApp(new MaterialApp(
    home: MyStepper(),
  ));
}

class MyStepper extends StatefulWidget {
  @override
  _MyStepperState createState() => new _MyStepperState();
}

class _MyStepperState extends State<MyStepper> {
  int _curretStep = 0;

  List<Step> mySteps = [
    new Step(
      title: new Text("Paso 1"),
      content: new Text("Aprender Flutter"),
    ),
    new Step(
      title: new Text("Paso 2"),
      content: new Text("Desarrollar App"),
    ),
    new Step(
      title: new Text("Paso 3"),
      content: new Text("Publicar el App"),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Stepper"),
      ),
      body: new Container(
        child: new Stepper(
          //Nos indica cual es el paso actual del Stepper
          currentStep: this._curretStep,
          steps: mySteps,
          onStepContinue: () {
            setState(() {
              if (this._curretStep < mySteps.length - 1) {
                this._curretStep++;
              } else {
                this._curretStep = 0;
              }
            });
          },
          onStepCancel: () {
            setState(() {
              if (this._curretStep > 0) {
                this._curretStep--;
              } else {
                this._curretStep = 0;
              }
            });
          },
          onStepTapped: (step) {
            setState(() {
              this._curretStep = step;
            });
          },
        ),
      ),
    );
  }
}

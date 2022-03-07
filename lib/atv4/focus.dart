import 'dart:math';

import 'package:flutter/material.dart';

import '../Strings.dart';

class Foco extends StatefulWidget {
  const Foco({ Key? key }) : super(key: key);

  @override
  State<Foco> createState() => _FocoState();
}

class _FocoState extends State<Foco> {

  FocusNode field1 = FocusNode();
  FocusNode field2 = FocusNode();
  FocusNode field3 = FocusNode();
  FocusNode field4 = FocusNode();
  FocusNode field5 = FocusNode();
  Color corBase = Colors.green.shade900;
  Random random  = Random();
  int sorteado = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  AppBar(
        centerTitle: true,
        backgroundColor: corBase,
        title: const Text(Strings.appName2, 
        style: TextStyle(
          fontSize: 28,
        ),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 40),
        margin: const EdgeInsets.only(top:  25),
        child: ListView(
          children: [
            Text("${Strings.draw} $sorteado",
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: corBase
            ),
            ),

            SizedBox(height: 20,),

            TextField(
              keyboardType: TextInputType.text,
              focusNode: field1,
            ),

             TextField(
              keyboardType: TextInputType.text,
              focusNode: field2,
            ),

             TextField(
              keyboardType: TextInputType.text,
              focusNode: field3,
            ),

            TextField(
              keyboardType: TextInputType.text,
              focusNode: field4,
            ),

            TextField(
              keyboardType: TextInputType.text,
              focusNode: field5,
            ),

            const SizedBox(height: 20,),

            MaterialButton(
              color: corBase,
              onPressed: sortearFoco,
              child: const Text(Strings.appName2,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.white,
                 ),
              ),
              ),
          ],
        ),
      ),
    );
  }

  void sortearFoco() {
    int numero = random.nextInt(5) +1;

    while(numero == sorteado) {
      numero = random.nextInt(5) +1;
    }

    switch(numero) {
      case 1:
        FocusScope.of(context).requestFocus(field1);
        setState(() {
          sorteado = numero;
        });
        break;

        case 2:
        FocusScope.of(context).requestFocus(field2);
        setState(() {
          sorteado = numero;
        });
        break;

        case 3:
        FocusScope.of(context).requestFocus(field3);
        setState(() {
          sorteado = numero;
        });
        break;

        case 4:
        FocusScope.of(context).requestFocus(field4);
        setState(() {
          sorteado = numero;
        });
        break;

        case 5:
        FocusScope.of(context).requestFocus(field5);
        setState(() {
          sorteado = numero;
        });
        break;
    }
  }
}
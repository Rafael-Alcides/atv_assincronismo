import 'dart:ui';

import 'package:flutter/material.dart';

import '../Strings.dart';

class CalculadoraSimples extends StatefulWidget {
  const CalculadoraSimples({ Key? key }) : super(key: key);

  @override
  State<CalculadoraSimples> createState() => _CalculadoraSimplesState();
}

class _CalculadoraSimplesState extends State<CalculadoraSimples> {

  TextEditingController campoValor1 = TextEditingController(text:  "");
  TextEditingController campoValor2= TextEditingController(text:  "");
  num valor1 = 0, valor2 = 0, resultado = 0;
  Color corbase = Colors.grey.shade700;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          toolbarHeight: 100,
          backgroundColor: corbase,
          title: const Text(Strings.nameApp,
           style: TextStyle(
             fontSize: 28,
          ),),
        ),

        body:  Container(
          padding: const EdgeInsets.all(40),
          child: Column(
            children: [
              Text("${Strings.result} $resultado", 
              style:  TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: corbase,
              ),),
              const SizedBox(height: 20,),

               TextField(
                autofocus: true,
                keyboardType: TextInputType.number,
                decoration:  const InputDecoration(
                  hintText: Strings.labelvalor1
                ),
                controller: campoValor1,
              ),

               TextField(
                autofocus: true,
                keyboardType: TextInputType.number,
                decoration:  const InputDecoration(
                  hintText: Strings.labelvalor2
                ),
                controller: campoValor2,
              ),

              const SizedBox(height: 20,),

              Row(
                mainAxisAlignment:  MainAxisAlignment.spaceEvenly,
                children: [
                  MaterialButton(
                    color: corbase,
                    onPressed: somar ,
                    child: const Text(Strings.somar, 
                      style:  TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                      ),
                    ),

                    MaterialButton(
                    color: corbase,
                    onPressed: limparCampos ,
                    child: const Text(Strings.limpar, 
                      style:  TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                      ),
                    ),
                ],
              )
            ],
          ),
        ),

      ),
    );
  }

  

  void somar() {
    if(campoValor1.text == "") {
      setState(() {
        valor1 = 0;
      });
      return;
    }

  if(campoValor2.text == "") {
      setState(() {
        valor2 = 0;
      });
      return;
    }

    setState(() {
      valor1 = num.parse(campoValor1.text);
      valor2 = num.parse(campoValor2.text);

      resultado = valor1 + valor2;
    });
  }

  void limparCampos() {
    setState(() {
      valor1 = 0;
      valor2 = 0;
      resultado = 0;
      campoValor1.text = "";
      campoValor2.text = "";
    });
  }
}


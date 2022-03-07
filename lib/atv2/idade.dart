import 'dart:ui';
import 'package:flutter/material.dart';
import '../Strings.dart';

class Idade extends StatefulWidget {
  const Idade({ Key? key }) : super(key: key);

  @override
  State<Idade> createState() => _IdadeState();
}

class _IdadeState extends State<Idade> {

  Color corBase = Colors.blue;
  TextEditingController campo = TextEditingController(text:  "");
  int idade= 0;
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar:  AppBar(
          centerTitle: true,
          toolbarHeight:  100,
          backgroundColor:  corBase,
          title: const Text(Strings.appName1,
            style: TextStyle(
              fontSize: 28,
            ),
          ),
        ),
        body:  Container(
          padding:  const EdgeInsets.all(40),
          child: Column(
            children: [
              TextField(
                autofocus: true,
                keyboardType: TextInputType.number,
                decoration:  const InputDecoration(
                  hintText: Strings.entrada
                ),
                controller:  campo,
              ),
              const SizedBox(height: 20,),
    
              MaterialButton(
                color: corBase,
                onPressed:  verificarIdade,
                child: const Text(Strings.botao,
                style:  TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
                ),
    
              )
            ],
          ),
        ),
      );
  }

  void verificarIdade() {
    if(campo.text == "") {
      setState(() {
        idade = 0;
        mostrarMensagem(Strings.entrada);
      });
      return;
    }

    idade = int.parse(campo.text);

  
    if(idade < 16) {
      mostrarMensagem(Strings.deMenor);
    } else if(idade >= 18 && idade <= 65) {
      mostrarMensagem(Strings.deMaior);
    } else {
      mostrarMensagem(Strings.acimaIdade);
    }
  }

  void mostrarMensagem(String mensagem) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          content: Text(mensagem),
          actions: [
            TextButton(
              onPressed:  Navigator.of(context).pop,
               child: const Text(Strings.confimation),
               )
          ],
        );
      },
      );
  }
}
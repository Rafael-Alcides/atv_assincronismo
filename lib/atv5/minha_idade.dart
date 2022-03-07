import 'package:flutter/material.dart';

import '../Strings.dart';

class MinhaIdade extends StatefulWidget {
  const MinhaIdade({ Key? key }) : super(key: key);

  @override
  State<MinhaIdade> createState() => _MinhaIdadeState();
}

class _MinhaIdadeState extends State<MinhaIdade> {

  Color corBase = Colors.red;
  TextEditingController campoData = TextEditingController(text: Strings.info);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        toolbarHeight: 80,
        backgroundColor: corBase,
        title: const Text(Strings.appName3,
        style: TextStyle(
          fontSize: 28,
        ),
        ),
      ),

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(campoData.text,
            style:  TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: corBase,
            ),
            ),

            const SizedBox(height: 20,),

            MaterialButton(
              color: corBase,
              child: const Text(Strings.calendar,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
              ),
              onPressed: () {
                final agora = DateTime.now();
                showDatePicker(
                  context: context,
                  initialDate: agora,
                  firstDate: DateTime(1990),
                  lastDate: agora,

                  builder: (context, filhinho) => Theme(
                    child: Center(child: filhinho),
                    data: ThemeData().copyWith(
                      colorScheme: ColorScheme.light(
                        primary: corBase,
                      )
                    ), 
                    ),
                ).then((value) {
                  setState(() {
                    campoData.text = calcularIdade(value);
                  });
                }
                );
              },
              )

          ],
        ),
        ),
    );
  }

  String calcularIdade(dataInformada) {
    if(dataInformada != null) {
      DateTime dataAtual = DateTime.now();

      if(dataAtual.year > dataInformada.year) {
        if(dataAtual.month >= dataInformada.month) {
          if(dataAtual.day >= dataInformada.day) {
            return "${dataAtual.year - dataInformada.year } anos de vida";
          }
        }
      }
    }
    return "Data invalida";
  }
}
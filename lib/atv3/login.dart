import 'package:flutter/material.dart';

import '../Strings.dart';

class Login extends StatefulWidget {
  const Login({ Key? key }) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {

  TextEditingController campoUsuario = TextEditingController(text: "");
  TextEditingController campoSenha = TextEditingController(text: "");
  Color corBase = Colors.blue;
  bool mostrar = true;
  final String usuarioDB = "Marnei";
  final String senhaDB = "12345";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        margin: const EdgeInsets.only(top: 45),
        padding: const EdgeInsets.all(40),
        child: Column(
          children: [
            Text(Strings.login, 
            style: TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.bold,
              color: corBase,
            ),
            ),

            const SizedBox(height: 20,),

            TextField(
              controller: campoUsuario,
              autofocus: true,
              keyboardType: TextInputType.text,
              textCapitalization:  TextCapitalization.sentences,
              decoration:  const InputDecoration(
                fillColor: Colors.white,
                filled:  true,
                hintText: Strings.user
              ),
            ),

            const SizedBox(height: 20,),

            TextField(
              controller: campoSenha,
              obscureText: mostrar,
              autofocus: true,
              keyboardType: TextInputType.text,
              decoration: const InputDecoration(
                fillColor: Colors.white,
                filled: true,
                hintText: Strings.password
              ).copyWith(
                suffixIcon: IconButton(icon: Icon(
                  mostrar
                  ? Icons.visibility_rounded
                  : Icons.visibility_off_rounded,
                  color: corBase,
                ),
                onPressed: () {
                  setState(() {
                    mostrar = !mostrar;
                  });
                },
                ),
              ),
            ),

            const SizedBox(height: 20,),

            MaterialButton(
              color: corBase,
              onPressed: efetuarLogin,
              child: const Text(Strings.open,
              style: TextStyle(
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

  void efetuarLogin() {
    if(campoUsuario.text.isEmpty) {
      mostraMensagem(Strings.output);
      return;
    }

    if(campoSenha.text.isEmpty) {
      mostraMensagem(Strings.output2);
    }

    if(campoUsuario.text == usuarioDB && campoSenha.text == senhaDB) {
      mostraMensagem(Strings.output1);
    }else {
      mostraMensagem(Strings.output3);
    }
  }

  void mostraMensagem(String mensagem) {
    showDialog(
      context: context,
       builder: (context) {
         return AlertDialog(
           content: Text(mensagem),
         );
       }
       );
  }
}
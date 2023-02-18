import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:pruebas/button/button.dart';

import '../utils/inputfilds.dart';

class Calificacion extends StatefulWidget {
  const Calificacion({Key? key}) : super(key: key);

  @override
  State<Calificacion> createState() => _CalificacionState();
}

class _CalificacionState extends State<Calificacion> {
  TextEditingController _campoTexto = TextEditingController();
  TextEditingController _campoTexto2 = TextEditingController();
  TextEditingController _campoTexto3 = TextEditingController();
  final GlobalKey<FormState> _globalKey = GlobalKey<FormState>();
  int valor = 0;
  int valor2 = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
        body: Form(
      key: _globalKey,
      child: Padding(
          padding:
              const EdgeInsets.only(top: 8.0, bottom: 8.0, left: 15, right: 15),
          child: ListView(
              children: [
            InputFields.textInputFormField(
                context,
                "Ingrese un numero entre 1 y 20",
                TextInputType.number,
                _campoTexto,
                1, (item) {
              return item.length > 0 ? null : "Ingrese un numero";
            }),
                InputFields.textInputFormField(
                    context,
                    "Ingrese un numero entre 1 y 20",
                    TextInputType.number,
                    _campoTexto2,
                    1, (item) {
                  return item.length > 0 ? null : "Ingrese un numero";
                }),
                InputFields.textInputFormField(
                    context,
                    "Ingrese un texto...",
                    TextInputType.text,
                    _campoTexto3,
                    1, (item) {
                  return item.length > 0 ? null : "Ingrese un texto";
                }),
            ValidarBtn(),
          ])),
    ));
  }

  Widget ValidarBtn() {
    return SmallButtonWidget(
      title: "Validar",
      onPressed: _campoTexto == "" || _campoTexto == ""
          ? null
          : () {
              if (_globalKey.currentState!.validate()) {
                valor = int.parse(_campoTexto.text);
                valor2 = int.parse(_campoTexto2.text);
                if(valor>0 && valor2>0){
                  Fluttertoast.showToast(
                      msg: "Numero Perfecto: ${NumeroPerfecto(valor,valor2)}",
                      toastLength: Toast.LENGTH_SHORT,
                      gravity: ToastGravity.BOTTOM,
                      timeInSecForIosWeb: 1,
                      backgroundColor: Colors.red,
                      textColor: Colors.white,
                      fontSize: 14.0);

                }
                if(_campoTexto3.toString()!=null){
                  Fluttertoast.showToast(
                      msg: "Texto Invertido: ${InviertaLetras(_campoTexto3.text)}",
                      toastLength: Toast.LENGTH_SHORT,
                      gravity: ToastGravity.BOTTOM,
                      timeInSecForIosWeb: 1,
                      backgroundColor: Colors.red,
                      textColor: Colors.white,
                      fontSize: 14.0);

                }


                if (valor > 0 && valor < 21) {
                  if (valor <= 9) {
                    Fluttertoast.showToast(
                        msg: "Tu Calificacion E",
                        toastLength: Toast.LENGTH_SHORT,
                        gravity: ToastGravity.BOTTOM,
                        timeInSecForIosWeb: 1,
                        backgroundColor: Colors.red,
                        textColor: Colors.white,
                        fontSize: 14.0);
                  } else {
                    if (valor <= 12) {
                      Fluttertoast.showToast(
                          msg: "Tu Calificacion es D",
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.BOTTOM,
                          timeInSecForIosWeb: 1,
                          backgroundColor: Colors.red,
                          textColor: Colors.white,
                          fontSize: 14.0);
                    } else {
                      if (valor <= 15) {
                        Fluttertoast.showToast(
                            msg: "Tu Calificacion es C",
                            toastLength: Toast.LENGTH_SHORT,
                            gravity: ToastGravity.BOTTOM,
                            timeInSecForIosWeb: 1,
                            backgroundColor: Colors.red,
                            textColor: Colors.white,
                            fontSize: 14.0);
                      } else {
                        if (valor <= 18) {
                          Fluttertoast.showToast(
                              msg: "Tu Calificacion es B",
                              toastLength: Toast.LENGTH_SHORT,
                              gravity: ToastGravity.BOTTOM,
                              timeInSecForIosWeb: 1,
                              backgroundColor: Colors.red,
                              textColor: Colors.white,
                              fontSize: 14.0);
                        } else {
                          Fluttertoast.showToast(
                              msg: "Tu Calificacion es A",
                              toastLength: Toast.LENGTH_SHORT,
                              gravity: ToastGravity.BOTTOM,
                              timeInSecForIosWeb: 1,
                              backgroundColor: Colors.red,
                              textColor: Colors.white,
                              fontSize: 14.0);
                        }
                      }
                    }
                  }
                } else {
                  Fluttertoast.showToast(
                      msg: "Escribe un valor correcto",
                      toastLength: Toast.LENGTH_SHORT,
                      gravity: ToastGravity.BOTTOM,
                      timeInSecForIosWeb: 1,
                      backgroundColor: Colors.black,
                      textColor: Colors.white,
                      fontSize: 14.0);
                }
              }
            },
    );
  }


  //numero perfecto
  int NumeroPerfecto(int x, int y) {
    int divisorNumero(int n) {
      int sum = 0;
      for (int i = 1; i < n; i++) {
        if (n % i == 0) {
          sum += i;
        }
      }
      return sum;
    }

    for (int i = x; i < y; i++) {
      if (divisorNumero(i) == i) {
        return i;
      }
    }

    return -1;
  }

  //texto invertido
 String InviertaLetras(String letras){

   String input = letras;
   List<String> words = input.split(' ');
   words = words.reversed.toList();
   String reversedWords = words.join(' ');

   return reversedWords;
 }


}

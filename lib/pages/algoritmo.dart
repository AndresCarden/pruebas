import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../button/button.dart';
import '../utils/inputfilds.dart';



class Algoritmo extends StatefulWidget {
  const Algoritmo({Key? key}) : super(key: key);

  @override
  State<Algoritmo> createState() => _AlgoritmoState();
}

class _AlgoritmoState extends State<Algoritmo> {
  TextEditingController _campoTexto = TextEditingController();
  final GlobalKey<FormState> _globalKey = GlobalKey<FormState>();
  int BC = 0;
  int BV = 0;
  int BD = 0;
  int BCD2 = 0;
  int BM = 0;
  int C = 0;
  int valor = 0;



  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey,
        body: Form(
          key: _globalKey,
          child: Padding(
              padding:
              const EdgeInsets.only(top: 8.0, bottom: 8.0, left: 15, right: 15),
              child: ListView(children: [
                InputFields.textInputFormField(
                    context,
                    "Ingrese valor N",
                    TextInputType.number,
                    _campoTexto,
                    1, (item) {
                  return item.length > 0 ? null : "Ingrese un valor";
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

          if (valor> 0) {

              Fluttertoast.showToast(
                  msg: ValidarDatos(valor),
                  toastLength: Toast.LENGTH_SHORT,
                  gravity: ToastGravity.BOTTOM,
                  timeInSecForIosWeb: 1,
                  backgroundColor: Colors.red,
                  textColor: Colors.white,
                  fontSize: 14.0);
            }else{
            Fluttertoast.showToast(
                msg: "Escribe un valor diferente de 0",
                toastLength: Toast.LENGTH_SHORT,
                gravity: ToastGravity.BOTTOM,
                timeInSecForIosWeb: 1,
                backgroundColor: Colors.red,
                textColor: Colors.white,
                fontSize: 14.0);

          }
          } else {
            Fluttertoast.showToast(
                msg: "Escribe un valor correcto",
                toastLength: Toast.LENGTH_SHORT,
                gravity: ToastGravity.BOTTOM,
                timeInSecForIosWeb: 1,
                backgroundColor: Colors.red,
                textColor: Colors.white,
                fontSize: 14.0);
          }
        }
    );

  }

  String ValidarDatos(int valor){

    if(valor>=50000){
      BC = BC+1;
      C = C-50000;

    }
    if(valor>=20000){
      BV = BV+1;
      C = C-20000;

    }
    if(valor>=10000){
      BD = BD+1;
      C = C-10000;

    }
    if(valor>=5000){
      BCD2 = BCD2+1;
      C = C-5000;

    }
    if(valor>=1000){
      BM = BM+1;
      C = C-1000;
    }

    int Resto = C;

    return "Datos: ${valor} + ${BC} + ${BV} + ${BD} + ${BCD2} + ${BM} + ${Resto}";
  }
}




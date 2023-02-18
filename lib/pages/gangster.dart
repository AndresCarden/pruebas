import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:pruebas/button/button.dart';
import 'package:pruebas/utils/inputfilds.dart';


class Gangster extends StatefulWidget {
  const Gangster({Key? key}) : super(key: key);

  @override
  State<Gangster> createState() => _GangsterState();
}

class _GangsterState extends State<Gangster> {
  TextEditingController _numLayers = TextEditingController();
  final GlobalKey<FormState> _globalKey = GlobalKey<FormState>();
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
                    "Ingrese un numero ",
                    TextInputType.number,
                    _numLayers,
                    1, (item) {
                  return item.length > 0 ? null : "Ingrese un numero";
                }),
                ValidarBtn(),
              ])),
        ));
  }

  Widget ValidarBtn() {
    return SmallButtonWidget(
      title: "Validar",
      onPressed: _numLayers== "" || _numLayers == ""
          ? null
          : () {
        if (_globalKey.currentState!.validate()) {
          valor = int.parse(_numLayers.text);


          Fluttertoast.showToast(
              msg:  createMafiaNumero(valor),
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.BOTTOM,
              timeInSecForIosWeb: 10,
              backgroundColor: Colors.red,
              textColor: Colors.white,
              fontSize: 10.0);


          } else {
            Fluttertoast.showToast(
                msg: "O_o",
                toastLength: Toast.LENGTH_SHORT,
                gravity: ToastGravity.BOTTOM,
                timeInSecForIosWeb: 1,
                backgroundColor: Colors.red,
                textColor: Colors.white,
                fontSize: 14.0);
          }
      },
    );
  }




  String createMafiaNumero(int valor) {
    if (valor < 1 || valor> 255) {
      return "( O_o)";
    }
    if (valor % 2 == 0) {
      valor--;
    }
    String completa= "(-_-)";
    String media = "_-)";
    String parcial = "-_-)";
    String incompleta = "-)";
    String mafiaValor = "";

    if (valor < 7) {
      return "( O_o)";
    } else if (valor == 7) {
      mafiaValor = completa;
    } else {
      mafiaValor += completa;
      for (int i = 0; i < (valor - 7) / 6; i++) {
        mafiaValor = media + mafiaValor + media;
        mafiaValor = parcial + mafiaValor.substring(3, mafiaValor.length);
        mafiaValor = parcial + mafiaValor.substring(0, mafiaValor.length - 3);
      }
      mafiaValor = incompleta + mafiaValor + incompleta;
    }
    return mafiaValor;
  }











}

import 'package:flutter/material.dart';
import 'package:app_calcula_data/menu.dart';
import 'dart:async';


class TelaSegundos extends StatefulWidget {
  @override
  _TelaSegundosState createState() => _TelaSegundosState();
}

class _TelaSegundosState extends State<TelaSegundos> {

  String resultado = 'Informe as Datas';
  String secunds;
  double secondsDouble;
  double secondsPositivo;
  int segundos;

  DateTime _dateinicial = new DateTime.now();
  DateTime _datefinal = new DateTime.now();

  Future<Null> _selectDateInicial(BuildContext context) async {
    final DateTime pickedinicial = await showDatePicker(
        context: context,
        initialDate: _dateinicial,
        firstDate: DateTime(1900),
        lastDate: DateTime(2200)
    );
    if (pickedinicial != null && pickedinicial != _dateinicial) {
      print('Data Inicial: ${_dateinicial.toString()}');
      setState(() {
        _dateinicial = pickedinicial;
      });
    }
  }
  Future<Null> _selectDateFinal(BuildContext context) async {
    final DateTime pickedfinal = await showDatePicker(
        context: context,
        initialDate: _datefinal,
        firstDate: DateTime(1900),
        lastDate: DateTime(2200)
    );
    if (pickedfinal != null && pickedfinal != _datefinal) {
      print('Data Final: ${_datefinal.toString()}');
      setState(() {
        _datefinal = pickedfinal;
      });
    }
  }

  void _limpardatas() {
    setState(() {
      _dateinicial = DateTime.now();
      _datefinal = DateTime.now();
      resultado = 'Informe as Datas';
    });
  }

  void  calcularDatas() {
    var diff = (_dateinicial.difference(_datefinal));

    // SEGUNDOS
    secunds = "${diff.inSeconds}";
    secondsDouble = double.parse(secunds);
    secondsPositivo = (secondsDouble).abs();
    segundos = secondsPositivo.floor();

    setState(() {
        if (segundos > 0) {
          if(segundos == 1) {
            resultado = " Diferença em:   "
                " $segundos Segundo";
          }else if(segundos > 1) {
            resultado = " Diferença em:   "
                " $segundos Segundos";
          }
        } else if(segundos == 0 || segundos < 0){
          resultado = " Data inválida, tente novamente!";
        }
      });
    }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pink,
        title: Text('Data em Segundos'),
        centerTitle: true,
        actions: <Widget>[
          IconButton(icon: Icon(Icons.refresh),
            onPressed: (){_limpardatas();},)
        ],
      ),
      drawer: Menu(),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            TextField(
              textCapitalization: TextCapitalization.characters,
              decoration: InputDecoration(
                  labelText: 'Data Inicial: ${_dateinicial.toString() }'),
            ),
            RaisedButton(
                child: Text('Clique aqui',
                  style: TextStyle(color: Colors.black, fontSize: 18.0),),
                onPressed: () {
                  _selectDateInicial(context);
                }
            ),
            TextField(
              textCapitalization: TextCapitalization.characters,
              decoration: InputDecoration(
                  labelText: 'Data Final: ${_datefinal.toString()}'),
            ),
            RaisedButton(
                child: Text('Clique aqui',
                  style: TextStyle(color: Colors.black, fontSize: 18.0),),
                onPressed: () {
                  _selectDateFinal(context);
                }
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: Container(
                height: 50.0,
                child: RaisedButton(
                  child: Text("Calcular",
                    style: TextStyle(color: Colors.white, fontSize: 25.0),),
                  onPressed: () {
                    calcularDatas();
                  },
                  color: Colors.pink,
                ),
              ),
            ),
            Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: Stack(
                    children: <Widget>[
                      Text( resultado, style: TextStyle(color: Colors.black, fontSize: 20.0),
                        textAlign: TextAlign.center,),
                    ])
            )
          ],
        ),
      ),
    );
  }
}
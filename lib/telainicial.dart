import 'package:app_calcula_data/menu.dart';
import 'package:flutter/material.dart';
import 'dart:async';

class TelaInicial extends StatefulWidget {
  @override
  _TelaInicialState createState() => _TelaInicialState();
}

class _TelaInicialState extends State<TelaInicial> {
  String resultado = 'Informe as Datas';
  String resultado2 = '';
  String resultado3= '';
  String resultado4 = '';
  String resultado5 = '';

  //segundos = 0,0166667;
  //int minutos = 60; // 1 minuto convertido em segundos
  //int horas = 3600; // 1 hora convertido em segundos
  int dia = 86400; // 1 dia convertido em segundos
  int semanas = 604800; // 7 dias convertido em segundos
  int meses = 2592000; // 30 dias convertido em segundos
  int ano = 31536000; // 1 ano convertido em segundos

  // DIAS
  String day;
  double dayDouble;
  double dayPositivo;
  int dias;

  String secunds;
  double secondsDouble;
  double secondsPositivo;
  int segundos;

  double year;
  double doubleYear;
  int anos;

  int xdias;

  double mes;
  double months;
  int monthsresult;
  int xmeses;

  double week;
  double weekks;
  int weekresult;
  int xweek;

  double dayss;
  double dayyss;
  int dayresult;
  int xdays;

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
      resultado2 = "";
      resultado3 = "";
      resultado4 = "";
      resultado5 = "";
    });
  }

  void  calcularDatas() {
    var diff = (_dateinicial.difference(_datefinal));

    // DIAS
    day = "${diff.inDays}"; //Recebe a diferença em dias, porém do tipo String
    dayDouble = double.parse(day); // Converte de String para double
    dayPositivo = (dayDouble).abs(); // Converte o double negativo para positivo
    dias = dayPositivo.floor(); // Converte double para inteiro

    // SEGUNDOS
    secunds = "${diff.inSeconds}";
    secondsDouble = double.parse(secunds);
    secondsPositivo = (secondsDouble).abs();
    segundos = secondsPositivo.floor();

    //if (segundos >= ano) {
    // ANO
    year = segundos / ano;
    doubleYear = year.abs();
    anos = doubleYear.floor();
    // xdias = recebe a diferença de (segundos menos o valor de anos multiplicado por ano)
    xdias = segundos - (anos * ano);

    // MESES
    mes = xdias / meses;
    months = mes.abs();
    monthsresult = months.floor();
    // xmeses = recebe a diferença de (xdias menos o valor de monthsresult multiplicado por meses)
    xmeses = xdias - (monthsresult * meses);

    // SEMANAS
    week = xmeses / semanas;
    weekks = week.abs();
    weekresult = weekks.floor();
    // xdias = recebe a diferença de (segundos menos o valor de anos multiplicado por ano)
    xweek = xmeses - (weekresult * semanas);

    // DIAS
    dayss = xweek / dia;
    dayyss = dayss.abs();
    dayresult = dayyss.floor();

    xdays = xweek - (dayresult * dia);

    setState(() {

      if (segundos >= ano) {
        if(anos == 1){
          resultado = " Diferença em:   "
              " $anos Ano  ";
        } if(anos > 1) {
          resultado = " Diferença em:   "
              " $anos Anos  ";
        } if (monthsresult > 1) {
          resultado2 = " $monthsresult Meses  ";
        } if(monthsresult == 1){
          resultado2 = " $monthsresult Mes  ";
        } if (monthsresult == 0){
          resultado2 = "";
        } if (weekresult > 1) {
          resultado3 = " $weekresult Semanas  ";
        }  if(weekresult == 1){
          resultado3 = " $weekresult Semana  ";
        } if (weekresult == 0){
          resultado3 = "";
        } if (dayresult > 1) {
          resultado4 = " $dayresult Dias  ";
        }if (dayresult == 1){
          resultado4 = " $dayresult Dia  ";
        } if (dayresult == 0){
          resultado4 = "";
        }
        resultado5 = " A diferença total é $dias dias ";

      } else if(segundos < ano){
        resultado = " Diferença em:   ";
        if (monthsresult > 1) {
          resultado2 = " $monthsresult Meses ";
        } if(monthsresult == 1){
          resultado2 = " $monthsresult Mes ";
        } if (monthsresult == 0){
          resultado2 = "";
        } if (weekresult > 1) {
          resultado3 = " $weekresult Semanas ";
        }  if(weekresult == 1){
          resultado3 = " $weekresult Semana ";
        } if (weekresult == 0){
          resultado3 = "";
        } if (dayresult > 1) {
          resultado4 = " $dayresult Dias ";
        }if (dayresult == 1){
          resultado4 = " $dayresult Dia ";
        } if (dayresult == 0){
          resultado4 = "";
        }
        resultado5 = " A diferença total é $dias dias";

      } else if(segundos == null && segundos == 0 && ano == 0 && monthsresult == 0
          && weekresult == 0 && dayresult == 0){
        resultado = "Data inválida, tente novamente!";
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pink,
        title: Text('Calculadora de Datas'),
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
                      Text( " $resultado "" $resultado2 " " $resultado3 " " $resultado4 " " $resultado5 ",
                        style: TextStyle(color: Colors.black, fontSize: 20.0),
                        textAlign: TextAlign.center,),
                    ])
            )
          ],
        ),
      ),
    );
  }
}
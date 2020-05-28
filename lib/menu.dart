import 'package:flutter/material.dart';


class Menu extends StatelessWidget {
  const Menu({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            decoration: BoxDecoration(color: Colors.pink),
            child: Text("Calculadora "+ " de Datas",
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 40.0,
                    color: Colors.white,
                    fontStyle: FontStyle.normal)),
          ),
          ListTile(
            title: Text("Converter uma Data em: ",
              style: TextStyle(fontSize: 18.0),)
            ),
          ListTile(
              title: Text("Ano, Mês, Semana e Dia",
                  style: TextStyle(fontSize: 15.0)),
              trailing: Icon(Icons.filter_1),
              onTap: () {
                Navigator.pushReplacementNamed(context, "/");
              }),
          ListTile(
              title: Text("Dias",
                  style: TextStyle(fontSize: 15.0)),
              trailing: Icon(Icons.filter_2),
              onTap: () {
                Navigator.pushReplacementNamed(context, "/TelaDias");
              }),
          ListTile(
              title: Text("Horas",
                  style: TextStyle(fontSize: 15.0)),
              trailing: Icon(Icons.filter_3),
              onTap: () {
                Navigator.pushReplacementNamed(context, "/TelaHoras");
              }),
          ListTile(
              title: Text("Minutos", style: TextStyle(fontSize: 15.0)),
              trailing: Icon(Icons.filter_4),
              onTap: () {
                Navigator.pushReplacementNamed(context, "/TelaMinutos");
              }),
          ListTile(
              title: Text("Segundos", style: TextStyle(fontSize: 15.0)),
              trailing: Icon(Icons.filter_5),
              onTap: () {
                Navigator.pushReplacementNamed(context, "/TelaSegundos");
              }),
          Divider(),
          ListTile(
              title: Text("SAIR", style: TextStyle(fontSize: 15.0)),
              trailing: Icon(Icons.assignment_return),
              onTap: () {
                Navigator.pushReplacementNamed(context, "/Sair");
              }),
          ListTile(
            title: Text("Autor: Wanderson A. Timóteo ",
                style: TextStyle(fontStyle: FontStyle.italic)),
          )
        ],
      ),
    );
  }
}
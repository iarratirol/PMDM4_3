import 'package:asincrona/services/mockapi.dart';
import 'package:flutter/material.dart';

void main() => runApp(const MyStatefulWidget());

class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({super.key});

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  static const String _title = 'Asynchronous calls';

//varibales para el num que sale en cada boton
  int _avion = 0;
  int _coche = 0;
  int _persona = 0;

//Segundos que tarda cada boton
  int _segAvion = 0;
  int _segCoche = 0;
  int _segPersona = 0;

//Tamaño de la barras
  int _tamanoAvion = 0;
  int _tamanoCoche = 0;
  int _tamanoPersona = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: const Text(_title),
          ),
          body: Center(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              CircleAvatar(
                radius: 30,
                backgroundColor: Color.fromARGB(255, 148, 213, 0),
                child: IconButton(
                  icon: const Icon(
                    Icons.flight,
                    color: Colors.black,
                  ),
                  onPressed: () {
                    cargarAvion();
                  },
                ),
              ),
              Center(
                child: AnimatedContainer(
                  width: _tamanoAvion.toDouble(),
                  height: 10.0,
                  color: Color.fromARGB(255, 148, 213, 0),
                  duration: Duration(seconds: _segAvion),
                  curve: Curves.linear,
                ),
              ),
              Text('$_avion'),
              CircleAvatar(
                radius: 30,
                backgroundColor: Color.fromARGB(255, 237, 162, 0),
                child: IconButton(
                  icon: const Icon(
                    Icons.directions_car,
                    color: Colors.black,
                  ),
                  onPressed: () {
                    cargarCoche();
                  },
                ),
              ),
              Center(
                child: AnimatedContainer(
                  width: _tamanoCoche.toDouble(),
                  height: 10.0,
                  color: Color.fromARGB(255, 237, 162, 0),
                  duration: Duration(seconds: _segCoche),
                  curve: Curves.linear,
                  // onEnd: () => avion_selected = false,
                ),
              ),
              Text('$_coche'),
              CircleAvatar(
                radius: 30,
                backgroundColor: Color.fromARGB(255, 213, 0, 0),
                child: IconButton(
                  icon: const Icon(
                    Icons.run_circle,
                    color: Colors.black,
                  ),
                  onPressed: () {
                    cargarPersona();
                  },
                ),
              ),
              Center(
                child: AnimatedContainer(
                  width: _tamanoPersona.toDouble(),
                  height: 10.0,
                  color: Color.fromARGB(255, 213, 0, 0),
                  duration: Duration(seconds: _segPersona),
                  curve: Curves.linear,
                  // onEnd: () => avion_selected = false,
                ),
              ),
              Text('$_persona'),
            ],
          ))),
    );
  }

//Funcion para cargar  la barra del avion
  Future<void> cargarAvion() async {
    setState(() {
      _segAvion = 1;
      _tamanoAvion = 200;
    });
    int numero = await MockApi().getFerrariInteger();
    setState(() {
      _avion = numero;
      _segAvion = 0;
      _tamanoAvion = 0;
    });
  }

//Funcion para cargar  la barra del coche
  Future<void> cargarCoche() async {
    setState(() {
      _segCoche = 3;
      _tamanoCoche = 200;
    });
    int numero = await MockApi().getHyundaiInteger();
    setState(() {
      _coche = numero;
      _segCoche = 0;
      _tamanoCoche = 0;
    });
  }

//Funcion para cargar  la barra de la persona
  Future<void> cargarPersona() async {
    setState(() {
      _segPersona = 10;
      _tamanoPersona = 600;
    });
    int numero = await MockApi().getHyundaiInteger();
    setState(() {
      _persona = numero;
      _segPersona = 0;
      _tamanoPersona = 0;
    });
  }
}

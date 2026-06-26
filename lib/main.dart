import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Calculadora(),
    );
  }
}

class Calculadora extends StatefulWidget{

const Calculadora({super.key});
  @override

  State<StatefulWidget> createState(){
    return CalculadoraState();
  }
  
}

class CalculadoraState extends State<Calculadora>{

final numA = TextEditingController();
final numB = TextEditingController();
Color cinza = Color.fromARGB(255, 180, 184, 190);
String resultado = 'o resultado sera aqui';
String imc = '';



void calcular(){
  double altura = double.parse(numA.text);
  double peso = double.parse(numB.text);
  double total = 0;
  String mensagem = '';
  Color mudar = const Color.fromARGB(255, 180, 184, 190);
  total = peso/(altura*altura);
  
  if (total < 18.5) {
  mensagem = 'IMC baixo';
  mudar = const Color.fromARGB(255, 230, 203, 54);
} else if (total <= 24.9) {
  mensagem = 'IMC normal';
  mudar = const Color.fromARGB(255, 128, 224, 109);
} else {
  mensagem = 'IMC elevado';
  mudar = const Color.fromARGB(255, 193, 94, 94);
}
  setState(() {
    resultado = total.toStringAsFixed(2);
    imc = mensagem;
    cinza = mudar;
  });
}
  @override
  Widget build(BuildContext context){

    return Scaffold(
      
      appBar: AppBar(
        centerTitle: true,
        foregroundColor: Color.fromARGB(255, 255, 255, 255),
        title: Text('Calculadora de IMC',),
        backgroundColor: const Color.fromARGB(255, 72, 97, 211),
      ),
      body: Container(
  decoration: const BoxDecoration(
    gradient: LinearGradient(
      colors: [
        Color.fromARGB(255, 190, 187, 188),
        Color.fromARGB(255, 255, 255, 255),
      ],
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
    ),
  ),
  child: Center(
    child: SizedBox(
      width: 360,
      height: 470,
      child: Card(
        elevation: 10,
        shadowColor: Colors.black38,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [

              const Text(
                "Calcular IMC",
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 64, 51, 147),
                ),
              ),

              TextField(
                controller: numA,
                keyboardType: TextInputType.numberWithOptions(decimal: true),
                inputFormatters: [
                 FilteringTextInputFormatter.allow(RegExp(r'[0-9,.]')),
                ],
                decoration: InputDecoration(
                  labelText: "Digite a altura",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),

              TextField(
                controller: numB,
                keyboardType: TextInputType.numberWithOptions(decimal: true),
                inputFormatters: [
                 FilteringTextInputFormatter.allow(RegExp(r'[0-9,.]')),
                ],
                decoration: InputDecoration(
                  labelText: "Digite o peso",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),

              

              SizedBox(
                width: double.infinity,
                height: 55,
                child: ElevatedButton(
                  onPressed: calcular,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 41, 66, 176),
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: const Text(
                    "Calcular",
                    style: TextStyle(fontSize: 22),
                  ),
                ),
              ),

              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 180, 184, 190),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(
                  resultado,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: cinza,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(
                  imc,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    ),
  ),
),
        
        
      );
    
  }
}
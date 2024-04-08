import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
    home: AreaCalculator(),
  ));
}

class AreaCalculator extends StatefulWidget {
  const AreaCalculator({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _AreaCalculatorState createState() => _AreaCalculatorState();
}

class _AreaCalculatorState extends State<AreaCalculator> {
  final widthController = TextEditingController();
  final heightController = TextEditingController();
  String result = 'Задайте параметры';

  void calculateArea() {
    if (widthController.text.isEmpty || heightController.text.isEmpty) {
      setState(() {
        result = 'Задайте параметры';
      });
      showDialog(
        context: context,
        builder: (context) => const AlertDialog(
          title: Text('Ошибка'),
          content: Text('Пожалуйста, введите ширину и высоту.'),
        ),
      );
    } else {
      try {
        double width = double.parse(widthController.text);
        double height = double.parse(heightController.text);
        double area = width * height;
        setState(() {
          result = 'S = $width * $height = $area (мм)';
        });
        showDialog(
          context: context,
          builder: (context) => const AlertDialog(
            title: Text('Успех!'),
            content: Text('Расчет успешен.')
          ),
        );
      } catch (e) {
        setState(() {
          result = 'Задайте параметры';
        });
        showDialog(
          context: context,
          builder: (context) => const AlertDialog(
            title: Text('Ошибка!'),
            content: Text('Пожалуйста, введите действительные числовые значения.'),
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text('Калькулятор площади'),
      ),
      body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                TextField(
                  controller: widthController,
                  decoration: const InputDecoration(labelText: 'Ширина (мм)'),
                  keyboardType: TextInputType.number,
                ),
                const SizedBox(height: 10),
                TextField(
                  controller: heightController,
                  decoration: const InputDecoration(labelText: 'Высота (мм)'),
                  keyboardType: TextInputType.number,
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: calculateArea,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                  ),
                  child: const Text('Расчитать'),
                ),
                Text(result),
              ]
          )
      ),
    );
  }
}

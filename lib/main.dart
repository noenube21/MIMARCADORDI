import 'package:flutter/material.dart';
import 'package:marcador/screens/scoreboard_screen.dart';

// Inicio de la aplicación de Flutter
void main() {
  runApp(const MarcadorApp());
}

// configuración general

class MarcadorApp extends StatelessWidget {
  const MarcadorApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, 
      title: 'Marcador Deportivo',
      // Configuro el diseño en tema oscuro por defecto
      theme: ThemeData.dark(),
      // Indico cuál es la pantalla principal que se mostrará al abrir la aplicación
      home: const ScoreboardScreen(),
    );
  }
}
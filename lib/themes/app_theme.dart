import 'package:flutter/material.dart';

class AppTheme {
  // Color general de fondo oscuro para las pantallas
  static const Color backgroundColor = Color(0xFF121417);
  
  // Color azul asignado al equipo local
  static const Color localColor = Color(0xFF3B82F6);
  
  // Color rojo asignado al equipo visitante
  static const Color visitColor = Color(0xFFEF4444);

  static ThemeData get darkTheme {
    return ThemeData(
      brightness: Brightness.dark,
      scaffoldBackgroundColor: backgroundColor,
      appBarTheme: const AppBarTheme(
        backgroundColor: backgroundColor,
        elevation: 0, 
      ),
    );
  }
}
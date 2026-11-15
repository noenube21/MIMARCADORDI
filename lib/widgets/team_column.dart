import 'package:flutter/material.dart';

// Reutilizo este codigo y dibuja la columna de cada equipo con sus botones y su marcador central
class TeamColumn extends StatelessWidget {
  final String teamName;
  final int score;
  final Color color;
  final VoidCallback onIncrement;
  final VoidCallback onDecrement;

  const TeamColumn({
    super.key,
    required this.teamName,
    required this.score,
    required this.color,
    required this.onIncrement,
    required this.onDecrement,
  });

  @override
  Widget build(BuildContext context) {
    final darkerColor = HSLColor.fromColor(color).withLightness((HSLColor.fromColor(color).lightness - 0.18).clamp(0.0, 1.0)).toColor();

    return Expanded(
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 4),
        decoration: BoxDecoration(
          color: color, // Color principal de fondo para el equipo
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          children: [
            // Botón superior para sumar puntos
            Expanded(
              flex: 2,
              child: IconButton(
                onPressed: onIncrement,
                icon: const Icon(Icons.add, size: 48, color: Colors.white),
              ),
            ),
            Expanded(
              flex: 4,
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.black.withValues(alpha: 0.25),
                ),
                child: Center(
                  child: Text(
                    '$score',
                    style: const TextStyle(fontSize: 76, fontWeight: FontWeight.bold, color: Colors.white),
                  ),
                ),
              ),
            ),
            // Botón inferior para restar puntos
            Expanded(
              flex: 2,
              child: IconButton(
                onPressed: onDecrement,
                icon: const Icon(Icons.remove, size: 48, color: Colors.white),
              ),
            ),
            // Franja inferior con el nombre del equipo
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 12),
              decoration: BoxDecoration(
                color: darkerColor,
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(16),
                  bottomRight: Radius.circular(16),
                ),
              ),
              child: Text(
                teamName,
                textAlign: TextAlign.center,
                style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.white, letterSpacing: 1),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:marcador/themes/app_theme.dart';

// Enseña la cabecera superior con un resumen de los puntos y el estado de ambos equipos
class ScoreBoardHeader extends StatelessWidget {
  final int localScore;
  final int visitScore;

  const ScoreBoardHeader({super.key, required this.localScore, required this.visitScore});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: const Color(0xFF1E2229), 
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.white24, width: 1),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Se muestran los puntos del equipo local
          Row(
            children: [
              Container(
                width: 8,
                height: 8,
                decoration: const BoxDecoration(
                  color: AppTheme.localColor,
                  shape: BoxShape.circle,
                ),
              ),
              const SizedBox(width: 6),
              const Text('LOCAL', style: TextStyle(color: AppTheme.localColor, fontWeight: FontWeight.bold, fontSize: 13)),
            ],
          ),
          // Recuadro central con la puntuación sincronizada de los dos equipos
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
            decoration: BoxDecoration(
              color: const Color(0xFF121417),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Row(
              children: [
                Text('$localScore', style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: AppTheme.localColor)),
                const Text('   vs   ', style: TextStyle(fontSize: 14, color: Colors.white54, fontWeight: FontWeight.bold)),
                Text('$visitScore', style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: AppTheme.visitColor)),
              ],
            ),
          ),
          // Se muestran los puntos del equipo visitante
          Row(
            children: [
              const Text('VISITA', style: TextStyle(color: AppTheme.visitColor, fontWeight: FontWeight.bold, fontSize: 13)),
              const SizedBox(width: 6),
              Container(
                width: 8,
                height: 8,
                decoration: const BoxDecoration(
                  color: AppTheme.visitColor,
                  shape: BoxShape.circle,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
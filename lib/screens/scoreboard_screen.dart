import 'package:flutter/material.dart';
import 'package:marcador/themes/app_theme.dart';
import 'package:marcador/widgets/score_board_header.dart';
import 'package:marcador/widgets/team_column.dart';

// Pantalla principal de la aplicación donde se muestra el marcador completo
class ScoreboardScreen extends StatefulWidget {
  const ScoreboardScreen({super.key});

  @override
  State<ScoreboardScreen> createState() => _ScoreboardScreenState();
}

class _ScoreboardScreenState extends State<ScoreboardScreen> {
  // Variables que guardan los puntos actuales de cada equipo
  int _localScore = 10;
  int _visitScore = 21;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Icono y Nombre del titulo 
      appBar: AppBar(
        title: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.sports_basketball, color: Colors.white, size: 22),
            SizedBox(width: 8),
            Text('MARCADOR', style: TextStyle(fontWeight: FontWeight.bold, letterSpacing: 1.2)),
          ],
        ),
      ),
      // Contenido principal
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            // Marcador superior actualizable junto con el de abajo
            ScoreBoardHeader(localScore: _localScore, visitScore: _visitScore),
            const SizedBox(height: 12),
            //espacio para los dos equipos
            Expanded(
              child: Row(
                children: [
                  // Columna equipo local
                  TeamColumn(
                    teamName: 'EQUIPO LOCAL',
                    score: _localScore,
                    color: AppTheme.localColor,
                    onIncrement: () => setState(() => _localScore++),
                    onDecrement: () => setState(() { if (_localScore > 0) _localScore--; }),
                  ),
                  // Columna equipo visitante
                  TeamColumn(
                    teamName: 'EQUIPO VISITA',
                    score: _visitScore,
                    color: AppTheme.visitColor,
                    onIncrement: () => setState(() => _visitScore++),
                    onDecrement: () => setState(() { if (_visitScore > 0) _visitScore--; }),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 12),
            // RESET para poner los marcadores a cero
            Container(
              width: double.infinity,
              height: 50,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                border: Border.all(color: Colors.white30, width: 1),
                color: const Color(0xFF1E2229),
              ),
              child: TextButton.icon(
                onPressed: () => setState(() {
                  _localScore = 0;
                  _visitScore = 0;
                }),
                icon: const Icon(Icons.refresh, color: Colors.white70),
                label: const Text('RESET', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, letterSpacing: 1)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
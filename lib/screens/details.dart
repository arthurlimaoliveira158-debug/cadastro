import 'package:flutter/material.dart';
import 'package:desafio_cadastro/components/importance.dart';

class TaskDetails extends StatelessWidget {
  final String nome;
  final int importancia;

const TaskDetails({
    super.key,
    required this.nome,
    required this.importancia,
  });
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text('Detalhes da Tarefa'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              nome,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            Importance(importanceLevel: importancia),
          ],
        ),
      ),
    );
  }
}
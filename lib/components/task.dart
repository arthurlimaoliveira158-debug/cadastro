import 'package:flutter/material.dart';
import 'package:desafio_cadastro/components/importance.dart';
import 'package:desafio_cadastro/screens/details.dart';

class Task extends StatefulWidget {
  final String nome;
  final int importancia;

  const Task(this.nome, this.importancia, {Key? key}) : super(key: key);

  @override
  State<Task> createState() => _TaskState();
}

class _TaskState extends State<Task> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => TaskDetails(
              nome: widget.nome,
              importancia: widget.importancia,
            ),
          ),
        );
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: const Color(0xFF1A1A1A),
            border: Border.all(
              color: const Color(0xFFE53935).withOpacity(0.4),
            ),
            boxShadow: [
              BoxShadow(
                color: const Color(0xFFE53935).withOpacity(0.15),
                blurRadius: 8,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: 220,
                      child: Text(
                        widget.nome,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ),
                    const SizedBox(height: 6),
                    Importance(importanceLevel: widget.importancia),
                  ],
                ),
                const Icon(
                  Icons.chevron_right,
                  color: Color(0xFFE53935),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
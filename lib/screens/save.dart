
import 'package:flutter/material.dart';
import 'package:desafio_cadastro/data/task_inherited.dart';

class saveData extends StatefulWidget {
  const saveData({super.key});

  @override
  State<saveData> createState() => _saveDataState();
}

class _saveDataState extends State<saveData> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController importanceController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Adicionar Tarefa'),
        ),
        body: Center(
          child: SingleChildScrollView(
            child: Container(
              height: 650,
              width: 375,
              decoration: BoxDecoration(
                color: Colors.black12,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(width: 3),
              ),            
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      controller: nameController,
                      textAlign: TextAlign.center,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Nome',
                        fillColor: Colors.white70,
                        filled: true,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      keyboardType: TextInputType.number,
                      controller: importanceController,
                      textAlign: TextAlign.center,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Importância',
                        fillColor: Colors.white70,
                        filled: true,                     
                      ),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                        TaskInherited.of(context).onAddTask(
                            nameController.text,
                            int.parse(importanceController.text));
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Criando uma nova Tarefa'),
                          ),
                        );
                        Navigator.pushReplacementNamed(context, "list");
                    },
                    child: Text('Adicionar!'),
                  ),
                ],
              ),  
            ),
          ),
        ),
      ),
    );
  }
}
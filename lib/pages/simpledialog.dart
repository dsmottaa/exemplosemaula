import 'package:flutter/material.dart';

class SimpleDialogPage extends StatefulWidget {
  const SimpleDialogPage({super.key});

  @override
  State<SimpleDialogPage> createState() => _SimpleDialogPageState();
}

class _SimpleDialogPageState extends State<SimpleDialogPage> {
  String _idiomaSelecionado = 'Nenhum idioma selecionado';

  void _exibirSimpleDialog() {
    showDialog<String>(
      context: context,
      builder: (BuildContext context) {
        return SimpleDialog(
          title: const Text('Selecione o idioma'),
          children: <Widget>[
            SimpleDialogOption(
              onPressed: () {
                Navigator.pop(context, 'Português');
              },
              child: const Padding(
                padding: EdgeInsets.symmetric(vertical: 8.0),
                child: Text('Português', style: TextStyle(fontSize: 16)),
              ),
            ),
            SimpleDialogOption(
              onPressed: () {
                Navigator.pop(context, 'Inglês');
              },
              child: const Padding(
                padding: EdgeInsets.symmetric(vertical: 8.0),
                child: Text('Inglês', style: TextStyle(fontSize: 16)),
              ),
            ),
            SimpleDialogOption(
              onPressed: () {
                Navigator.pop(context, 'Espanhol');
              },
              child: const Padding(
                padding: EdgeInsets.symmetric(vertical: 8.0),
                child: Text('Espanhol', style: TextStyle(fontSize: 16)),
              ),
            ),
          ],
        );
      },
    ).then((valorEscolhido) {
      if (valorEscolhido != null) {
        setState(() {
          _idiomaSelecionado = 'Idioma escolhido: $valorEscolhido';
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        title: const Text('Exemplo SimpleDialog'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton.icon(
                onPressed: _exibirSimpleDialog,
                icon: const Icon(Icons.language),
                label: const Text('Escolher Idioma'),
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 24,
                    vertical: 12,
                  ),
                ),
              ),
              const SizedBox(height: 24),
              Text(
                _idiomaSelecionado,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

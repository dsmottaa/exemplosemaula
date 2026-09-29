import 'package:flutter/material.dart';
import '../styles/bottomsheet_styles.dart';

class BottomSheetPage extends StatefulWidget {
  const BottomSheetPage({super.key});

  @override
  State<BottomSheetPage> createState() => _BottomSheetPageState();
}

class _BottomSheetPageState extends State<BottomSheetPage> {
  String _opcaoSelecionada = 'Nenhuma opção selecionada';

  void _mostrarSnackBar(String mensagem) {
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(mensagem),
        duration: const Duration(seconds: 2),
      ),
    );
  }

  void _exibirBottomSheet() {
    showModalBottomSheet(
      context: context,
      shape: BottomSheetStyles.formatoBorda,
      builder: (BuildContext context) {
        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min, // Ocupa apenas a altura do conteúdo
            children: [
              const Text(
                'Opções Rápida',
                style: BottomSheetStyles.tituloEstilo,
              ),
              const SizedBox(height: 12),
              ListTile(
                leading: const Icon(Icons.share, color: Colors.blue),
                title: const Text('Compartilhar'),
                onTap: () {
                  Navigator.pop(context);
                  setState(() {
                    _opcaoSelecionada = 'Opção: Compartilhar';
                  });
                  _mostrarSnackBar('Compartilhar selecionado!');
                },
              ),
              ListTile(
                leading: const Icon(Icons.link, color: Colors.blue),
                title: const Text('Copiar link'),
                onTap: () {
                  Navigator.pop(context);
                  setState(() {
                    _opcaoSelecionada = 'Opção: Copiar link';
                  });
                  _mostrarSnackBar('Link copiado com sucesso!');
                },
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        title: const Text('Exemplo BottomSheet'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton.icon(
                onPressed: _exibirBottomSheet,
                icon: const Icon(Icons.more_vert),
                label: const Text('Mais opções'),
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 24,
                    vertical: 12,
                  ),
                ),
              ),
              const SizedBox(height: 24),
              Text(
                _opcaoSelecionada,
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

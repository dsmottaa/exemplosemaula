import 'package:flutter/material.dart';
import '../styles/alertdialog_styles.dart';

class AlertDialogPage extends StatefulWidget {
  const AlertDialogPage({super.key});

  @override
  State<AlertDialogPage> createState() => _AlertDialogPageState();
}

class _AlertDialogPageState extends State<AlertDialogPage> {
  String _resultado = 'Nenhum item excluído';

  void _exibirAlertDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text(
            'Atenção',
            style: AlertDialogStyles.tituloEstilo,
          ),
          content: const Text(
            'Deseja realmente excluir este item? Esta ação não poderá ser desfeita.',
            style: AlertDialogStyles.mensagemEstilo,
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context); // Fecha o diálogo
                setState(() {
                  _resultado = 'Exclusão cancelada';
                });
              },
              child: const Text(
                'Cancelar',
                style: AlertDialogStyles.botaoCancelarEstilo,
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context); // Fecha o diálogo
                setState(() {
                  _resultado = 'Item excluído com sucesso!';
                });
              },
              child: const Text(
                'Excluir',
                style: AlertDialogStyles.botaoConfirmarEstilo,
              ),
            ),
          ],
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
        title: const Text('Exemplo AlertDialog'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton.icon(
                onPressed: _exibirAlertDialog,
                icon: const Icon(Icons.delete, color: Colors.red),
                label: const Text('Excluir item'),
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 24,
                    vertical: 12,
                  ),
                ),
              ),
              const SizedBox(height: 24),
              Text(
                _resultado,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

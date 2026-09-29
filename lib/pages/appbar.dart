import 'package:flutter/material.dart';
import '../styles/appbar_styles.dart';

class AppBarPage extends StatelessWidget {
  const AppBarPage({super.key});

  void _mostrarSnackBar(BuildContext context, String mensagem) {
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(mensagem),
        duration: const Duration(seconds: 2),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.menu),
          onPressed: () {
            _mostrarSnackBar(context, 'Menu lateral pressionado!');
          },
        ),
        title: const Text(
          'Exemplo AppBar',
          style: AppBarStyles.tituloEstilo,
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            tooltip: 'Buscar',
            onPressed: () {
              _mostrarSnackBar(context, 'Ícone Lupa (Busca) foi tocado!');
            },
          ),
          IconButton(
            icon: const Icon(Icons.favorite),
            tooltip: 'Favoritos',
            onPressed: () {
              _mostrarSnackBar(context, 'Ícone Coração (Favoritos) foi tocado!');
            },
          ),
        ],
      ),
      body: const Center(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Text(
            'Barra sem elevação (elevation: 0), título centralizado e em negrito, '
            'ícone de menu à esquerda e dois ícones à direita (lupa e coração).',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 16),
          ),
        ),
      ),
    );
  }
}

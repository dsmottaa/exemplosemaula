import 'package:flutter/material.dart';

import 'pages/alertdialog.dart';
import 'pages/appbar.dart';
import 'pages/bottomsheet.dart';
import 'pages/drawer.dart';
import 'pages/simpledialog.dart';

void main() {
  runApp(const MeuAplicativo());
}

class MeuAplicativo extends StatelessWidget {
  const MeuAplicativo({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Exemplos em Aula',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: const MenuPrincipalPage(),
    );
  }
}

class MenuPrincipalPage extends StatelessWidget {
  const MenuPrincipalPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Exemplos da Aula'),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        centerTitle: true,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          const Text(
            'Selecione uma aula/exemplo para visualizar:',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 16),
          _buildItemMenu(
            context,
            titulo: 'Bloco 1: Exemplo AppBar',
            subtitulo: 'Título centralizado, busca e favorito (elevation: 0)',
            icone: Icons.web_asset,
            cor: Colors.blue,
            pagina: const AppBarPage(),
          ),
          _buildItemMenu(
            context,
            titulo: 'Bloco 2: Exemplo Drawer',
            subtitulo: 'Menu lateral deslizante com DrawerPage',
            icone: Icons.menu_open,
            cor: Colors.blue,
            pagina: const DrawerPage(),
          ),
          _buildItemMenu(
            context,
            titulo: 'Bloco 3: Exemplo AlertDialog',
            subtitulo: 'Diálogo de confirmação para excluir item',
            icone: Icons.warning_amber_rounded,
            cor: Colors.orange,
            pagina: const AlertDialogPage(),
          ),
          _buildItemMenu(
            context,
            titulo: 'Bloco 3: Exemplo SimpleDialog',
            subtitulo: 'Diálogo para escolha simples de idioma',
            icone: Icons.list_alt,
            cor: Colors.teal,
            pagina: const SimpleDialogPage(),
          ),
          _buildItemMenu(
            context,
            titulo: 'Bloco 3: Exemplo BottomSheet',
            subtitulo: 'Painel deslizante de baixo com mais opções',
            icone: Icons.vertical_align_top,
            cor: Colors.purple,
            pagina: const BottomSheetPage(),
          ),
        ],
      ),
    );
  }

  Widget _buildItemMenu(
    BuildContext context, {
    required String titulo,
    required String subtitulo,
    required IconData icone,
    required Color cor,
    required Widget pagina,
  }) {
    return Card(
      elevation: 2,
      margin: const EdgeInsets.only(bottom: 12),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: cor.withAlpha(50),
          child: Icon(icone, color: cor),
        ),
        title: Text(titulo, style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text(subtitulo),
        trailing: const Icon(Icons.chevron_right),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => pagina),
          );
        },
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewScreen extends StatefulWidget {
  const WebViewScreen(Set<Key?> set, {Key? key}) : super(key: key);

  @override
  State<WebViewScreen> createState() => _WebViewScreenState();
}

class _WebViewScreenState extends State<WebViewScreen> {
  late final WebViewController _controller;

  @override
  void initState() {
    super.initState();
    _controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..loadRequest(Uri.parse('https://jetbooks.com.br'));
  }

  void _onMenuSelected(String value) {
    if (value == 'fechar') {
      Navigator.of(context).pop();
    } else if (value == 'sobre') {
      showAboutDialog(
        context: context,
        applicationName: 'JETBooks',
        applicationVersion: '1.0.0',
        children: const [
          SizedBox(height: 8),
          Text('Carregamento webview do site jetbooks.com.br.'),
          Text('DougGS Engenharia de Software'),
          Text('Versão: 1.0.0'),
          Text(''),
          Text('Douglas Gonçalves de Souza'),
          Text('E-mail: mail@dougg.com.br'),
          Text('Fone: +55 (11) 97526.1603 ou 97580.3656'),
        ],
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('JETBooks'),
        actions: [
          PopupMenuButton<String>(
            onSelected: _onMenuSelected,
            itemBuilder: (context) => const [
              PopupMenuItem(value: 'fechar', child: Text('Fechar')),
              PopupMenuItem(value: 'sobre', child: Text('Sobre')),
            ],
          ),
        ],
      ),
      body: WebViewWidget(controller: _controller),
    );
  }
}

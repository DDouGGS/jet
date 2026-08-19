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
        applicationName: 'douggs.com.br',
        applicationVersion: '1.0',
        children: const [
          SizedBox(height: 8),
          Text('Aplicativo que carrega o site douggs.com.br em um WebView.'),
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

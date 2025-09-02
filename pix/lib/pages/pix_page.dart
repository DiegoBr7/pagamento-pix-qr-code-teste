import 'dart:convert';
import 'package:flutter/material.dart';
import '../services/pix_service.dart';
import 'package:qr_flutter/qr_flutter.dart';

class PixPage extends StatefulWidget {
  @override
  State<PixPage> createState() => _PixPageState();
}

class _PixPageState extends State<PixPage> {
  final PixService pixService = PixService();
  bool _isLoading = false;

  @override
  void dispose() {
    pixService.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Gerar PIX"),
        backgroundColor: Colors.blue[700],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Campo chave PIX
            TextField(
              controller: pixService.pixController,
              decoration: const InputDecoration(
                labelText: "Chave PIX",
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.key),
              ),
            ),

            const SizedBox(height: 20),

            // Campo valor
            TextField(
              controller: pixService.valorController,
              decoration: const InputDecoration(
                labelText: "Valor (ex: 10.00)",
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.attach_money),
              ),
              keyboardType: TextInputType.numberWithOptions(decimal: true),
            ),

            const SizedBox(height: 30),

            ElevatedButton(
              onPressed: _isLoading
                  ? null
                  : () async {
                setState(() {
                  _isLoading = true;
                });

                final data = await pixService.gerarPix(context);

                setState(() {
                  _isLoading = false;
                });

                if (data != null) {
                  setState(() {});
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('PIX gerado com sucesso!')),
                  );
                }
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue[700],
                padding: const EdgeInsets.symmetric(vertical: 16),
              ),
              child: _isLoading
                  ? const SizedBox(
                width: 20,
                height: 20,
                child: CircularProgressIndicator(
                  color: Colors.white,
                  strokeWidth: 2,
                ),
              )
                  : const Text(
                "Gerar QR PIX",
                style: TextStyle(fontSize: 16),
              ),
            ),

            const SizedBox(height: 30),

            if (pixService.payload != null) ...[
              const Text(
                "QR Code PIX:",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 15),
              Center(
                child: Card(
                  elevation: 5,
                  child: Padding(
                    padding: const EdgeInsets.all(15),
                    child: Column(
                      children: [
                        QrImageView(
                          data: pixService.payload!,
                          version: QrVersions.auto,
                          size: 200,
                          backgroundColor: Colors.white,
                        ),
                        const SizedBox(height: 10),
                        const Text(
                          "Escaneie este QR Code para pagar",
                          style: TextStyle(fontStyle: FontStyle.italic),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),

              // Imagem gerada pelo backend (se disponível)
              if (pixService.qrBase64 != null) ...[
                const Text(
                  "Imagem gerada pelo servidor:",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10),
                Center(
                  child: Image.memory(
                    base64Decode(pixService.qrBase64!),
                    height: 200,
                    width: 200,
                  ),
                ),
                const SizedBox(height: 20),
              ],

              const Text(
                "Payload PIX:",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.grey[100],
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: Colors.grey[300]!),
                ),
                child: SelectableText(
                  pixService.payload!,
                  style: const TextStyle(fontFamily: 'monospace', fontSize: 12),
                ),
              ),
            ] else if (_isLoading) ...[
              const SizedBox(height: 30),
              const Center(
                child: CircularProgressIndicator(),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
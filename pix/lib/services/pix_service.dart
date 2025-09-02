import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class PixService {
  final TextEditingController pixController = TextEditingController();
  final TextEditingController valorController = TextEditingController();

  /// Garante que o valor seja enviado no formato 0.00 (duas casas decimais)
  String formatarValor(String valor) {
    if (valor.isEmpty) return "0.00";
    final v = double.tryParse(valor.replaceAll(",", ".")) ?? 0.0;
    return v.toStringAsFixed(2);
  }

  String? payload; // QR Code string
  String? qrBase64; // QR como imagem do backend

  void dispose() {
    pixController.dispose();
    valorController.dispose();
  }

  Future<Map<String, dynamic>?> gerarPix(BuildContext context) async {
    // Validação dos campos
    if (pixController.text.isEmpty || valorController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Preencha a chave PIX e o valor')),
      );
      return null;
    }

    try {

      // 👇 LOG para ver o que será enviado
      print("Enviando valor: ${valorController.text}");
      print("Chave PIX: ${pixController.text}");
      final response = await http.post(
        Uri.parse('http://10.0.2.2:8080/api/pix/create'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          'pixkey': pixController.text,
          'amount': formatarValor(valorController.text), // <<< aqui usamos formatarValor
          'txid': 'TX${DateTime.now().millisecondsSinceEpoch}',
          'merchantName': 'Minha Loja',
          'merchantCity': 'SAO PAULO',
        }),
      ).timeout(const Duration(seconds: 30));

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        payload = data['payload'];
        qrBase64 = data['qrcodeBase64'];

        // 👇 LOG do que o backend devolveu
        print("Payload recebido: $payload");

        return data;
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Erro ${response.statusCode}: ${response.body}')),
        );
        return null;
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Erro de conexão: $e')),
      );
      return null;
    }
  }
}

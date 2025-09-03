import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../services/pix_service.dart';
import 'package:qr_flutter/qr_flutter.dart';

class DoacaoPix extends StatefulWidget {
  const DoacaoPix({super.key});

  @override
  State<DoacaoPix> createState() => _DoacaoPixState();
}

class _DoacaoPixState extends State<DoacaoPix> {
  TextEditingController pixController = TextEditingController();
  final PixService pixService = PixService();
  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text(
          "Doações",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.green[500],
            fontSize: 22,
          ),
        ),

        bottom: PreferredSize(
          preferredSize: Size.fromHeight(4.0),
          child: Container(
            height: 7.0,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.black.withOpacity(0.2),
                  Colors.black.withOpacity(0.05),
                  Colors.transparent,
                ],
              ),
            ),
          ),
        ),
      ),

      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(left: 30),
                child: Text(
                  "Contribua com o nosso trabalho",
                  style: TextStyle(
                    color: Colors.green[500],
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(height: 30),
              Padding(
                padding: EdgeInsets.only(left: 30),
                child: Text(
                  """Suas doações ajudam a manter nossos projetos sociais e fornecer atendimento gratuito para quem precisa
                  """,
                  style: TextStyle(
                    color: Colors.grey[500],
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              SizedBox(height: 50),
              Container(
                color: Colors.lightBlue[50]?.withOpacity(0.3),
                child: Column(
                  children: [
                    Container(
                      child: Center(
                        child: Text(
                          "Faça sua doação via PIX",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 26,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),

                    SizedBox(height: 50),

                    Text(
                      "Valores sugeridos :",
                      style: TextStyle(
                        color: Colors.green[500],
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 20),
                    Padding(
                      padding: EdgeInsets.all(16.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,

                        children: [
                          Container(
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                colors: [Colors.greenAccent, Colors.lightGreen],
                                begin: Alignment.centerRight,
                                end: Alignment.centerLeft,
                              ),
                              borderRadius: BorderRadius.circular(30),
                            ),
                            child: ElevatedButton(
                              onPressed: () async {
                                pixService.valorController.text = "10.00"; // define o valor fixo
                                pixService.pixController.text = "sua_chave_pix_aqui"; // chave pix

                                setState(() => _isLoading = true);
                                final data = await pixService.gerarPix(context);
                                setState(() => _isLoading = false);

                                if (data != null) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(content: Text('PIX de R\$10 gerado com sucesso!')),
                                  );
                                }
                              },

                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.transparent,
                                shadowColor: Colors.transparent,
                                padding: EdgeInsets.symmetric(
                                  horizontal: 50,
                                  vertical: 6,
                                ),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30),
                                ),
                              ),
                              child: Text(
                                "R\$10",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                          Container(
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                colors: [Colors.greenAccent, Colors.lightGreen],
                                begin: Alignment.centerRight,
                                end: Alignment.centerLeft,
                              ),
                              borderRadius: BorderRadius.circular(30),
                            ),
                            child: ElevatedButton(
                              onPressed: () async {
                                pixService.valorController.text = "20.00"; // define o valor fixo
                                pixService.pixController.text = "sua_chave_pix_aqui"; // chave pix

                                setState(() => _isLoading = true);
                                final data = await pixService.gerarPix(context);
                                setState(() => _isLoading = false);

                                if (data != null) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(content: Text('PIX de R\$20 gerado com sucesso!')),
                                  );
                                }
                              },

                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.transparent,
                                shadowColor: Colors.transparent,
                                padding: EdgeInsets.symmetric(
                                  horizontal: 50,
                                  vertical: 6,
                                ),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30),
                                ),
                              ),
                              child: Text(
                                "R\$20",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,

                      children: [

                        Container(
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [Colors.greenAccent, Colors.lightGreen],
                              begin: Alignment.centerRight,
                              end: Alignment.centerLeft,
                            ),
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: ElevatedButton(
                            onPressed: () async {
                              pixService.valorController.text = "50.00"; // define o valor fixo
                              pixService.pixController.text = "sua_chave_pix_aqui"; // chave pix

                              setState(() => _isLoading = true);
                              final data = await pixService.gerarPix(context);
                              setState(() => _isLoading = false);

                              if (data != null) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(content: Text('PIX de R\$50 gerado com sucesso!')),
                                );
                              }
                            },

                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.transparent,
                              shadowColor: Colors.transparent,
                              padding: EdgeInsets.symmetric(horizontal: 50,
                                vertical: 6,),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30),
                              ),
                            ),
                            child: Text(
                              "R\$50",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),Container(
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [Colors.greenAccent, Colors.lightGreen],
                              begin: Alignment.centerRight,
                              end: Alignment.centerLeft,
                            ),
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: ElevatedButton(
                            onPressed: () async {
                              pixService.valorController.text = "100.00"; // define o valor fixo
                              pixService.pixController.text = "sua_chave_pix_aqui"; // chave pix

                              setState(() => _isLoading = true);
                              final data = await pixService.gerarPix(context);
                              setState(() => _isLoading = false);

                              if (data != null) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(content: Text('PIX de R\$100 gerado com sucesso!')),
                                );
                              }
                            },

                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.transparent,
                              shadowColor: Colors.transparent,
                              padding: EdgeInsets.symmetric(
                                horizontal: 50,
                                vertical: 6,
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30),
                              ),
                            ),
                            child: Text(
                              "R\$100",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20,),
                    Container(
                      margin: EdgeInsets.only(right: 220),
                      child: Text("Outro valor: ",
                        style: TextStyle(
                          color: Colors.grey[700],
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                    SizedBox(height: 8,),
                    SizedBox(width: 330,
                      child: Row(
                        children: [
                          // Prefixo verde
                          Container(

                            decoration: BoxDecoration(
                              color: Colors.green,
                              borderRadius: BorderRadius.horizontal(left: Radius.circular(30)),
                            ),
                            padding: EdgeInsets.symmetric(horizontal: 26 , vertical: 11),
                            child: Text('R\$',style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 20
                            ),),
                          ),
                          Expanded(child: Container(
                            decoration: BoxDecoration(
                                color: Colors.white,
                                border: Border.all(color: Colors.grey.shade300),
                                borderRadius: BorderRadius.horizontal(right: Radius.circular(30))
                            ),
                            child: TextField(
                              controller: pixService.valorController,
                              keyboardType: TextInputType.number,
                              textAlign: TextAlign.right,
                              decoration: InputDecoration(
                                  contentPadding: EdgeInsets.symmetric(horizontal: 16),
                                  border:InputBorder.none,
                                  hintText: '00'
                              ),
                            ),
                          ))
                        ],
                      ),
                    )
                    ,
                    SizedBox(height: 30,),
                    Column(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [Colors.greenAccent, Colors.lightGreen],
                              begin: Alignment.centerRight,
                              end: Alignment.centerLeft,
                            ),
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: ElevatedButton(
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
                              backgroundColor: Colors.transparent,
                              shadowColor: Colors.transparent,
                              padding: const EdgeInsets.symmetric(
                                horizontal: 90,
                                vertical: 25,
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30),
                              ),
                            ),
                            child: const Text(
                              "Gerar QR CODE",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
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

                    SizedBox(height: 30,),

                    Container(
                      margin: EdgeInsets.only(right: 280),
                      child: Text("Ou ",
                        style: TextStyle(
                          color: Colors.grey[700],
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                    SizedBox(height: 30,),
                    Container(
                      margin: EdgeInsets.only(right: 140),
                      child: Text(
                        "Chave PIX ALEATÓRIA: ",
                        style: TextStyle(
                          color: Colors.green[500],
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    SizedBox(height: 30,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // Caixa branca com a chave
                        Expanded(
                          child: Container(
                            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 3),
                            margin: const EdgeInsets.only(left: 30),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: const BorderRadius.horizontal(
                                left: Radius.circular(20),
                              ),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black12,
                                  blurRadius: 4,
                                  offset: const Offset(0, 2),
                                ),
                              ],
                            ),
                            child: TextField(
                              controller: pixController, // chave PIX
                              decoration: const InputDecoration(
                                border: InputBorder.none,
                                hintText: "Digite sua chave PIX"
                              ),
                              style: TextStyle(
                                color: Colors.green,
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ),

                        // Botão verde de copiar
                        Container(
                          decoration: const BoxDecoration(
                            color: Colors.green,
                            borderRadius: BorderRadius.horizontal(
                              right: Radius.circular(20),
                            ),
                          ),
                          padding: const EdgeInsets.all(12),
                          child: const Icon(
                            Icons.copy,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    )


                  ],
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}

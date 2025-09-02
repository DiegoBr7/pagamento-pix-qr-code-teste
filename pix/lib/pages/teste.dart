import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class PixKeyInputWidget extends StatefulWidget {
  @override
  _PixKeyInputWidgetState createState() => _PixKeyInputWidgetState();
}

class _PixKeyInputWidgetState extends State<PixKeyInputWidget> {
  final TextEditingController _pixController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Chave PIX ALEATÓRIA:',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.green[700],
            fontSize: 16,
          ),
        ),
        SizedBox(height: 8),
        Row(
          children: [
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.horizontal(left: Radius.circular(20)),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 4,
                      offset: Offset(0, 2),
                    ),
                  ],
                ),
                child: TextField(
                  controller: _pixController,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                    border: InputBorder.none,
                    hintText: 'Digite sua chave PIX',
                  ),
                  style: TextStyle(
                    color: Colors.green[700],
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                color: Colors.green[600],
                borderRadius: BorderRadius.horizontal(right: Radius.circular(20)),
              ),
              child: IconButton(
                icon: Icon(Icons.copy, color: Colors.white),
                onPressed: () {
                  final String pixKey = _pixController.text;
                  if (pixKey.isNotEmpty) {
                    Clipboard.setData(ClipboardData(text: pixKey));
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Chave copiada!')),
                    );
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Digite uma chave primeiro')),
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ],
    );
  }
}
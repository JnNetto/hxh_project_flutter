import 'package:flutter/material.dart';


class ConfigPage {
  static Widget buildSettingsDialog(BuildContext context) {
    return AlertDialog(
      content: FractionallySizedBox(
        widthFactor: 0.7,
        heightFactor: 0.7,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                'Configurações',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18.0,
                ),
              ),
            ),
            const Expanded(
              child: SingleChildScrollView(
                child: ListBody(
                  children: <Widget>[
                    Text('Aqui estão suas configurações.'),
                    // Adicione aqui seus itens de configurações como ListTiles, Switches, etc.
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: TextButton(
                child: Text('Fechar'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
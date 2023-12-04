import 'package:flutter/material.dart';
import 'package:hxh/app/core/utils/background_music.dart';

class SettingsDialog extends StatefulWidget {
  final String path;
  const SettingsDialog({super.key, required this.path});
 
  @override
  // ignore: library_private_types_in_public_api
  _SettingsDialogState createState() => _SettingsDialogState();
}

class _SettingsDialogState extends State<SettingsDialog> {
  double _volume = BackgroundMusicPlayer.getVolume();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Configurações', style: TextStyle(color: Colors.white),),
      backgroundColor: const Color.fromARGB(160, 15, 135, 27),
      shadowColor: Colors.black,
      content: FractionallySizedBox(
        widthFactor: 0.7,
        heightFactor: 0.7,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            const Text('Volume da música', style: TextStyle(color: Colors.white)),
            const SizedBox(height: 5,),
            Slider(
              value: _volume,
              onChanged: (newValue) {
                setState(() {
                  _volume = newValue;
                });
                BackgroundMusicPlayer.setVolume(newValue);
              },
              min: 0.0,
              max: 1.0,
              divisions: 100,
              label: "${(_volume * 10).toInt()}",
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextButton(
                child: const Text('Fechar', style: TextStyle(color: Colors.white)),
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

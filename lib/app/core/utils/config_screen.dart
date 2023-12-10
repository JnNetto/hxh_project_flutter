
import 'package:flutter/material.dart';
import 'package:hxh/app/core/utils/background_music.dart';

class SettingsDialog extends StatefulWidget {
  
  const SettingsDialog({Key? key}) : super(key: key);
 
  @override
  // ignore: library_private_types_in_public_api
  _SettingsDialogState createState() => _SettingsDialogState();
}
class _SettingsDialogState extends State<SettingsDialog> {
  double _volume = BackgroundMusicPlayer.getVolume();
  int _musicIndex = BackgroundMusicPlayer.getMusicIndex();
  final String _music = BackgroundMusicPlayer.getMusic();
  final List<String> _musicFiles = [
    "departure",
    "just awake",
    "hunting for you dream",
    "reason",
    "nagareboshi kirari",
    "hyori ittai"
    "soundtracks"
  ];
  final Map<String, int> musicDataInSeconds = {
    'World of Adventures (Gon\'s Theme)': 0,
    'Ginpatsu no Shounen (Killua\'s Theme)': 155,
    'Hiiro no Hitomi no Aika (Kurapika\'s Theme)': 278,
    'All I Need Is MONEY! (Leorio\'s Theme)': 363,
    'A Field in Spring (Melody\'s Theme)': 454,
    'Ansatsu Ikka no Yakata (Zoldyck Family Theme)': 547,
    'Kujira Shima Yori': 680,
    'Kijutsushi no BAIRE (Hisoka\'s Theme)': 800,
    'Kusari Yarou (Kurapika\'s Second Theme)': 867,
    'Sono Kyoukan, Ryoryoku Zetsurin (Uvogin\'s Theme)': 981,
    'Asaichi Nite': 1095,
    'Meimou': 1168,
    'Beyond the Seas': 1256,
    'Latent Power (Nen Theme)': 1335,
    'The Mad Bailaor (Hisoka\'s Second Theme)': 1433,
    'Requiem Aranea (Phantom Troupe Theme)': 1540,
    'Gyaku Juuji no Otoko (Chrollo\'s Second Theme)': 1667,
    'G・I Theme (Greed Island Theme)': 1762,
    'Ikkiuchi!': 1887,
    'Boys, Be Courageous!': 1980,
    'Legend of the Martial Artist': 2147,
    'Mystic Land': 2221,
    'In the Palace ~ Lamentoso (Pouf\'s Theme)': 2311,
    'In the Palace ~ Agitato (Pouf\'s Second Theme)': 2433,
    'Holding a Card File': 2518,
    'Iai no Kyoujin (Nobunaga\'s Theme)': 2614,
    'Hegemony of the Food Chain': 2689,
    'Who\'s the Bomber? (Genthru\'s Theme)': 2989,
    'Genei no Banka': 3078,
    'Hashire!': 3183,
    'Dirge from Dark Side (Chrollo\'s Theme)': 3262,
    'Dr. Warm-Hearted Miser (Leorio\'s Second Theme)': 3337,
    'Restriction And Pledge': 3469,
    'The Last Mission': 3629,
    'The Emperor\'s Time': 3816,
    'Try Your Luck': 4125,
    'Konjou Dashite! (Knuckle\'s Theme)': 4242,
    'Riot': 4321,
    'New Mutation': 4432,
    'Kingdom of Predators': 4555,
    'Theme of “KAGE” + Rasetsu': 4727,
    'To Give a Marionette Life': 4966,
    'Elegy of the Dynast': 5053,
    'Understanding': 5201,
    'A Drop of Tear': 5318,
    'Hyouri Ittai ~ Lamento for Piano': 5484,
    'Departure for Strings': 5690,
  };
  
  
  get _musicSelected => _music;
 
  
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Configurações', style: TextStyle(color: Colors.white)),
      backgroundColor: Colors.black38,
      shadowColor: Colors.black,
      content: FractionallySizedBox(
        widthFactor: 0.7,
        heightFactor: 0.7,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            const Text('Selecione uma música', style: TextStyle(color: Colors.white)),
            const SizedBox(height: 5,),
            DropdownButton<String>(
              value: null,
              hint: Text('  $_musicSelected', style: const TextStyle(color: Colors.white),),
              onChanged: (String? selectedMusic) {
                setState(() {
                  _musicIndex = _musicFiles.indexOf(selectedMusic!);
                });
                BackgroundMusicPlayer.changeBackgroundMusic(_musicIndex, 0);
              },
              items: _musicFiles.map((String music) {
                return DropdownMenuItem<String>(
                  value: music,
                  child: Text(music),
                );
              }).toList(),
            ),
            const SizedBox(height: 30,),
            const Text('Selecione uma soundtrack', style: TextStyle(color: Colors.white)),
            const SizedBox(height: 5,),
            DropdownButton<String>(
              value: null,
              hint: Text("  $_musicSelected", style: const TextStyle(color: Colors.white),),
              onChanged: (String? selectedMusic) {
                setState(() {
                  _musicIndex = 6; 
                });
                BackgroundMusicPlayer.changeBackgroundMusic(_musicIndex, musicDataInSeconds[selectedMusic]);
              },
              items: musicDataInSeconds.keys.map((String musicName) {
              return DropdownMenuItem<String>(
                value: musicName,
                child: Text(musicName),
              );
            }).toList(),
            ),
            const SizedBox(height: 20,),
            const Text('Volume da música', style: TextStyle(color: Colors.white)),
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

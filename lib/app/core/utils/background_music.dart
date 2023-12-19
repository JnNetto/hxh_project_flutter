import 'package:just_audio/just_audio.dart';

class BackgroundMusicPlayer {
  static late AudioPlayer _player;
  static late int _musicIndex;
  static late String _music;
  static double _volume = 0.3;
  static final List<String> _musicFiles = [
    "departure",
    "just awake",
    "hunting for your dream",
    "reason",
    "nagareboshi kirari",
    "hyori ittai",
    "soundtracks"
  ];
  static final Map<String, int> musicDataInSeconds = {
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

  static void initialize() {
    _player = AudioPlayer();
  }

  static int getMusicIndex() {
    return _musicIndex;
  }

  static String getMusic() {
    return _music;
  }

  static Future<void> loadMusic(int musicPath,{int time = 0}) async {
    _musicIndex = musicPath;
    if (musicPath == 6) {
      musicDataInSeconds.forEach((key, value) {
        if(value == time){
          _music = key;
        }
      });
      await _player.setAsset('assets/audio/soundtracks.mp3');
    }
    else{
      _music = _musicFiles[musicPath];
      await _player.setAsset('assets/audio/$_music.mp3');
    }
  }

  static Future<void> playBackgroundMusic(int time) async {
    await _player.setVolume(getVolume());
    await _player.setLoopMode(LoopMode.one);
    await _player.seek(Duration(seconds: time));
    await _player.play();
    
  }

  static Future<void> stopBackgroundMusic() async {
    await _player.stop();
  }

  static Future<void> pauseBackgroundMusic() async {
    await _player.pause();
  }

  static Future<void> resumeBackgroundMusic() async {
    await _player.play();
  }

  static Future<void> changeBackgroundMusic(int? musicPath, int? time) async {
    await stopBackgroundMusic();
    loadMusic(musicPath!, time: time!);
    await playBackgroundMusic(time);
  }

  static void setVolume(double volume) {
    _volume = volume;
    _player.setVolume(volume);
  }

  static double getVolume() {
    return _volume;
  }

  static disposeBackgroundMusic() {
    _player.dispose();
  }
}

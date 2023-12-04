import 'package:just_audio/just_audio.dart';

class BackgroundMusicPlayer {
  static late AudioPlayer _player;

  static void initialize() {
    _player = AudioPlayer();
  }

  static Future<void> loadMusic(String musicPath) async {
    await _player.setAsset(musicPath);
  }

  static Future<void> playBackgroundMusic() async {
    _player.setLoopMode(LoopMode.one);
    await _player.play(); 
  }

  static Future<void> stopBackgroundMusic() async {
    await _player.stop();
  }

  static void setVolume(double volume) {
    _player.setVolume(volume);
  }

  static double getVolume() {
    return _player.volume;
  }
}

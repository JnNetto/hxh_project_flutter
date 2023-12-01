
import 'package:just_audio/just_audio.dart';



class BackgroundMusicPlayer {
  static Future<void> playBackgroundMusic(AudioPlayer player, String path ) async {
    player.setLoopMode(LoopMode.one);
    player.play();
    player.setVolume(0.5);
  }
  static Future<void> stopBackgroundMusic(AudioPlayer player) async {
    player.stop();
  }
}

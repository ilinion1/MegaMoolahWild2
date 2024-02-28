import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:mega_moolah_wild_pro/mega_pro_src/mega_pro_mega_pro_dataFDGH/mega_pro_local_storageDFH.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DSFSettingsControllerFSDF extends ChangeNotifier {
  bool sound = false;
  int level = 1;

  // updates
  int money = 10000;
  DateTime dateTime = DateTime.parse("2012-02-27");

  Future<void> setMoney(int amount) async {
    print('setting money');
    final sharedPreferences = await SharedPreferences.getInstance();
    final storage = SEFLocalStorageDSFE(sharedPreferences);
    money += amount;
    print(money);
    notifyListeners();
    await storage.setMoney(money);
  }

  Future<void> setDateTime() async {
    final sharedPreferences = await SharedPreferences.getInstance();
    final storage = SEFLocalStorageDSFE(sharedPreferences);
    dateTime = DateTime.now();
    notifyListeners();
    await storage.setDateTime(dateTime);
  }

  Future<void> initSettings() async {
    final sharedPreferences = await SharedPreferences.getInstance();
    final storage = SEFLocalStorageDSFE(sharedPreferences);
    Map<String, dynamic> data = storage.getSettings();
    if (data['sound'] == null || data['level'] == null) {
      await storage.setSettings(
        sound,
        level,
        dateTime,
        money,
      );
      data = storage.getSettings();
    }
    print(data);
    sound = data['sound'];
    level = data['level'];
    money = data['money'];
    dateTime = data['date_time'];
    notifyListeners();
    await toggleAudio();
  }

  Future<void> setSound(bool value) async {
    final sharedPreferences = await SharedPreferences.getInstance();
    final storage = SEFLocalStorageDSFE(sharedPreferences);
    sound = value;
    notifyListeners();
    await toggleAudio();
    await storage.setSound(sound);
  }

  Future<void> setLevel(int value) async {
    final sharedPreferences = await SharedPreferences.getInstance();
    final storage = SEFLocalStorageDSFE(sharedPreferences);
    level = value;
    notifyListeners();
    await storage.setLevel(value);
  }

  // Audio Section
  final player = AudioPlayer();

  Future<void> toggleAudio() async {
    if (sound) {
      await playAudio();
    } else {
      await stopAudio();
    }
  }

  Future<void> playAudio() async {
    print('play audio');
    if (player.state == PlayerState.playing) return;
    await player.play(AssetSource('audio/music.mp3'), volume: 0.3);
    player.setReleaseMode(ReleaseMode.loop);
  }

  Future<void> stopAudio() async {
    await player.pause();
  }
}

class FSDFSettingsProviderESF extends InheritedNotifier {
  final DSFSettingsControllerFSDF model;

  const FSDFSettingsProviderESF({
    super.key,
    required super.child,
    required this.model,
  }) : super(
          notifier: model,
        );

  static FSDFSettingsProviderESF? read(BuildContext context) {
    final widget = context
        .getElementForInheritedWidgetOfExactType<FSDFSettingsProviderESF>()
        ?.widget;
    return (widget is FSDFSettingsProviderESF) ? widget : null;
  }

  static FSDFSettingsProviderESF watch(BuildContext context) {
    return context
        .dependOnInheritedWidgetOfExactType<FSDFSettingsProviderESF>()!;
  }
}

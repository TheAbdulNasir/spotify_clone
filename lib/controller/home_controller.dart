import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:spotify_sdk/spotify_sdk.dart';

import '../resource/constant_string.dart';

class HomeController extends GetxController {
  static HomeController get to => Get.find();

  RxString arg = ''.obs;
  bool connected = false;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    arg.value = Get.arguments;
    connectToSpotifyRemote();
  }

  connectToSpotifyRemote() async {
    try {
      var result = await SpotifySdk.connectToSpotifyRemote(
          clientId: clientId,
          redirectUrl: callbackUrl);
      debugPrint(result
          ? 'connect to spotify successful'
          : 'connect to spotify failed');
    } on PlatformException catch (e) {

      debugPrint('${e.code}' '${e.message}');
    } on MissingPluginException {
      debugPrint('not implemented');
    }
  }

  Future<void> play() async {
    try {
      await SpotifySdk.play(spotifyUri: 'spotify:track:58kNJana4w5BIjlZE2wq5m');
    } on PlatformException catch (e) {
      debugPrint(e.toString());
    } on MissingPluginException {
      debugPrint('not implemented');
    }
  }

  Future<void> pause() async {
    try {
      await SpotifySdk.pause();
    } on PlatformException catch (e) {
      debugPrint(e.toString());
    } on MissingPluginException {
      debugPrint('not implemented');
    }
  }

  Future<void> resume() async {
    try {
      await SpotifySdk.resume();
    } on PlatformException catch (e) {
      debugPrint(e.toString());
    } on MissingPluginException {
      debugPrint('not implemented');
    }
  }

  Future<void> skipNext() async {
    try {
      await SpotifySdk.skipNext();
    } on PlatformException catch (e) {
      debugPrint(e.toString());
    } on MissingPluginException {
      debugPrint('not implemented');
    }
  }

  Future<void> skipPrevious() async {
    try {
      await SpotifySdk.skipPrevious();
    } on PlatformException catch (e) {
      debugPrint(e.toString());
    } on MissingPluginException {
      debugPrint('not implemented');
    }
  }


  Future<void> disconnect() async {
    try {
      var result = await SpotifySdk.disconnect();
      debugPrint(result ? 'disconnect successful' : 'disconnect failed');
    } on PlatformException catch (e) {
      debugPrint(e.toString());
    } on MissingPluginException {
      debugPrint('not implemented');
    }
  }



}

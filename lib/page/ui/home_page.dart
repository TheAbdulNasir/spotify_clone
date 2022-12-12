// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:spotify_sdk/models/connection_status.dart';
import 'package:spotify_sdk/models/crossfade_state.dart';
import 'package:spotify_sdk/models/image_uri.dart';
import 'package:spotify_sdk/models/player_context.dart';
import 'package:spotify_sdk/models/player_state.dart';
import 'package:spotify_sdk/spotify_sdk.dart';
import 'package:spotifyclone/controller/home_controller.dart';
import 'package:spotifyclone/resource/color.dart';
import '../widget/sized_icon_button.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool _connected = false;

  CrossfadeState? crossfadeState;
  late ImageUri? currentTrackImageUri;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: homeBGColor,
        title: const Text('Spotify Songs'),
        actions: [
          _connected
              ? IconButton(
            onPressed: HomeController.to.disconnect,
            icon: const Icon(Icons.exit_to_app),
          )
              : Container()
        ],
      ),
      body:StreamBuilder<ConnectionStatus>(
        stream: SpotifySdk.subscribeConnectionStatus(),
        builder: (context, snapshot) {
          _connected = false;
          var data = snapshot.data;
          if (data != null) {
            _connected = data.connected;
          }
          return  _sampleFlowWidget(context);
        },
      ),
    );
  }

  Widget _sampleFlowWidget(BuildContext context2) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        // padding: const EdgeInsets.all(8),
        children: [
          TextButton(
            onPressed: HomeController.to.connectToSpotifyRemote,
            child: const Icon(Icons.settings_remote,color: Colors.white,),
          ),
          _connected
              ? _buildPlayerStateWidget()
              : const Center(
            child: Text('Not connected'),
          ),
          const Divider(),
        ],
      ),
    );
  }

  Widget _buildPlayerStateWidget() {
    return StreamBuilder<PlayerState>(
      stream: SpotifySdk.subscribePlayerState(),
      builder: (BuildContext context, AsyncSnapshot<PlayerState> snapshot) {
        var track = snapshot.data?.track;
        currentTrackImageUri = track?.imageUri;
        var playerState = snapshot.data;

        if (playerState == null || track == null) {
          return Center(
            child: Container(),
          );
        }

        return Container(
          color: homeBGColor,
          width: MediaQuery.of(context).size.width,
          child: Row(
           crossAxisAlignment: CrossAxisAlignment.center,
               children: [
                 Padding(
                   padding: const EdgeInsets.only(left: 20.0,top: 10,bottom: 10),
                   child: SizedBox(height:100,child: spotifyImageWidget(track.imageUri)),
                 ),
                 const SizedBox(width: 20),
                 Column(
                   children: [
                     _buildPlayerContextWidget(),
                     const SizedBox(height: 10),
                     Row(
                       crossAxisAlignment: CrossAxisAlignment.center,
                       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                       children: <Widget>[
                         Card(
                           elevation: 10,
                           shape: RoundedRectangleBorder(
                             borderRadius: BorderRadius.circular(20.0),
                           ),
                           child: Container(
                             height:35,
                             width: 50,
                             decoration: BoxDecoration(
                                 borderRadius: BorderRadius.circular(20),
                                 color: buttonColor
                             ),
                             child: Center(
                               child: SizedIconButton(
                                 width: 50,
                                 icon: Icons.skip_previous,
                                 onPressed: HomeController.to.skipPrevious,
                               ),
                             ),
                           ),
                         ),
                         Card(
                           elevation: 10,
                           shape: RoundedRectangleBorder(
                             borderRadius: BorderRadius.circular(20.0),
                           ),
                           child: Container(
                             height:35,
                             width: 50,
                             decoration: BoxDecoration(
                                 borderRadius: BorderRadius.circular(20),
                                 color: buttonColor
                             ),
                             child: playerState.isPaused
                                 ? SizedIconButton(
                               width: 50,
                               icon: Icons.play_arrow,
                               onPressed: HomeController.to.resume,
                             )
                                 : SizedIconButton(
                               width: 50,
                               icon: Icons.pause,
                               onPressed: HomeController.to.pause,
                             ),
                           ),
                         ),

                         Card(
                           elevation: 10,
                           shape: RoundedRectangleBorder(
                             borderRadius: BorderRadius.circular(20.0),
                           ),
                           child: Container(
                             height:35,
                              width: 50,
                             decoration: BoxDecoration(
                                 borderRadius: BorderRadius.circular(20),
                                 color: buttonColor
                             ),
                             child: Center(
                               child: SizedIconButton(
                                 width: 50,
                                 icon: Icons.skip_next,
                                 onPressed: HomeController.to.skipNext,
                               ),
                             ),
                           ),
                         ),

                       ],
                     ),
                   ],
                 ),
               ],
             ),
        );
      },
    );
  }

  Widget _buildPlayerContextWidget() {
    return StreamBuilder<PlayerContext>(
      stream: SpotifySdk.subscribePlayerContext(),
      initialData: PlayerContext('', '', '', ''),
      builder: (BuildContext context, AsyncSnapshot<PlayerContext> snapshot) {
        var playerContext = snapshot.data;
        if (playerContext == null) {
          return const Center(
            child: Text('Not connected'),
          );
        }

        return Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(playerContext.title,style: const TextStyle(color: Colors.white),),
            Text(playerContext.subtitle,style: const TextStyle(color: Colors.white)),
          ],
        );
      },
    );
  }

  Widget spotifyImageWidget(ImageUri image) {
    return FutureBuilder(
        future: SpotifySdk.getImage(
          imageUri: image,
          dimension: ImageDimension.large,
        ),
        builder: (BuildContext context, AsyncSnapshot<Uint8List?> snapshot) {
          if (snapshot.hasData) {
            return Image.memory(snapshot.data!);
          } else if (snapshot.hasError) {
            debugPrint(snapshot.error.toString());
            return SizedBox(
              width: ImageDimension.large.value.toDouble(),
              height: ImageDimension.large.value.toDouble(),
              child: const Center(child: Text('Error getting image')),
            );
          } else {
            return SizedBox(
              width: ImageDimension.large.value.toDouble(),
              height: ImageDimension.large.value.toDouble(),
              child: const Center(child: Text('Getting image...')),
            );
          }
        });
  }



}

import 'package:agora_rtc_engine/agora_rtc_engine.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:locationprojectflutter/core/constants/constants.dart';
import 'package:locationprojectflutter/presentation/state_management/mobx/video_call_mobx.dart';
import 'package:provider/provider.dart';
//import 'dart:async';

class VideoCall extends StatefulWidget {
  final String channelName;
  final ClientRole role;

  const VideoCall({Key key, this.channelName, this.role}) : super(key: key);

  @override
  _VideoCallState createState() => _VideoCallState();
}

class _VideoCallState extends State<VideoCall> {
  String _AGORA_KEY = Constants.AGORA_KEY;
  VideoCallMobXStore _mobx = VideoCallMobXStore();

  @override
  void initState() {
    super.initState();

    _mobx.isMuted(false);
    _mobx.isInfoStringsClear();
    _mobx.isUsersClear();

    _initialize();
  }

  @override
  void dispose() {
    super.dispose();

    _mobx.isUsersClear();

    AgoraRtcEngine.leaveChannel();
    AgoraRtcEngine.destroy();
  }

  void _initialize() async {
    if (_AGORA_KEY.isEmpty) {
      _mobx.isInfoStringsAdd(
          'APP_ID missing, please provide your APP_ID in settings.dart');
      _mobx.isInfoStringsAdd('Agora Engine is not starting');
      return;
    }

    _initAgoraRtcEngine();
    _addAgoraEventHandlers();
    await AgoraRtcEngine.enableWebSdkInteroperability(true);
    VideoEncoderConfiguration configuration = VideoEncoderConfiguration();
    configuration.dimensions = Size(1920, 1080);
    await AgoraRtcEngine.setVideoEncoderConfiguration(configuration);
    await AgoraRtcEngine.joinChannel(null, widget.channelName, null, 0);
  }

  void _initAgoraRtcEngine() async {
    await AgoraRtcEngine.create(_AGORA_KEY);
    await AgoraRtcEngine.enableVideo();
    await AgoraRtcEngine.setChannelProfile(ChannelProfile.LiveBroadcasting);
    await AgoraRtcEngine.setClientRole(widget.role);
  }

  void _addAgoraEventHandlers() {
    AgoraRtcEngine.onError = (dynamic code) {
      final info = 'onError: $code';
      _mobx.isInfoStringsAdd(info);
    };

    AgoraRtcEngine.onJoinChannelSuccess = (
      String channel,
      int uid,
      int elapsed,
    ) {
      final info = 'onJoinChannel: $channel, uid: $uid';
      _mobx.isInfoStringsAdd(info);
    };

    AgoraRtcEngine.onLeaveChannel = () {
      _mobx.isInfoStringsAdd('onLeaveChannel');
      _mobx.isUsersClear();
    };

    AgoraRtcEngine.onUserJoined = (int uid, int elapsed) {
      final info = 'userJoined: $uid';
      _mobx.isInfoStringsAdd(info);
      _mobx.isUsersAdd(uid);
    };

    AgoraRtcEngine.onUserOffline = (int uid, int reason) {
      final info = 'userOffline: $uid';
      _mobx.isInfoStringsAdd(info);
      _mobx.isUsersRemove(uid);
    };

    AgoraRtcEngine.onFirstRemoteVideoFrame = (
      int uid,
      int width,
      int height,
      int elapsed,
    ) {
      final info = 'firstRemoteVideo: $uid ${width}x $height';
      _mobx.isInfoStringsAdd(info);
    };
  }

  List<Widget> _getRenderViews() {
    final List<AgoraRenderWidget> list = [];
    if (widget.role == ClientRole.Broadcaster) {
      list.add(AgoraRenderWidget(0, local: true, preview: true));
    }
    _mobx.isUsersGet.forEach((int uid) => list.add(AgoraRenderWidget(uid)));
    return list;
  }

  Widget _videoView(view) {
    return Expanded(child: Container(child: view));
  }

  Widget _expandedVideoRow(List<Widget> views) {
    final wrappedViews = views.map<Widget>(_videoView).toList();
    return Expanded(
      child: Row(
        children: wrappedViews,
      ),
    );
  }

  Widget _viewRows() {
    final views = _getRenderViews();
    switch (views.length) {
      case 1:
        return Container(
            child: Column(
          children: <Widget>[_videoView(views[0])],
        ));
      case 2:
        return Container(
            child: Column(
          children: <Widget>[
            _expandedVideoRow([views[0]]),
            _expandedVideoRow([views[1]])
          ],
        ));
      case 3:
        return Container(
            child: Column(
          children: <Widget>[
            _expandedVideoRow(views.sublist(0, 2)),
            _expandedVideoRow(views.sublist(2, 3))
          ],
        ));
      case 4:
        return Container(
            child: Column(
          children: <Widget>[
            _expandedVideoRow(views.sublist(0, 2)),
            _expandedVideoRow(views.sublist(2, 4))
          ],
        ));
      default:
    }
    return Container();
  }

  Widget _toolbar() {
    if (widget.role == ClientRole.Audience) return Container();
    return Container(
      alignment: Alignment.bottomCenter,
      padding: const EdgeInsets.symmetric(vertical: 48),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          RawMaterialButton(
            onPressed: _onToggleMute,
            child: Icon(
              _mobx.isMutedGet ? Icons.mic_off : Icons.mic,
              color: _mobx.isMutedGet ? Colors.white : Colors.blueAccent,
              size: 20.0,
            ),
            shape: CircleBorder(),
            elevation: 2.0,
            fillColor: _mobx.isMutedGet ? Colors.blueAccent : Colors.white,
            padding: const EdgeInsets.all(12.0),
          ),
          RawMaterialButton(
            onPressed: () => _onCallEnd(context),
            child: Icon(
              Icons.call_end,
              color: Colors.white,
              size: 35.0,
            ),
            shape: CircleBorder(),
            elevation: 2.0,
            fillColor: Colors.redAccent,
            padding: const EdgeInsets.all(15.0),
          ),
          RawMaterialButton(
            onPressed: _onSwitchCamera,
            child: Icon(
              Icons.switch_camera,
              color: Colors.blueAccent,
              size: 20.0,
            ),
            shape: CircleBorder(),
            elevation: 2.0,
            fillColor: Colors.white,
            padding: const EdgeInsets.all(12.0),
          )
        ],
      ),
    );
  }

//  Widget _panel() {
//    return Container(
//      padding: const EdgeInsets.symmetric(vertical: 48),
//      alignment: Alignment.bottomCenter,
//      child: FractionallySizedBox(
//        heightFactor: 0.5,
//        child: Container(
//          padding: const EdgeInsets.symmetric(vertical: 48),
//          child: ListView.builder(
//            reverse: true,
//            itemCount: _provider.isInfoStringsGet.length,
//            itemBuilder: (BuildContext context, int index) {
//              if (_provider.isInfoStringsGet.isEmpty) {
//                return null;
//              }
//              return Padding(
//                padding: const EdgeInsets.symmetric(
//                  vertical: 3,
//                  horizontal: 10,
//                ),
//                child: Row(
//                  mainAxisSize: MainAxisSize.min,
//                  children: [
//                    Flexible(
//                      child: Container(
//                        padding: const EdgeInsets.symmetric(
//                          vertical: 2,
//                          horizontal: 5,
//                        ),
//                        decoration: BoxDecoration(
//                          color: Colors.yellowAccent,
//                          borderRadius: BorderRadius.circular(5),
//                        ),
//                        child: Text(
//                          _provider.isInfoStringsGet[index],
//                          style: TextStyle(color: Colors.blueGrey),
//                        ),
//                      ),
//                    )
//                  ],
//                ),
//              );
//            },
//          ),
//        ),
//      ),
//    );
//  }

  void _onCallEnd(BuildContext context) {
    Navigator.pop(context);
  }

  void _onToggleMute() {
    _mobx.isMuted(!_mobx.isMutedGet);
    AgoraRtcEngine.muteLocalAudioStream(_mobx.isMutedGet);
  }

  void _onSwitchCamera() {
    AgoraRtcEngine.switchCamera();
  }

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (BuildContext context) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.blueGrey,
            leading: IconButton(
              icon: Icon(
                Icons.navigate_before,
                color: Colors.white,
                size: 40,
              ),
              onPressed: () => Navigator.of(context).pop(),
            ),
          ),
          backgroundColor: Colors.black,
          body: Center(
            child: Stack(
              children: <Widget>[
                _viewRows(),
//            _panel(),
                _toolbar(),
              ],
            ),
          ),
        );
      },
    );
  }
}

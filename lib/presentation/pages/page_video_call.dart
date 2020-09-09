import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:agora_rtc_engine/agora_rtc_engine.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:locationprojectflutter/core/constants/constants_urls_keys.dart';
import 'package:locationprojectflutter/presentation/state_management/mobx/mobx_video_call.dart';
import 'package:locationprojectflutter/presentation/widgets/app_bar_total.dart';
//import 'dart:async';

class PageVideoCall extends StatefulWidget {
  final String channelName;
  final ClientRole role;

  const PageVideoCall({Key key, this.channelName, this.role}) : super(key: key);

  @override
  _PageVideoCallState createState() => _PageVideoCallState();
}

class _PageVideoCallState extends State<PageVideoCall> {
  final String _AGORA_KEY = ConstantsUrlsKeys.API_KEY_AGORA;
  MobXVideoCallStore _mobX = MobXVideoCallStore();

  @override
  void initState() {
    super.initState();

    _mobX.isMuted(false);
    _mobX.infoStringsClear();
    _mobX.usersClear();

    _initialize();
  }

  @override
  void dispose() {
    super.dispose();

    _mobX.usersClear();

    AgoraRtcEngine.leaveChannel();
    AgoraRtcEngine.destroy();
  }

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (BuildContext context) {
        return Scaffold(
          backgroundColor: Colors.black,
          appBar: AppBarTotal(),
          body: Stack(
            children: <Widget>[
              _viewRows(),
//            _panel(),
              _toolbar(),
            ],
          ),
        );
      },
    );
  }

  Widget _viewRows() {
    final views = _getRenderViews();
    switch (views.length) {
      case 1:
        return Container(
          child: Column(
            children: <Widget>[_videoView(views[0])],
          ),
        );
      case 2:
        return Container(
          child: Column(
            children: <Widget>[
              _expandedVideoRow([views[0]]),
              _expandedVideoRow([views[1]])
            ],
          ),
        );
      case 3:
        return Container(
          child: Column(
            children: <Widget>[
              _expandedVideoRow(views.sublist(0, 2)),
              _expandedVideoRow(views.sublist(2, 3))
            ],
          ),
        );
      case 4:
        return Container(
          child: Column(
            children: <Widget>[
              _expandedVideoRow(views.sublist(0, 2)),
              _expandedVideoRow(views.sublist(2, 4))
            ],
          ),
        );
      default:
    }
    return Container();
  }

  List<Widget> _getRenderViews() {
    final List<AgoraRenderWidget> list = [];
    if (widget.role == ClientRole.Broadcaster) {
      list.add(AgoraRenderWidget(0, local: true, preview: true));
    }
    _mobX.isUsersGet.forEach((int uid) => list.add(AgoraRenderWidget(uid)));
    return list;
  }

  Widget _videoView(view) {
    return Expanded(child: Container(child: view));
  }

  Widget _expandedVideoRow(List<Widget> views) {
    final wrappedViews = views.map<Widget>(_videoView).toList();
    return Expanded(
      child: Row(children: wrappedViews),
    );
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
              _mobX.isMutedGet ? Icons.mic_off : Icons.mic,
              color: _mobX.isMutedGet ? Colors.white : Colors.blueAccent,
              size: 20.0,
            ),
            shape: const CircleBorder(),
            elevation: 2.0,
            fillColor: _mobX.isMutedGet ? Colors.blueAccent : Colors.white,
            padding: const EdgeInsets.all(12.0),
          ),
          RawMaterialButton(
            onPressed: () => _onCallEnd(context),
            child: const Icon(
              Icons.call_end,
              color: Colors.white,
              size: 35.0,
            ),
            shape: const CircleBorder(),
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
            shape: const CircleBorder(),
            elevation: 2.0,
            fillColor: Colors.white,
            padding: const EdgeInsets.all(12.0),
          )
        ],
      ),
    );
  }

  // Widget _panel() {
  //   return Container(
  //     padding: const EdgeInsets.symmetric(vertical: 48),
  //     alignment: Alignment.bottomCenter,
  //     child: FractionallySizedBox(
  //       heightFactor: 0.5,
  //       child: Container(
  //         padding: const EdgeInsets.symmetric(vertical: 48),
  //         child: ListView.builder(
  //           reverse: true,
  //           itemCount: _provider.isInfoStringsGet.length,
  //           itemBuilder: (BuildContext context, int index) {
  //             if (_provider.isInfoStringsGet.isEmpty) {
  //               return null;
  //             }
  //             return Padding(
  //               padding: EdgeInsets.symmetric(
  //                 vertical: ResponsiveScreen().heightMediaQuery(context, 3),
  //                 horizontal: ResponsiveScreen().widthMediaQuery(context, 10),
  //               ),
  //               child: Row(
  //                 mainAxisSize: MainAxisSize.min,
  //                 children: [
  //                   Flexible(
  //                     child: Container(
  //                       padding: EdgeInsets.symmetric(
  //                         vertical:
  //                             ResponsiveScreen().heightMediaQuery(context, 2),
  //                         horizontal:
  //                             ResponsiveScreen().widthMediaQuery(context, 5),
  //                       ),
  //                       decoration: BoxDecoration(
  //                         color: Colors.yellowAccent,
  //                         borderRadius: BorderRadius.circular(5),
  //                       ),
  //                       child: Text(
  //                         _provider.isInfoStringsGet[index],
  //                         style: const TextStyle(color: Colors.blueGrey),
  //                       ),
  //                     ),
  //                   )
  //                 ],
  //               ),
  //             );
  //           },
  //         ),
  //       ),
  //     ),
  //   );
  // }

  void _initialize() async {
    if (_AGORA_KEY.isEmpty) {
      _mobX.infoStringsAdd(
          'APP_ID missing, please provide your APP_ID in settings.dart');
      _mobX.infoStringsAdd('Agora Engine is not starting');
      return;
    }

    _initAgoraRtcEngine();
    _addAgoraEventHandlers();
    await AgoraRtcEngine.enableWebSdkInteroperability(true);
    VideoEncoderConfiguration configuration = VideoEncoderConfiguration();
    configuration.dimensions = const Size(1920, 1080);
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
      _mobX.infoStringsAdd(info);
    };

    AgoraRtcEngine.onJoinChannelSuccess = (
      String channel,
      int uid,
      int elapsed,
    ) {
      final info = 'onJoinChannel: $channel, uid: $uid';
      _mobX.infoStringsAdd(info);
    };

    AgoraRtcEngine.onLeaveChannel = () {
      _mobX.infoStringsAdd('onLeaveChannel');
      _mobX.usersClear();
    };

    AgoraRtcEngine.onUserJoined = (int uid, int elapsed) {
      final info = 'userJoined: $uid';
      _mobX.infoStringsAdd(info);
      _mobX.usersAdd(uid);
    };

    AgoraRtcEngine.onUserOffline = (int uid, int reason) {
      final info = 'userOffline: $uid';
      _mobX.infoStringsAdd(info);
      _mobX.usersRemove(uid);
    };

    AgoraRtcEngine.onFirstRemoteVideoFrame = (
      int uid,
      int width,
      int height,
      int elapsed,
    ) {
      final info = 'firstRemoteVideo: $uid ${width}x $height';
      _mobX.infoStringsAdd(info);
    };
  }

  void _onCallEnd(BuildContext context) {
    Navigator.pop(context);
  }

  void _onToggleMute() {
    _mobX.isMuted(!_mobX.isMutedGet);
    AgoraRtcEngine.muteLocalAudioStream(_mobX.isMutedGet);
  }

  void _onSwitchCamera() {
    AgoraRtcEngine.switchCamera();
  }
}

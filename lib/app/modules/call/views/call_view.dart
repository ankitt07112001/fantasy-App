import 'dart:async';
import 'dart:convert';
import 'package:agora_rtc_engine/agora_rtc_engine.dart';
import 'package:fantacy_user/commons/videoCallStrings.dart';

import 'package:flutter/material.dart';
//  import 'package:agora_rtc_engine/rtc_local_view.dart';

class VideoCall extends StatefulWidget {
  final String? ChannelName;
  final ClientRoleType? role;
  const VideoCall({super.key, this.ChannelName, this.role});

  @override
  State<VideoCall> createState() => _VideoCallState();
}

class _VideoCallState extends State<VideoCall> {
  final _users = <int>[];
  final _infoStrings = <String>[];
  bool muted = false;
  bool viewPanel = false;
  late RtcEngine _engine;

  @override
  void initState() {
    initalized();
    super.initState();
  }

  @override
  void dispose() {
    _users.clear();
    _engine.leaveChannel();
    // _engine.destroyCustomEncodedVideoTrack();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Agora"),
      ),
    );
  }

  Future<void> initalized() async {
    if (appId.isEmpty) {
      setState(() {
        _infoStrings.add("app id is missing ");
        _infoStrings.add("agora engine is not starting");
      });
      return;
    }

    //! initAgoraRtcEngine
    _engine = createAgoraRtcEngine();
    await _engine.initialize(const RtcEngineContext(
        appId: appId,
        channelProfile: ChannelProfileType.channelProfileLiveBroadcasting));
    await _engine.enableVideo();
    await _engine.setClientRole(role: widget.role!);
    //! add agora event handlers
    _addAgoraEventHandlers();
    VideoEncoderConfiguration configuration = VideoEncoderConfiguration();
    //  configuration.dimensions=VideoDimensions()
    await _engine.setVideoEncoderConfiguration(configuration);
    await _engine.joinChannel(
        token: videotoken,
        channelId: widget.ChannelName!,
        uid: 0,
        options: const ChannelMediaOptions());
  }

  void _addAgoraEventHandlers() {
    _engine.registerEventHandler(RtcEngineEventHandler(
      onJoinChannelSuccess: (RtcConnection connection, int elpased) {
        setState(() {
          final info = "join channel: $connection,id:$elpased";
          _infoStrings.add(info);
        });
      },
      onUserJoined: (RtcConnection connection, int uid, int elapsed) {
        debugPrint("remote user $uid joined");
        setState(() {
          final info = "user joined: $uid";
          _infoStrings.add(info);
          _users.add(uid);
        });
      },
      onUserOffline:
          (RtcConnection connection, int uid, UserOfflineReasonType reason) {
        debugPrint("remote user $uid left channel");
        setState(() {
          final info = "Users Offline:$uid";
          _infoStrings.add(info);
          _users.remove(uid);
        });
      },onTokenPrivilegeWillExpire: (RtcConnection connection, String token) {
      debugPrint(
          '[onTokenPrivilegeWillExpire] connection: ${connection.toJson()}, token: $token');
    },
    ));
  }
  //  Widget _remoteVideo() {
  //   if (_remoteUid != null) {
  //     return AgoraVideoView(
  //       controller: VideoViewController.remote(
  //         rtcEngine: _engine,
  //         canvas: VideoCanvas(uid: _remoteUid),
  //         connection: const RtcConnection(channelId: channel),
  //       ),
  //     );
  //   } else {
  //     return const Text(
  //       'Please wait for remote user to join',
  //       textAlign: TextAlign.center,
  //     );
  //   }
  // }
}

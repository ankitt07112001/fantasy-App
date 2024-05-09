import 'package:agora_rtc_engine/agora_rtc_engine.dart';
import 'package:agora_uikit/agora_uikit.dart';
import 'package:fantacy_user/app/modules/call/views/call_view.dart';
import 'package:flutter/material.dart';

class Index extends StatefulWidget {
  const Index({super.key});

  @override
  State<Index> createState() => _IndexState();
}

class _IndexState extends State<Index> {
  final _channelControler = TextEditingController();
  bool _validator = false;
  ClientRoleType? _role = ClientRoleType.clientRoleBroadcaster;
  @override
  void dispose() {
    _channelControler.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Agora")),
      body: Container(
        child: Column(
          children: [
            Image.asset("assets/images/man.png"),
            TextField(
              controller: _channelControler,
              decoration: InputDecoration(
                  hintText: "Channel Name",
                  errorText: _validator ? "channel name is mandotory" : null,
                  border:
                      UnderlineInputBorder(borderSide: BorderSide(width: 1))),
            ),
            RadioListTile(
                title: const Text("Broadcaster"),
                value: ClientRoleType.clientRoleBroadcaster,
                groupValue: _role,
                onChanged: (ClientRoleType? value) {
                  setState(() {
                    _role = value;
                  });
                }),
            RadioListTile(
                title: Text("Audienece"),
                value: ClientRoleType.clientRoleAudience,
                groupValue: _role,
                onChanged: (ClientRoleType? value) {
                  setState(() {
                    _role = value;
                  });
                }),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(onPressed: onjoin, child: Text("OJnjoin"))
          ],
        ),
      ),
    );
  }

  void onjoin() async {
    setState(() {
      _channelControler.text.isEmpty ? _validator = true : _validator = false;
    });
    if (_channelControler.text.isNotEmpty) {
      await _handleCameraAndMic(Permission.microphone);
      await _handleCameraAndMic(Permission.camera);
      await Navigator.push(
          context,
          MaterialPageRoute(
              builder: (_) => VideoCall(
                    ChannelName: _channelControler.text,
                    role: _role,
                  )));
    } else {}
  }

  _handleCameraAndMic(Permission permission) async {
    final status = await permission.request();
    print("status" + status.toString());
  }
}

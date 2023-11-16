import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:nfc_manager/nfc_manager.dart';

class NFCTest extends StatefulWidget {
  const NFCTest({super.key});

  @override
  State<NFCTest> createState() => _NFCTestState();
}

class _NFCTestState extends State<NFCTest> {
  bool isAvailable = false;
  @override
  void initState() {
// Start Session
    NfcManager.instance.startSession(
      onDiscovered: (NfcTag tag) async {
        // Do something with an NfcTag instance.
        Ndef? ndef = Ndef.from(tag);
        if (ndef == null || !ndef.isWritable) {
          print('Tag is not ndef writable');
          NfcManager.instance
              .stopSession(errorMessage: 'Tag is not ndef writable');
          return;
        }
        NdefMessage message = NdefMessage([
          NdefRecord.createText('Hello World!'),
          NdefRecord.createUri(Uri.parse('https://flutter.dev')),
          NdefRecord.createMime(
              'text/plain', Uint8List.fromList('Hello'.codeUnits)),
          NdefRecord.createExternal(
              'com.example', 'mytype', Uint8List.fromList('mydata'.codeUnits)),
        ]);

        try {
          await ndef.write(message);
          print('successfully wrote');
          NfcManager.instance.stopSession();
        } catch (e) {
          NfcManager.instance.stopSession(errorMessage: e.toString());
          return;
        }
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [Text('hey')]),
      ),
    );
  }
}

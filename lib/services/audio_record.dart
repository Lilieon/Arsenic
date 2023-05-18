import 'package:flutter/material.dart';
import 'package:record/record.dart';

class AudioRecordService {
  final record = Record();
  bool _isRecording = false;

  bool get isRecording => _isRecording;

  Future<void> startRecording() async {
    // await Permission.microphone.request();
    // final status = await Permission.microphone.status;

    // if (status.isGranted) {
    if (await record.hasPermission()) {
      await record.start(
        path: '/home/lilian/Bureau/Projets/Arsenic/application/myFile.mp3',
        encoder: AudioEncoder.aacLc, // by default
        bitRate: 128000, // by default
      );
      _isRecording = true;
    } else {
      debugPrint("Permission not granted");
    }
  }

  Future<void> stopRecording() async {
    final filePath = await record.stop();

    debugPrint('Stop recording: $filePath');
    _isRecording = false;
  }
}

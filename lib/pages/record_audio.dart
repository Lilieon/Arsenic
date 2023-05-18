import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:application/services/audio_record.dart';

class RecordAudioPage extends StatefulWidget {
  const RecordAudioPage({super.key});

  @override
  State<RecordAudioPage> createState() => _RecordAudioPageState();
}

class _RecordAudioPageState extends State<RecordAudioPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        title: const Text('Record Audio'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            MaterialButton(
              onPressed: () {
                final audioRecordService = Provider.of<AudioRecordService>(context, listen: false);
                audioRecordService.isRecording ? audioRecordService.stopRecording() : audioRecordService.startRecording();
              },
              child: Consumer<AudioRecordService>(
                builder: (context, audioRecordService, child) {
                  return Text(audioRecordService.isRecording ? 'Stop Recording' : 'Start Recording');
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'dart:ui' as ui;
import 'package:path_provider/path_provider.dart';
import 'package:open_file/open_file.dart';
import 'package:syncfusion_flutter_signaturepad/signaturepad.dart';
import 'package:universal_html/html.dart' show AnchorElement;
import 'package:flutter/foundation.dart' as kIsWeb;
import 'dart:convert';

class SignaturePage extends StatefulWidget {
  @override
  _SignaturePageState createState() => _SignaturePageState();
}

class _SignaturePageState extends State<SignaturePage> {
  final GlobalKey<SfSignaturePadState> _signaturePadStatekey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: Colors.grey, style: BorderStyle.solid)),
          height: 300,
          width: 300,
          padding: const EdgeInsets.all(8),
          margin: const EdgeInsets.all(8),
          child: Container(
            child: SfSignaturePad(
              maximumStrokeWidth: 6,
              minimumStrokeWidth: 4,
              key: _signaturePadStatekey,
              backgroundColor: Colors.black,
              strokeColor: Colors.white,
            ),
            height: 80,
            width: 100,
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            IconButton(
              onPressed: () async {
                ui.Image image = await _signaturePadStatekey.currentState!
                    .toImage(pixelRatio: 2);
                final byteData =
                    await image.toByteData(format: ui.ImageByteFormat.png);
                final Uint8List imageByte = byteData!.buffer.asUint8List(
                    byteData.offsetInBytes, byteData.lengthInBytes);

                if (kIsWeb.kIsWeb) {
                  AnchorElement(
                      href:
                          'data:Application/octet-stream;charset=utf-16le;base64,${base64.encode(imageByte)}')
                    ..setAttribute('download', 'Output.png')
                    ..click();
                } else {
                  final String path =
                      (await getApplicationSupportDirectory()).path;
                  final String fileName = '$path/output.png';
                  final File file = File(fileName);
                  await file.writeAsBytes(imageByte, flush: true);
                  OpenFile.open(fileName);
                }
              },
              icon: const Icon(
                Icons.save,
                color: Colors.green,
              ),
            ),
            const SizedBox(
              width: 5,
            ),
            IconButton(
              onPressed: () async {
                _signaturePadStatekey.currentState!.clear();
              },
              icon: const Icon(
                Icons.delete,
                color: Colors.red,
              ),
            ),
            const SizedBox(
              width: 5,
            ),
          ],
        )
      ],
    );
  }
}

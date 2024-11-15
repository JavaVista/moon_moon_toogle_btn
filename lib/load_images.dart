

import 'dart:async';
import 'dart:ui' as ui;

import 'package:flutter/services.dart';

Future<ui.Image> loadImages(String path) async {
 final ByteData data = await rootBundle.load(path);
  
 final Uint8List bytes = data.buffer.asUint8List();

 final Completer<ui.Image> completer = Completer();

 ui.decodeImageFromList(bytes,  (ui.Image img) {
   completer.complete(img);
 });

 return completer.future;
}
 
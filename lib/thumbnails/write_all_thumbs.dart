/// test of receiving thumbnails as an array of bytes
/// and writing thumbnails to local storage
/// intend to use as basis for Flutter app to display
/// thumbnails to mobile app screen
import 'package:apitest/thumbnails/get_all_thumbs.dart';
import 'dart:io';
import 'package:theta/theta.dart';

Future<void> writeAllThumbs() async {
  // get thumbs in byte format
  try {
    var thumbs = await getAllThumbs(
        await ThetaFile.listUrls(await ThetaFile.totalEntries));
    for (var i = 0; i < thumbs.length; i++) {
      await File('thumbnail-$i.jpg').writeAsBytes(thumbs[i]);
    }
  } catch (e) {
    print(e);
  }
}

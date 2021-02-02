import 'package:apitest/get_last_image_url.dart';
import 'package:apitest/thumbnails/get_thumb_2.dart';

void main(List<String> args) async {
  var lastImageUrl = await getLastImageUrl();
  await getThumb2(lastImageUrl);
}

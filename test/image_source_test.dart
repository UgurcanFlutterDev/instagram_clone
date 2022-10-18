import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:instagram_clone/resources/resources.dart';

void main() {
  test('image_source assets test', () {
    expect(File(ImageSource.noPhoto).existsSync(), true);
  });
}

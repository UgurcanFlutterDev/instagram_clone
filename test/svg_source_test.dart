import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:instagram_clone/resources/resources.dart';

void main() {
  test('svg_source assets test', () {
    expect(File(SvgSource.addButtonFilled).existsSync(), true);
    expect(File(SvgSource.addButtonOutlined).existsSync(), true);
    expect(File(SvgSource.heartFilled).existsSync(), true);
    expect(File(SvgSource.heartOutlined).existsSync(), true);
    expect(File(SvgSource.homeFilled).existsSync(), true);
    expect(File(SvgSource.homeOutlined).existsSync(), true);
    expect(File(SvgSource.messageButtonOutlined).existsSync(), true);
    expect(File(SvgSource.reels).existsSync(), true);
    expect(File(SvgSource.searchOutlined).existsSync(), true);
  });
}

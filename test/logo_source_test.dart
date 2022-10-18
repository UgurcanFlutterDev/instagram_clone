import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:instagram_clone/resources/resources.dart';

void main() {
  test('logo_source assets test', () {
    expect(File(LogoSource.whiteText).existsSync(), true);
    expect(File(LogoSource.whiteText2).existsSync(), true);
  });
}

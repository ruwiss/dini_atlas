import 'package:flutter_test/flutter_test.dart';
import 'package:dini_atlas/app/app.locator.dart';

import '../helpers/test_helpers.dart';

void main() {
  group('ImageSheetModel Tests -', () {
    setUp(() => registerServices());
    tearDown(() => locator.reset());
  });
}

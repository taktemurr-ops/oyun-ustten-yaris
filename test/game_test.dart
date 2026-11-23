import 'package:flutter_test/flutter_test.dart';
import 'package:oyun_ustten_yaris/oyun_ustten_yaris.dart';
import 'package:studio_core/core/level_plan.dart';

void main() {
  test('33 dilde ad ve anlatım', () {
    expect(usttenConfig.title.length, 33);
    expect(usttenConfig.tagline.length, 33);
    for (final s in usttenConfig.tutorial) {
      expect(s.text.length, 33);
    }
  });

  test('bölümler üretilir ve bot tarafından geçilir', timeout: const Timeout(Duration(minutes: 10)), () {
    expect(usttenRules.levelCount, 100000);
    final planner = LevelPlanner(gameId: usttenId, optionalMechanics: usttenRules.optionalMechanics);
    for (final lv in [1, 77, 1500, 33333, 99999]) {
      expect(usttenRules.build(planner.spec(lv)).validation.ok, isTrue, reason: 'bölüm $lv');
    }
  });
}

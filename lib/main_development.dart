import 'package:done_stuff/main.dart' as runner;
import 'package:done_stuff/core/flavor/core.dart';

Future<void> main() async {
  F.appFlavor = Flavor.dev;
  await runner.main();
}

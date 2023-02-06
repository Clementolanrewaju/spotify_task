import 'package:spotify_task/app/shared/helpers/classes/preferences/preferences.dart';
import 'envrionment/environment_setup.dart';

class Setups {
  static Future<void> run() async {
    await Preferences.initalize();
    // await Firebase.initializeApp(
    //   options: DefaultFirebaseOptions.currentPlatform,
    // );
    EnvironmentSetup.run(environment: Environment.live);
  }
}

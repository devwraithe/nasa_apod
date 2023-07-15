import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'app/app.dart';
import 'app/core/utilities/image_entity_adapter.dart';
import 'app/core/utilities/injectors/dependency_injector.dart' as di;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  di.init();
  // Initialize Hive and register adapters
  await Hive.initFlutter();
  Hive.registerAdapter(ImageEntityAdapter());
  runApp(const CloudwalkAssessment());
}

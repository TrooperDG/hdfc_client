import 'package:flutter/material.dart';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

//files----
import 'package:hdfc_support_app/app_root.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await dotenv.load(fileName: ".env");
  runApp(ProviderScope(child: HdfcSupportApp()));
}

class HdfcSupportApp extends StatelessWidget {
  const HdfcSupportApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'HDFC Support App',
      theme: ThemeData(useMaterial3: true),
      home: AppRoot(),
    );
  }
}

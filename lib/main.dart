import 'package:black_jack_21/app/modules/card_table/presentation/pages/card_table_page/card_table_page.dart';
import 'package:flutter/material.dart';
// ignore: library_prefixes
import 'package:black_jack_21/injection_container.dart' as injectionContainer;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await injectionContainer.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Flutter Demo',
      home: CardTablePage(),
    );
  }
}

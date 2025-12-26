import 'package:flutter/material.dart';
import 'package:provider_course/pages/Selector.dart';
import 'package:provider_course/pages/changeNotiferProvider_and_consumer.dart';
import 'package:provider_course/pages/context_read_and_watch.dart';
import 'package:provider_course/pages/multiprovider.dart';
import 'package:provider_course/pages/provider_of_context.dart';
import 'package:provider_course/pages/provider_vs_changeNotifierProvider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      // home: const ChangenotiferproviderAndConsumer(),
      // home: const Selector(),
      // home: const ContextReadAndWatch(),
      // home: const ProviderVsChangenotifierprovider(),
      home: const Multiprovider(),
    );
  }
}

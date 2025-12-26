import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Multiprovider extends StatelessWidget {
  const Multiprovider({super.key});
  // final String name = 'Welcome: ';
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ProvOne()),
        ChangeNotifierProvider(create: (context) => ProvTwo()),
      ],

      child: Scaffold(
        appBar: AppBar(
          title: const Text('MultiProvider'),
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        ),
        body: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Center(
            child: Column(
              children: [
                Consumer<ProvOne>(
                  builder: (context, value, child) {
                    debugPrint('Consumer text 1');
                    return Text(value.showSoemthing1);
                  },
                ),
                Consumer<ProvTwo>(
                  builder: (context, value, child) {
                    debugPrint('Consumer text 2');
                    return Text(value.showSoemthing2);
                  },
                ),
                Consumer<ProvOne>(
                  builder: (context, value, child) {
                    return ElevatedButton(
                      onPressed: () {
                        value.changeTextProvider1();
                        debugPrint('Consumer button 1');
                      },
                      child: const Text('Do Something 1'),
                    );
                  },
                ),
                Consumer<ProvTwo>(
                  builder: (context, value, child) {
                    return ElevatedButton(
                      onPressed: () {
                        value.changeTextProvider2();
                        debugPrint('Consumer button 2');
                      },
                      child: const Text('Do Something 2'),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ProvOne with ChangeNotifier {
  String showSoemthing1 = 'Provider';
  void changeTextProvider1() {
    showSoemthing1 = 'Provider One';
    notifyListeners();
  }
}

class ProvTwo with ChangeNotifier {
  String showSoemthing2 = 'Provider2';

  void changeTextProvider2() {
    showSoemthing2 = 'Provider Two';
    notifyListeners();
  }
}

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ChangenotiferproviderAndConsumer extends StatelessWidget {
  const ChangenotiferproviderAndConsumer({super.key});
  // final String name = 'Welcome: ';
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ProvOne(),

      child: Scaffold(
        appBar: AppBar(
          title: const Text('ChangeNotiferProvider and Consumer'),
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
                Consumer<ProvOne>(
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
                Consumer<ProvOne>(
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

class ProvOne extends ChangeNotifier {
  String showSoemthing1 = 'Provider';
  String showSoemthing2 = 'Provider';
  void changeTextProvider1() {
    showSoemthing1 = 'Provider One';
    notifyListeners();
  }

  void changeTextProvider2() {
    showSoemthing2 = 'Provider Two';
    notifyListeners();
  }
}

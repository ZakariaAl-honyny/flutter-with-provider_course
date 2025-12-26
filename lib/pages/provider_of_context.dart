import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProviderOfContext extends StatelessWidget {
  const ProviderOfContext({super.key});
  // final String name = 'Welcome: ';
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => Model(),

      child: Scaffold(
        appBar: AppBar(
          title: const Text('ChangeNotiferProvider and provider.of(context)'),
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        ),
        body: MyAnotherPage(),
      ),
    );
  }
}

class MyAnotherPage extends StatelessWidget {
  const MyAnotherPage({super.key});

  @override
  Widget build(BuildContext context) {
    var model = Provider.of<Model>(
      context,
      listen: true,
    ); // listen for changes and rebuild UI
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Center(
        child: Column(
          children: [
            Text(model.showSoemthing1),
            ElevatedButton(
              onPressed: () {
                model.changeTextProvider1();
                debugPrint('change Text Provider 1');
              },
              child: const Text('Do Something 1'),
            ),
          ],
        ),
      ),
    );
  }
}

class Model extends ChangeNotifier {
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

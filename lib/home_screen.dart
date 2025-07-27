import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'future_provider.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final provider = ref.watch(futureProvider);
    final provider2 = ref.watch(futureProvider2);
    return Scaffold(
      appBar: AppBar(
        title: Text('Future Provider'),
      ),
      body: Column(
        children: [

          Center(
            child: provider.when(
                data: (value) => Text(value.toString()),
                error: (error, stack) => Text(error.toString()),
                loading: () => CircularProgressIndicator()
            ),
          ),
          Center(
            child: provider2.when(
                skipLoadingOnRefresh: false,
                data: (value) => ListView.builder(
                    itemCount: value.length,
                    itemBuilder: (context, index){
                  return Text(value[index].toString());
                }),
                error: (error, stack) => Text(error.toString()),
                loading: () => CircularProgressIndicator()
            ),
          ),

        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {  
          ref.invalidate(futureProvider2);
        },
        child: Icon(Icons.refresh),
      ),
    );
  }
}

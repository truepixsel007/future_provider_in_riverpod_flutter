

import 'package:flutter_riverpod/flutter_riverpod.dart';

final futureProvider = FutureProvider<int>((ref) async{
    await Future.delayed(Duration(seconds: 2));
    // throw 'internet not Working';
    return 3;
});

final futureProvider2 = FutureProvider<List<String>>((ref) async{
  await Future.delayed(Duration(seconds: 2));
  // throw 'internet not Working';
  return ['arsh', 'deep', 'singh'];
});

// Copyright (c) 2022, Very Good Ventures
// https://verygood.ventures
//
// Use of this source code is governed by an MIT-style
// license that can be found in the LICENSE file or at
// https://opensource.org/licenses/MIT.

import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:wordsus_app/counter/counter.dart';
import 'package:wordsus_app/l10n/l10n.dart';

class CounterPage extends StatelessWidget {
  const CounterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => CounterCubit(),
      child: const CounterView(),
    );
  }
}

class CounterView extends StatelessWidget {
  const CounterView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return Scaffold(
      appBar: AppBar(title: Text(l10n.counterAppBarTitle)),
      body: const Center(
        child: TryingVercelApi(),
      ),
    );
  }
}

class TryingVercelApi extends StatelessWidget {
  const TryingVercelApi({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        ElevatedButton(
          child: const Text('Create Project'),
          onPressed: () async {
            final response = await http.post(
              Uri.parse('https://api.vercel.com/v8/projects'),
              headers: {'Authorization': 'Bearer R1tdiVqPKLDhtu5Rg9huynCv'},
              body: jsonEncode({'name': 'test-project'}),
            );
            log(response.body);
          },
        ),
        const SizedBox(height: 20),
        ElevatedButton(
          child: const Text('Create deploy'),
          onPressed: () async {
            //
            // Create new deployment
            //

            const filename = 'lib/counter/view/index.html';
            final file = File(filename).readAsBytesSync();

            final deployResponse = await http.post(
              Uri.parse('https://api.vercel.com/v13/deployments'),
              headers: {'Authorization': 'Bearer R1tdiVqPKLDhtu5Rg9huynCv'},
              body: jsonEncode({
                'name': 'test-project',
                'files': [
                  // {
                  //   'file': 'index.html',
                  //   'data': 'Hello World',
                  // },
                  {
                    'file': filename.split('/').last,
                    'data': String.fromCharCodes(file),
                  },
                ],
                'target': 'production',
              }),
            );
            log(deployResponse.body);
          },
        ),
      ],
    );
  }
}

// class CounterView extends StatelessWidget {
//   const CounterView({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     final l10n = context.l10n;
//     return Scaffold(
//       appBar: AppBar(title: Text(l10n.counterAppBarTitle)),
//       body: const Center(child: CounterText()),
//       floatingActionButton: Column(
//         mainAxisAlignment: MainAxisAlignment.end,
//         crossAxisAlignment: CrossAxisAlignment.end,
//         children: [
//           FloatingActionButton(
//             onPressed: () => context.read<CounterCubit>().increment(),
//             child: const Icon(Icons.add),
//           ),
//           const SizedBox(height: 8),
//           FloatingActionButton(
//             onPressed: () => context.read<CounterCubit>().decrement(),
//             child: const Icon(Icons.remove),
//           ),
//         ],
//       ),
//     );
//   }
// }

// class CounterText extends StatelessWidget {
//   const CounterText({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     final theme = Theme.of(context);
//     final count = context.select((CounterCubit cubit) => cubit.state);
//     return Text('$count', style: theme.textTheme.headline1);
//   }
// }

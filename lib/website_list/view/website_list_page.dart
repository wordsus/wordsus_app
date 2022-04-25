import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wordsus_app/website_list/cubit/website_list_cubit.dart';
import 'package:wordsus_app/website_list/view/widgets/widgets.dart';

class WebsiteListPage extends StatelessWidget {
  const WebsiteListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => WebsiteListCubit(),
      child: const WebsiteListView(),
    );
  }
}

class WebsiteListView extends StatelessWidget {
  const WebsiteListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.all(10),
          child: Image.asset('assets/images/logo.png'),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(10),
            child: Image.asset('assets/images/avatar-no-photo.png'),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(
              maxWidth: 1200,
              minWidth: 1200,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 15,
                    vertical: 20,
                  ),
                  child: Wrap(
                    spacing: 15,
                    runSpacing: 15,
                    children: [
                      CreationActionCard(
                        icon: const Icon(Icons.web, size: 38),
                        title: 'New website project',
                        subtitle: 'Write and publish blog posts',
                        onTap: () {
                          context.beamToNamed('/project');
                        },
                      ),
                    ],
                  ),
                ),
                const Divider(height: 1),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 15,
                    vertical: 20,
                  ),
                  child: Wrap(
                    spacing: 15,
                    runSpacing: 15,
                    children: [
                      // EmptyProjectListMsg(),
                      ProjectCard(
                        icon: const Icon(Icons.web, size: 38),
                        title: 'My new awesome blog',
                        subtitle: 'Some blog description',
                        onTap: () {},
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class EmptyProjectListMsg extends StatelessWidget {
  const EmptyProjectListMsg({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.only(top: 100),
      child: Center(
        child: Text("You haven't created projects yet"),
      ),
    );
  }
}

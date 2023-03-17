import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'controller/user_controller.dart';

final userController = ChangeNotifierProvider((_) => UserController());

class HomeView extends ConsumerStatefulWidget {
  const HomeView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomeViewState();
}

class _HomeViewState extends ConsumerState<HomeView> {
  @override
  void initState() {
    ref.read(userController).fetchUsers();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var res = ref.read(userController);
    return Scaffold(
      appBar: AppBar(title: const Text("Home View"), centerTitle: true),
      body: !ref.watch(userController).isLoading
          ? ListView.builder(
              physics: const BouncingScrollPhysics(),
              shrinkWrap: true,
              itemCount: res.userList?.length,
              itemBuilder: (BuildContext context, int index) {
                var user = res.userList![index];
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Card(
                    child: ListTile(
                      leading: CircleAvatar(backgroundImage: NetworkImage(user.avatar!)),
                      title: Text("${user.firstName!} ${user.lastName}"),
                      subtitle: Text(user.email!),
                    ),
                  ),
                );
              },
            )
          : const Center(child: CircularProgressIndicator()),
    );
  }
}

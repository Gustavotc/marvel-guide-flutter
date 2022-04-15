import 'package:flutter/material.dart';
import 'package:marvel_guide/controller/home_controller.dart';
import 'package:marvel_guide/repository/home_repository.dart';
import 'package:marvel_guide/route/route.dart' as route;
import 'package:marvel_guide/view/home/widgets/custom_progress_indicator.dart';
import 'package:marvel_guide/view/home/widgets/hero_card.dart';
import 'package:marvel_guide/view/home/widgets/user_header.dart';

import '../../model/hero_model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late HomeController controller;
  late ScrollController _scrollController;

  String _username = '';

  _fetchUsername() async {
    String name = await controller.getUserName();
    setState(() {
      _username = name;
    });
  }

  _handleLogout() async {
    if (await controller.logout()) {
      Navigator.pushReplacementNamed(context, route.login);
    }
  }

  @override
  void initState() {
    super.initState();
    controller = HomeController(repository: HomeRepository());
    _fetchUsername();
    _scrollController = controller.scrollController;
    controller.scrollController.addListener(() {
      if (_scrollController.position.pixels >=
          _scrollController.position.maxScrollExtent) {
        print('BUSCAR MAIS');
        // _fetchHeroes();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Heróis'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            UserHeader(username: _username, logout: _handleLogout),
            Flexible(
              child: FutureBuilder(
                future: controller.fetchHeroes(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.done &&
                      snapshot.hasData) {
                    List<HeroModel> data = snapshot.data as List<HeroModel>;
                    return ListView.builder(
                      controller: controller.scrollController,
                      itemCount: data.length,
                      itemBuilder: (context, index) {
                        return HeroCard(
                          name: data[index].name,
                          imagePath: data[index].imageUrl,
                        );
                      },
                    );
                  } else {
                    return const CustomProgressIndicator();
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

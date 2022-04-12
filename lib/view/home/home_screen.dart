import 'package:flutter/material.dart';
import 'package:marvel_guide/controller/home_controller.dart';
import 'package:marvel_guide/core/app_colors.dart';
import 'package:marvel_guide/repository/home_repository.dart';
import 'package:marvel_guide/route/route.dart' as route;
import 'package:marvel_guide/view/home/widgets/custom_progress_indicator.dart';
import 'package:marvel_guide/view/home/widgets/hero_avatar.dart';
import 'package:marvel_guide/view/home/widgets/hero_name.dart';
import 'package:marvel_guide/view/home/widgets/user_header.dart';

import '../../model/hero_model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late HomeController controller;

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

  Future<List<HeroModel>> _fetchHeroes() async {
    return await controller.fetchHeroes();
  }

  @override
  void initState() {
    super.initState();
    controller = HomeController(repository: HomeRepository());
    _fetchUsername();
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
            FutureBuilder(
              future: _fetchHeroes(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done &&
                    snapshot.hasData) {
                  List<HeroModel> data = snapshot.data as List<HeroModel>;
                  return Expanded(
                    child: ListView.builder(
                      itemCount: data.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              HeroAvatar(imagePath: data[index].imageUrl),
                              HeroName(name: data[index].name),
                            ],
                          ),
                        );
                      },
                    ),
                  );
                } else {
                  return const CustomProgressIndicator();
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}

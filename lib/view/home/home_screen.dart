import 'package:flutter/material.dart';
import 'package:marvel_guide/controller/home_controller.dart';
import 'package:marvel_guide/repository/home_repository.dart';
import 'package:marvel_guide/route/route.dart' as route;
import 'package:marvel_guide/view/home/widgets/custom_progress_indicator.dart';
import 'package:marvel_guide/view/home/widgets/hero_card.dart';
import 'package:marvel_guide/view/home/widgets/user_header.dart';
import 'package:marvel_guide/view/widgets/heroes_list.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late HomeController controller;
  late ScrollController _scrollController;

  final loading = ValueNotifier(true);
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

  _fetchHeroes() async {
    loading.value = true;
    await controller.fetchHeroes();
    loading.value = false;
  }

  _handleInfiniteScrolling() {
    if (_scrollController.position.pixels >=
        _scrollController.position.maxScrollExtent) {
      _fetchHeroes();
    }
  }

  @override
  void initState() {
    super.initState();
    controller = HomeController(repository: HomeRepository());
    _fetchUsername();
    _fetchHeroes();
    _scrollController = controller.scrollController;
    controller.scrollController.addListener(_handleInfiniteScrolling);
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
              child: HeroesList(
                animation: controller,
                scrollController: _scrollController,
                loading: loading,
                heroes: controller.heroes,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

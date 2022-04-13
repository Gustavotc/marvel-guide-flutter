import 'package:flutter/material.dart';
import 'package:marvel_guide/repository/search_repository.dart';
import 'package:marvel_guide/view/home/widgets/hero_card.dart';
import 'package:marvel_guide/view/search/widgets/search_bar.dart';

import '../../controller/search_controller.dart';
import '../../model/hero_model.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  List<HeroModel> heroesResult = [];
  late SearchController controller;

  _fetchHero(String name) async {
    List<HeroModel> response = await controller.fetchHeroes(name);
    setState(() {
      heroesResult = response;
    });
  }

  @override
  void initState() {
    super.initState();
    controller = SearchController(repository: SearchRepository());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Buscar Herói'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: <Widget> [
            SearchBar(
              searchFn: _fetchHero,
            ),
            Expanded(
              child: ListView.builder(
                itemCount: heroesResult.length,
                itemBuilder: (context, index) {
                  return HeroCard(
                    name: heroesResult[index].name,
                    imagePath: heroesResult[index].imageUrl,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

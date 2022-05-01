import 'package:flutter/material.dart';
import 'package:marvel_guide/controller/hero_details_controller.dart';
import 'package:marvel_guide/model/hero_model.dart';
import 'package:marvel_guide/repository/hero_details_repository.dart';
import 'package:marvel_guide/view/heroDetails/widgets/detail_hero_descpription.dart';
import 'package:marvel_guide/view/heroDetails/widgets/detail_hero_name.dart';
import 'package:marvel_guide/view/heroDetails/widgets/hero_detail_image.dart';
import 'package:marvel_guide/view/heroDetails/widgets/shimmer_hero_comics.dart';
import 'package:marvel_guide/view/home/widgets/comic_card.dart';

class HeroDetailsScreen extends StatefulWidget {
  final HeroModel hero;
  const HeroDetailsScreen({Key? key, required this.hero}) : super(key: key);

  @override
  State<HeroDetailsScreen> createState() => _HeroDetailsScreenState();
}

class _HeroDetailsScreenState extends State<HeroDetailsScreen> {
  late HeroDetailsController _controller;
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    _controller = HeroDetailsController(repository: HeroDetailsRepository());
    _fetchComics();
  }

  _fetchComics() async {
    setState(() {
      isLoading = true;
    });
    await _controller.fetchHeroComics(widget.hero.id);
    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.hero.name),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 430,
              child: Stack(
                children: [
                  HeroDetailImage(
                    id: widget.hero.id,
                    imageUrl: widget.hero.imageUrl,
                  ),
                  DetailHeroName(
                    name: widget.hero.name,
                  ),
                ],
              ),
            ),
            DetailHeroDescription(text: widget.hero.description),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text('Últimas aparições em quadrinhos:'),
            ),
            isLoading
                ? const ShimmerHeroComics()
                : SizedBox(
                    height: 200,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: _controller.comicsList.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ComicCard(
                            title: _controller.comicsList[index].title,
                            imagePath: _controller.comicsList[index].imageUrl,
                          ),
                        );
                      },
                    ),
                  ),
            const SizedBox(height: 16)
          ],
        ),
      ),
    );
  }
}

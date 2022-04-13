import 'package:flutter/material.dart';
import 'package:marvel_guide/repository/comics_repository.dart';
import 'package:marvel_guide/view/home/widgets/custom_progress_indicator.dart';

import '../../controller/comics_controller.dart';
import '../../model/comic_model.dart';

class ComicsScreen extends StatefulWidget {
  const ComicsScreen({Key? key}) : super(key: key);

  @override
  State<ComicsScreen> createState() => _ComicsScreenState();
}

class _ComicsScreenState extends State<ComicsScreen> {
  late ComicsController controller;

  @override
  void initState() {
    super.initState();
    controller = ComicsController(repository: ComicsRepository());
  }

  _fetchComics() async {
    return await controller.fetchComics();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Quadrinhos'),
      ),
      body: FutureBuilder(
        future: _fetchComics(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done &&
              snapshot.hasData) {
            List<ComicModel> comics = snapshot.data as List<ComicModel>;
            return ListView.builder(
              itemCount: comics.length,
              itemBuilder: (context, index) {
                return Text(comics[index].title);
              },
            );
          } else {
            return const CustomProgressIndicator();
          }
        },
      ),
    );
  }
}

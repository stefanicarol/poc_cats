import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../../../core/domain/model/breeds_model.dart';
import 'home_store.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final store = Modular.get<HomeStore>();

  @override
  void initState() {
    buscar();
    super.initState();
  }

  Future<void> buscar() async {
    await store.fetchBreeds();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Busca gatinhos"),
      ),
      body: Observer(builder: (context) {
        if (store.appResponse.isCompleted) {
          return ListView.builder(
              padding: const EdgeInsets.all(0),
              itemCount: store.breedsList!.length,
              itemBuilder: (BuildContext context, int index) {
                BreedsModel breed = store.breedsList![index];
                int id = index + 1;
                return InkWell(
                  onTap: () =>
                      Modular.to.pushNamed('/details', arguments: breed),
                  child: ListTile(
                    leading: CircleAvatar(
                      child: Text(id.toString()),
                    ),
                    trailing: const Icon(Icons.arrow_forward_ios_rounded),
                    isThreeLine: true,
                    title: Text("Raça: ${breed.name}"),
                    subtitle: Text(
                      "Descrição: ${breed.description}",
                      textAlign: TextAlign.justify,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                );
              });
        }
        if (store.appResponse.isLoading) {
          return const CircularProgressIndicator();
        }
        if (store.appResponse.hasError) {
          return const Text("Error");
        }

        return const SizedBox();
      }),
    );
  }
}

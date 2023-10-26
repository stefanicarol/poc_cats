import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../core/domain/model/breeds_model.dart';
import '../../../core/utils/device_info.dart';
import 'home_store.dart';

class DetailsPage extends StatefulWidget {
  final BreedsModel breed;
  const DetailsPage({super.key, required this.breed});

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  final store = Modular.get<HomeStore>();

  @override
  void initState() {
    buscar();
    super.initState();
  }

  Future<void> buscar() async {
    await store.fetchBreedsPhotos(id: widget.breed.id.toString());
  }

  @override
  Widget build(BuildContext context) {
    Device.init(context);

    return Scaffold(
        appBar: AppBar(
          title: Text(
            widget.breed.name.toString(),
          ),
          centerTitle: true,
        ),
        body: Observer(builder: (context) {
          if (store.appResponsePhotos.isCompleted) {
            return SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(18.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    StarWidget(
                      quantity: widget.breed.adaptability!,
                      text: 'Adaptável',
                    ),
                    StarWidget(
                      quantity: widget.breed.intelligence!,
                      text: 'Inteligência',
                    ),
                    StarWidget(
                      quantity: widget.breed.energyLevel!,
                      text: 'Nível de energia',
                    ),
                    const SizedBox(height: 20),
                    Flexible(
                      child: ListView.builder(
                        itemCount: 1,
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: (BuildContext context, int index) {
                          return Column(
                            children: [
                              CachedNetworkImage(
                                width: double.infinity,
                                height: Device.height * 0.5,
                                imageUrl: store.breedsPhoto![0].url!,
                                fit: BoxFit.fill,
                                progressIndicatorBuilder:
                                    (context, url, downloadProgress) =>
                                        SizedBox(
                                  width: Device.width * 0.45,
                                  height: Device.height * 0.30,
                                  child: Center(
                                    child: CircularProgressIndicator(
                                        value: downloadProgress.progress),
                                  ),
                                ),
                                errorWidget: (context, url, error) =>
                                    const Icon(Icons.error),
                              ),
                              const SizedBox(height: 20),
                              Text(
                                "Descrição: ${widget.breed.description}",
                                textAlign: TextAlign.justify,
                              ),
                            ],
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            );
          }
          if (store.appResponsePhotos.isLoading) {
            return const LinearProgressIndicator();
          }
          if (store.appResponsePhotos.hasError) {
            return const Text("Error");
          }

          return const SizedBox();
        }));
  }
}

class StarWidget extends StatelessWidget {
  final String text;
  final int quantity;
  const StarWidget({
    Key? key,
    required this.text,
    required this.quantity,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(text),
        SizedBox(
          height: 30,
          child: ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
            itemCount: quantity,
            itemBuilder: (context, i) {
              return const Icon(
                Icons.star,
                color: Colors.amber,
              );
            },
          ),
        ),
      ],
    );
  }
}

class StartWidget extends StatefulWidget {
  final int star;
  const StartWidget({
    Key? key,
    required this.star,
  }) : super(key: key);

  @override
  State<StartWidget> createState() => _StartWidgetState();
}

class _StartWidgetState extends State<StartWidget> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      shrinkWrap: true,
      itemCount: widget.star,
      itemBuilder: (context, i) {
        return const Icon(
          Icons.star,
          color: Colors.amber,
        );
      },
    );
  }
}

import 'package:flutter_modular/flutter_modular.dart';
import 'package:poc/modules/app_module/pages/details_page.dart';
import 'package:poc/modules/app_module/pages/home_store.dart';
import '../../core/domain/repository/breeds_repository.model.dart';
import 'pages/home_page.dart';

class AppModule extends Module {
  static const String routeName = '/AppModule';

  @override
  void binds(i) {
    i.addSingleton(BreedsRepository.new);
    i.addSingleton(HomeStore.new);
  }

  @override
  void routes(r) {
    r.child('/', child: (context) => const HomePage());
    r.child('/details',
        child: (
          context,
        ) =>
            DetailsPage(breed: r.args.data));
  }
}

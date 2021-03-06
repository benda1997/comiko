import 'package:comiko/app_state.dart';
import 'package:comiko/widgets/event_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:meta/meta.dart';
import 'package:redux/redux.dart';

class LikedEventsPage extends StatelessWidget {
  final Store<AppState> store;

  LikedEventsPage({
    @required this.store,
  });

  @override
  Widget build(BuildContext context) {
    var orientation = MediaQuery.of(context).orientation;
    return new Scaffold(
      appBar: new AppBar(
        leading: new Container(
          margin: new EdgeInsets.all(12.0),
          child: new Image(
            image: const AssetImage('lib/assets/comiko_logo.png'),
            fit: BoxFit.contain,
          ),
        ),
        title: const Text('Favoris'),
      ),
      body: new StoreConnector<AppState, List<EventCardViewModel>>(
        converter: (store) => store.state.getFavoriteEvents(),
        builder: (context, vms) => new GridView.count(
              crossAxisCount: orientation == Orientation.portrait ? 1 : 3,
              padding: const EdgeInsets.all(8.0),
              mainAxisSpacing: 4.0,
              crossAxisSpacing: 4.0,
              children: vms
                  .map((EventCardViewModel vm) =>
                      new EventCard(vm, store: store))
                  .toList(),
            ),
      ),
    );
  }
}

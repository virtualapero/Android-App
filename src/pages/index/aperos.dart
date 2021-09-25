import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../dependencies.dart';
import '../../services/aperos.dart';
import '../../sturcturs/apero.dart';

class HomeAperosView extends StatefulWidget {
  const HomeAperosView({Key? key}) : super(key: key);

  @override
  State<HomeAperosView> createState() => _HomeAperosView();
}

class _HomeAperosView extends State<HomeAperosView> {
  final ScrollController _controller = ScrollController();
  AperosService service = dependencies<AperosService>();

  bool _loading = false;
  List<Apero> _apero = [];

  @override
  void initState() {
    _controller.addListener(_onScroll);
    _loadMore();
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  _loadMore() async {
    if (service.allLoaded()) return;
    if (_loading) return;
    setState(() {
      _loading = true;
    });
    await service.loadMore();
    setState(() {
      _loading = false;
      _apero = service.aperos;
    });
  }

  _onScroll() {
    if (_controller.offset >= _controller.position.maxScrollExtent &&
        !_controller.position.outOfRange) {
      _loadMore();
    }
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
        child: ListView.builder(
          controller: _controller,
          itemCount: service.allLoaded() ? _apero.length : _apero.length + 1,
          itemBuilder: (BuildContext context, int index) {
            if (_apero.length == index) {
              return const Center(
                  child: Padding(
                    padding: EdgeInsets.all(16.0),
                    child: CircularProgressIndicator(),
                  ));
            }
            var apero = service.aperos[index];
            var content = [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    apero.title,
                    style: const TextStyle(
                      fontSize: 28.0,
                    ),
                    textAlign: TextAlign.left,
                  ),
                  const Spacer(),
                  Text(
                    "${apero.date.day}.${apero.date.month}.${apero.date.year}",
                    style: Theme
                        .of(context)
                        .textTheme
                        .caption,
                  )
                ],
              ),
              Text(
                apero.member,
                style: Theme
                    .of(context)
                    .textTheme
                    .caption,
              )
            ];

            if (apero.content.isNotEmpty) {
              content.addAll([
                const SizedBox(
                  height: 8.0,
                ),
                Text(apero.content)
              ]);
            }

            return Card(
            child: Padding(
            padding: EdgeInsets.all(8.0),
            child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: content
            ),
            ));
          },
        ),
        onRefresh: () async {
          _loading = true;
          await service.reload();
          setState(() {
            _loading = false;
            _apero = service.aperos;
          });
        });
  }
}

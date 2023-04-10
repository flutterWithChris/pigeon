import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MainAppBar extends StatelessWidget {
  List<Widget>? actions = [];
  MainAppBar({
    super.key,
    this.actions,
  });

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      backgroundColor: Colors.transparent,
      title: Wrap(
          spacing: 10.0,
          crossAxisAlignment: WrapCrossAlignment.center,
          children: const [
            Icon(FontAwesomeIcons.seedling, size: 16),
            Text('Pigeon')
          ]),
      leading: IconButton(
              onPressed: () => Navigator.pop(context),
              icon: const Icon(Icons.chevron_left))
          .animate()
          .fadeIn(duration: 600.ms, curve: Curves.easeOutSine)
          .slideX(
              duration: 600.ms,
              begin: 1.0,
              end: 0.0,
              curve: Curves.easeOutSine),
      actions: actions ??
          [
            IconButton(
                onPressed: () {}, icon: const Icon(Icons.search_rounded)),
            Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: IconButton(
                  onPressed: () => Scaffold.of(context).openEndDrawer(),
                  icon: const Icon(Icons.menu_rounded)),
            ),
          ],
      floating: true,
      snap: true,
      expandedHeight: 60,
      flexibleSpace: const FlexibleSpaceBar(
        centerTitle: false,
        // background: FlutterLogo(),
      ),
    );
  }
}

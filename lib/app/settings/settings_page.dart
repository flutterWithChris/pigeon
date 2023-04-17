import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:pigeon/core/presentation/widgets/main_app_bar.dart';
import 'package:pigeon/core/presentation/widgets/main_bottom_nav_bar.dart';
import 'package:settings_ui/settings_ui.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      bottomNavigationBar: const MainBottomNavBar(),
      body: CustomScrollView(
        slivers: [
          MainAppBar(),
          SliverFillRemaining(
            child: SettingsList(
              sections: [
                SettingsSection(title: const Text('General'), tiles: [
                  SettingsTile(
                    title: const Text('Icon Mode'),
                    leading: const Icon(FontAwesomeIcons.icons),
                    description: Padding(
                      padding: const EdgeInsets.only(top: 4.0),
                      child: SizedBox(
                        width: 240,
                        child: FittedBox(
                          child: SegmentedButton(
                            selected: const {0},
                            segments: [
                              ButtonSegment(
                                  value: {},
                                  label: Text(
                                    'Icon',
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodySmall!
                                        .copyWith(color: Colors.black87),
                                  )),
                              ButtonSegment(
                                  value: {},
                                  label: Text(
                                    'Label',
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodySmall!
                                        .copyWith(color: Colors.black87),
                                  )),
                              ButtonSegment(
                                  value: {},
                                  label: Text(
                                    'Icon + Label',
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodySmall!
                                        .copyWith(color: Colors.black87),
                                  )),
                            ],
                          ),
                        ),
                      ),
                    ),
                    onPressed: (BuildContext context) {},
                  ),
                  SettingsTile(
                    title: const Text('Security'),
                    leading: const Icon(Icons.lock),
                    onPressed: (BuildContext context) {},
                  ),
                  SettingsTile(
                    title: const Text('Notifications'),
                    leading: const Icon(Icons.notifications),
                    onPressed: (BuildContext context) {},
                  ),
                  SettingsTile(
                    title: const Text('Data and storage'),
                    leading: const Icon(Icons.storage),
                    onPressed: (BuildContext context) {},
                  ),
                ]),
              ],
            ),
          )
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
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
      shadowColor: Colors.transparent,
      backgroundColor: Theme.of(context).colorScheme.background,
      foregroundColor: Theme.of(context).textTheme.bodyMedium!.color,
      title: Wrap(
          spacing: 10.0,
          crossAxisAlignment: WrapCrossAlignment.center,
          children: const [
            Icon(FontAwesomeIcons.seedling, size: 16),
            Text('Pigeon')
          ]),
      // leading: IconButton(
      //         onPressed: () => Navigator.pop(context),
      //         icon: const Icon(Icons.chevron_left))
      //     .animate()
      //     .fadeIn(duration: 600.ms, curve: Curves.easeOutSine)
      //     .slideX(
      //         duration: 600.ms,
      //         begin: 1.0,
      //         end: 0.0,
      //         curve: Curves.easeOutSine),
      actions: actions ??
          [
            IconButton(
                onPressed: () {
                  showSearch(context: context, delegate: MySearchDelegate());
                },
                icon: const Icon(Icons.search_rounded)),
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

class MySearchDelegate extends SearchDelegate {
  @override
  ThemeData appBarTheme(BuildContext context) {
    // TODO: implement appBarTheme
    return Theme.of(context).copyWith(
      appBarTheme: AppBarTheme(
        color: Theme.of(context).colorScheme.background,
        shadowColor: Colors.transparent,
        elevation: 0,
        foregroundColor: Theme.of(context).textTheme.bodyMedium!.color,
      ),
    );
  }

  @override
  // TODO: implement searchFieldDecorationTheme
  InputDecorationTheme? get searchFieldDecorationTheme =>
      const InputDecorationTheme(
          border: InputBorder.none,
          focusedBorder: InputBorder.none,
          enabledBorder: InputBorder.none,
          activeIndicatorBorder: BorderSide.none,
          outlineBorder: BorderSide.none);

  @override
  // TODO: implement searchFieldStyle
  TextStyle? get searchFieldStyle => const TextStyle(fontSize: 16);

  @override
  // TODO: implement searchFieldLabel
  String? get searchFieldLabel => 'Search mail, people, attachments...';
  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: const Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      )
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: () {
        close(context, '');
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return Container();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return ListView(children: [
      for (int i = 0; i < 10; i++)
        InkWell(
          onTap: () {
            //  context.push('/view-email', extra: widget.email);
          },
          child: FractionallySizedBox(
            //widthFactor: 0.85,
            alignment: Alignment.centerLeft,
            child: Container(
              decoration: BoxDecoration(
                // borderRadius: widget.index == 0
                //     ? const BorderRadius.only(
                //         topRight: Radius.circular(20.0),
                //       )
                //     : null,
                boxShadow: [
                  BoxShadow(
                    color: Theme.of(context).brightness == Brightness.dark
                        ? Colors.black.withOpacity(0.4)
                        : Colors.grey.withOpacity(0.2),
                    spreadRadius: 1,
                    blurRadius: 1,
                    offset: const Offset(0, 1), // changes position of shadow
                  ),
                ],
                color: Theme.of(context).brightness == Brightness.dark
                    ? Theme.of(context).colorScheme.background
                    : Theme.of(context).cardColor,
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 16.0, vertical: 24.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.max,
                  //  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                      flex: 5,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Flexible(
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Flexible(
                                    flex: 3,
                                    child: Material(
                                      type: MaterialType.transparency,
                                      child: Container(
                                        height: 20,
                                        width: 200,
                                        decoration: BoxDecoration(
                                          color: Colors.grey[200],
                                          borderRadius: const BorderRadius.all(
                                              Radius.circular(12.0)),
                                        ),
                                      ),
                                      // Text('subject',
                                      //     maxLines: 1,
                                      //     overflow: TextOverflow.fade,
                                      //     softWrap: false,
                                      //     style: Theme.of(context)
                                      //         .textTheme
                                      //         .titleMedium
                                      //         ?.copyWith(
                                      //             fontWeight: FontWeight.bold)),
                                    ),
                                  ),
                                  Flexible(
                                      child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 8.0),
                                    child: Icon(
                                      Icons.mark_email_read,
                                      size: 16,
                                      color: Colors.grey[300],
                                    ),
                                  )),
                                ],
                              ),
                            ),
                            Flexible(
                              flex: 1,
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 8.0),
                                child: Wrap(
                                  spacing: 8.0,
                                  crossAxisAlignment: WrapCrossAlignment.center,
                                  children: [
                                    CircleAvatar(
                                      radius: 8,
                                      backgroundColor: Colors.grey[200],
                                    ),
                                    Container(
                                      height: 14,
                                      width: 100,
                                      decoration: BoxDecoration(
                                        color: Colors.grey[200],
                                        borderRadius: const BorderRadius.all(
                                            Radius.circular(12.0)),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              // Row(
                              //   mainAxisAlignment: MainAxisAlignment.start,
                              //   mainAxisSize: MainAxisSize.min,
                              //   children: [
                              //     /// const Text(' ·'),
                              //     Flexible(
                              //       child: Padding(
                              //         padding: const EdgeInsets.only(right: 8.0),
                              //         child: Container(
                              //           height: 14,
                              //           width: 14,
                              //           decoration: BoxDecoration(
                              //             //  color: Colors.grey[400],
                              //             borderRadius:
                              //                 BorderRadius.circular(16.0),
                              //           ),
                              //           child: ClipRRect(
                              //             borderRadius:
                              //                 BorderRadius.circular(6.0),
                              //             child: CachedNetworkImage(
                              //               fit: BoxFit.cover,
                              //               progressIndicatorBuilder: (context,
                              //                   child, loadingProgress) {
                              //                 // if (loadingProgress == null)
                              //                 //   return child;
                              //                 return const BlurHash(
                              //                     hash:
                              //                         'LGH]zY3D}@F10#E2}XE%BB}A0}a0');
                              //               },
                              //               imageUrl:
                              //                   'https://cdn.discordapp.com/attachments/1091203713370173480/1094309288421380146/C._Vergara_the_man_has_the_name_in_black_in_the_middle_of_the_i_9959ed56-1c63-403f-b320-7ebb27c4bc28.png',
                              //             ),
                              //           ),
                              //         ),
                              //       ),
                              //     ),
                              //     Expanded(
                              //       flex: 1,
                              //       child: Material(
                              //         type: MaterialType.transparency,
                              //         child: Text('Name',
                              //             maxLines: 1,
                              //             overflow: TextOverflow.ellipsis,
                              //             style: Theme.of(context)
                              //                 .textTheme
                              //                 .bodySmall),
                              //       ),
                              //     ),
                              //   ],
                              // ),
                            ),
                            Flexible(
                              child: Material(
                                type: MaterialType.transparency,
                                child: Container(
                                  height: 14,
                                  width: 260,
                                  decoration: BoxDecoration(
                                    color: Colors.grey[200],
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(12.0)),
                                  ),
                                  //  Text(
                                  //   'body',
                                  //   maxLines: 1,
                                  //   style: TextStyle(
                                  //     overflow: TextOverflow.ellipsis,
                                  //     // color:
                                  //     //     Color.fromARGB(255, 163, 163, 163),
                                  //   ),
                                  // ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Flexible(
                      fit: FlexFit.tight,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Material(
                              type: MaterialType.transparency,
                              child: Container(
                                height: 14,
                                width: 60,
                                decoration: BoxDecoration(
                                  color: Colors.grey[200],
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(12.0)),
                                ),
                                // Text(
                                //   'Time',
                                //   maxLines: 1,
                                //   style: Theme.of(context).textTheme.bodySmall,
                                // ),
                              )
                              // Text(
                              //   ' Time ago',
                              //   maxLines: 1,
                              //   textAlign: TextAlign.end,
                              //   style: Theme.of(context).textTheme.bodySmall,
                              // ),
                              ),
                          const SizedBox(height: 4.0),
                          Container(
                            width: 40.0,
                            height: 16.0,
                            decoration: BoxDecoration(
                              color: Colors.grey[200],
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            // child: const Icon(Icons.airplanemode_active,
                            //     color: Colors.white, size: 12.0),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        )
    ]);
  }
}

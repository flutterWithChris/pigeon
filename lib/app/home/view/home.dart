import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_blurhash/flutter_blurhash.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:jiffy/jiffy.dart';
import 'package:pigeon/app/home/mock/mock_emails.dart';
import 'package:pigeon/app/home/models/email.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool fabClicked = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawer: const Drawer(),
      body: const MainEmailWidgets(),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          setState(() {
            fabClicked = true;
          });
          await Future.delayed(const Duration(milliseconds: 500), () {
            setState(() {
              fabClicked = false;
            });
          });
        },
        tooltip: 'Increment',
        child: const Icon(
          FontAwesomeIcons.feather,
          color: Color.fromARGB(255, 240, 240, 240),
        ).animate(target: fabClicked ? 1 : 0).shake(
              duration: 400.ms,
              curve: Curves.easeOutSine,
              hz: 2.0,
              offset: const Offset(1.5, 0),
            ),
      ),
    );
  }
}

class MainEmailWidgets extends StatefulWidget {
  const MainEmailWidgets({
    super.key,
  });

  @override
  State<MainEmailWidgets> createState() => _MainEmailWidgetsState();
}

class _MainEmailWidgetsState extends State<MainEmailWidgets> {
  List<Widget> emailWidgets = [];
  bool addClicked = false;
  bool starClicked = false;
  bool businessClicked = false;
  bool travelClicked = false;
  bool newsClicked = false;

  @override
  void initState() {
    emailWidgets = [
      for (int i = 0; i < mockEmails.length; i++)
        EmailWidget(
          index: i,
          email: mockEmails[i],
        )
    ];
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: <Widget>[
        SliverAppBar(
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
          actions: [
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
        ),
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(16.0, 16.0, 8.0, 8.0),
            child: Wrap(
              crossAxisAlignment: WrapCrossAlignment.center,
              spacing: 16.0,
              children: [
                SizedBox(
                  height: 40,
                  width: 40,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(100),
                    child: CachedNetworkImage(
                      fit: BoxFit.cover,
                      progressIndicatorBuilder:
                          (context, child, loadingProgress) {
                        // if (loadingProgress == null)
                        //   return child;
                        return const BlurHash(
                            hash: 'LGH]zY3D}@F10#E2}XE%BB}A0}a0');
                      },
                      imageUrl:
                          'https://cdn.discordapp.com/attachments/1091203713370173480/1094309288421380146/C._Vergara_the_man_has_the_name_in_black_in_the_middle_of_the_i_9959ed56-1c63-403f-b320-7ebb27c4bc28.png',
                    ),
                  ),
                ),
                Text(
                  'San Arlaan',
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium!
                      .copyWith(fontWeight: FontWeight.bold),
                )
              ],
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: FractionallySizedBox(
            alignment: Alignment.centerLeft,
            //  widthFactor: 0.85,
            child: Padding(
              padding: const EdgeInsets.only(left: 0, top: 8.0, bottom: 0.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 5,
                    child: Stack(
                      clipBehavior: Clip.none,
                      alignment: AlignmentDirectional.bottomCenter,
                      children: [
                        AspectRatio(
                          aspectRatio: 16 / 9,
                          child: Container(
                            decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.45),
                                  spreadRadius: 4,
                                  blurRadius: 12,
                                  offset: const Offset(1, 4),
                                ),
                              ],
                              color: Colors.grey[400],
                              borderRadius: const BorderRadius.only(
                                topRight: Radius.circular(20.0),
                                bottomRight: Radius.circular(20.0),
                              ),
                              // image: const DecorationImage(
                              //     image: CachedNetworkImageProvider(
                              //         'https://cdn.discordapp.com/attachments/1091203713370173480/1094309257412882482/C._Vergara_the_man_has_the_name_in_black_in_the_middle_of_the_i_b67bffa3-bf27-49c7-b5ff-b2b4ad0afdf3.png'),
                              //     fit: BoxFit.cover),
                            ),
                            child: ClipRRect(
                              borderRadius: const BorderRadius.only(
                                topRight: Radius.circular(20.0),
                                bottomRight: Radius.circular(20.0),
                              ),
                              child: CachedNetworkImage(
                                imageUrl:
                                    'https://cdn.discordapp.com/attachments/1091203713370173480/1094309257412882482/C._Vergara_the_man_has_the_name_in_black_in_the_middle_of_the_i_b67bffa3-bf27-49c7-b5ff-b2b4ad0afdf3.png',
                                progressIndicatorBuilder:
                                    (context, child, loadingProgress) {
                                  // if (loadingProgress == null) return child;
                                  return const BlurHash(
                                      hash: 'LHHS}\$0o}8V=-Q0#xF-pxVE3oLx[');
                                },
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ).animate().slideX(
                              begin: -1.0,
                              duration: const Duration(milliseconds: 400),
                              curve: Curves.easeOutSine,
                            ),
                        Positioned(
                          width: MediaQuery.of(context).size.width * 0.85,
                          bottom: -80,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 0.0),
                            child: Container(
                                    decoration: BoxDecoration(
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.black.withOpacity(0.45),
                                          spreadRadius: 4,
                                          blurRadius: 12,
                                          offset: const Offset(1, 4),
                                        ),
                                      ],
                                      color: Theme.of(context).cardColor,
                                      borderRadius: const BorderRadius.only(
                                        topRight: Radius.circular(20.0),
                                        bottomRight: Radius.circular(20.0),
                                      ),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(12.0),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Wrap(
                                                spacing: 16.0,
                                                alignment: WrapAlignment.start,
                                                crossAxisAlignment:
                                                    WrapCrossAlignment.center,
                                                runAlignment:
                                                    WrapAlignment.start,
                                                children: [
                                                  SizedBox(
                                                    height: 30,
                                                    width: 30,
                                                    child: ClipRRect(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              50),
                                                      child: CachedNetworkImage(
                                                        fit: BoxFit.cover,
                                                        progressIndicatorBuilder:
                                                            (context, child,
                                                                loadingProgress) {
                                                          // if (loadingProgress == null)
                                                          //   return child;
                                                          return const BlurHash(
                                                              hash:
                                                                  'LGH]zY3D}@F10#E2}XE%BB}A0}a0');
                                                        },
                                                        imageUrl:
                                                            'https://cdn.discordapp.com/attachments/1091203713370173480/1094309288421380146/C._Vergara_the_man_has_the_name_in_black_in_the_middle_of_the_i_9959ed56-1c63-403f-b320-7ebb27c4bc28.png',
                                                      ),
                                                    ),
                                                  ),
                                                  const Text('Arolerleis'),
                                                  Icon(
                                                    Icons.star,
                                                    color: Colors.yellow[700],
                                                    size: 16,
                                                  )
                                                ],
                                              ),
                                              FilledButton(
                                                onPressed: () {},
                                                child: const Icon(Icons.add),
                                              )
                                            ],
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 12.0,
                                                vertical: 4.0),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Wrap(
                                                  spacing: 8.0,
                                                  crossAxisAlignment:
                                                      WrapCrossAlignment.center,
                                                  children: [
                                                    Icon(
                                                      Icons.email_rounded,
                                                      size: 14,
                                                      color: Colors.grey[400],
                                                    ),
                                                    Text(
                                                      '6',
                                                      style: TextStyle(
                                                          color:
                                                              Colors.grey[400]),
                                                    )
                                                  ],
                                                ),
                                                Wrap(
                                                  spacing: 8.0,
                                                  crossAxisAlignment:
                                                      WrapCrossAlignment.center,
                                                  children: [
                                                    Icon(
                                                      Icons.email_rounded,
                                                      size: 14,
                                                      color: Colors.grey[400],
                                                    ),
                                                    Text(
                                                      '6',
                                                      style: TextStyle(
                                                          color:
                                                              Colors.grey[400]),
                                                    )
                                                  ],
                                                ),
                                                Wrap(
                                                  spacing: 8.0,
                                                  crossAxisAlignment:
                                                      WrapCrossAlignment.center,
                                                  children: [
                                                    Icon(
                                                      Icons.email_rounded,
                                                      size: 14,
                                                      color: Colors.grey[400],
                                                    ),
                                                    Text(
                                                      '6',
                                                      style: TextStyle(
                                                          color:
                                                              Colors.grey[400]),
                                                    )
                                                  ],
                                                ),
                                              ],
                                            ),
                                          )
                                        ],
                                      ),
                                    )).animate().slideX(
                                  delay: 200.ms,
                                  begin: -1.0,
                                  duration: const Duration(milliseconds: 400),
                                  curve: Curves.easeOutSine,
                                ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Flexible(
                    fit: FlexFit.tight,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 12.0, right: 12.0),
                      child: Wrap(
                          spacing: 16.0,
                          direction: Axis.vertical,
                          children: [
                            IconButton(
                                    onPressed: () {
                                      setState(() {
                                        starClicked = true;
                                      });
                                      Future.delayed(
                                          const Duration(milliseconds: 600),
                                          () {
                                        setState(() {
                                          starClicked = false;
                                        });
                                      });
                                    },
                                    icon: const Icon(Icons.star)
                                        .animate(
                                          // onPlay: (controller) =>
                                          //     controller.repeat(reverse: true),
                                          target: starClicked ? 0 : 1,
                                        )
                                        // .slideY(
                                        //     begin: -1.0,
                                        //     duration: const Duration(
                                        //         milliseconds: 400),
                                        //     curve: Curves.easeOutSine)
                                        .rotate()
                                        .tint(
                                            color: const Color.fromARGB(
                                                255, 241, 220, 31),
                                            begin: 1.0,
                                            end: 0.0,
                                            duration: const Duration(
                                                milliseconds: 400),
                                            curve: Curves.easeOutSine)
                                        .moveY(
                                            begin: -20.0,
                                            end: 0,
                                            duration: const Duration(
                                                milliseconds: 400),
                                            curve: Curves.bounceOut))
                                .animate()
                                .fadeIn(
                                  duration: const Duration(milliseconds: 400),
                                  curve: Curves.easeOutSine,
                                )
                                .slideX(
                                    begin: 1.0,
                                    duration: const Duration(milliseconds: 400),
                                    curve: Curves.easeOutBack),
                            Wrap(
                              spacing: 16.0,
                              direction: Axis.vertical,
                              children: [
                                IconButton(
                                  onPressed: () {
                                    setState(() {
                                      businessClicked = true;
                                    });
                                    Future.delayed(
                                        const Duration(milliseconds: 600), () {
                                      setState(() {
                                        businessClicked = false;
                                      });
                                    });
                                  },
                                  icon: const Icon(Icons.business)
                                      .animate(
                                        // onPlay: (controller) =>
                                        //     controller.repeat(reverse: true),
                                        target: businessClicked ? 0 : 1,
                                      )
                                      .scale(
                                        begin: const Offset(1.2, 1.2),
                                        end: const Offset(1.0, 1.0),
                                        duration:
                                            const Duration(milliseconds: 300),
                                        curve: Curves.easeOutBack,
                                      ),
                                ),
                                IconButton(
                                  onPressed: () {
                                    setState(() {
                                      travelClicked = true;
                                    });
                                    Future.delayed(
                                        const Duration(milliseconds: 600), () {
                                      setState(() {
                                        travelClicked = false;
                                      });
                                    });
                                  },
                                  icon: const Icon(FontAwesomeIcons.plane,
                                          size: 20)
                                      .animate(
                                        // onPlay: (controller) =>
                                        //     controller.repeat(reverse: true),
                                        target: travelClicked ? 1 : 0,
                                      )
                                      .slideX(
                                        begin: -0.5,
                                        end: -0.9,
                                        duration:
                                            const Duration(milliseconds: 400),
                                        curve: Curves.easeOutBack,
                                      )
                                      .slideX(
                                        delay: 400.ms,
                                        begin: 0.5,
                                        end: 5.0,
                                        duration:
                                            const Duration(milliseconds: 400),
                                        curve: Curves.easeOutBack,
                                      ),
                                ),
                                IconButton(
                                  onPressed: () async {
                                    setState(() {
                                      newsClicked = true;
                                    });
                                    await Future.delayed(
                                        const Duration(milliseconds: 600), () {
                                      setState(() {
                                        newsClicked = false;
                                      });
                                    });
                                  },
                                  icon: const Icon(Icons.newspaper_outlined)
                                      .animate(
                                        target: newsClicked ? null : 1,
                                      )
                                      .shimmer(
                                        color: Colors.blue[300],
                                        duration:
                                            const Duration(milliseconds: 600),
                                        curve: Curves.easeOutSine,
                                      ),
                                ),
                                IconButton(
                                  onPressed: () async {
                                    setState(() {
                                      addClicked = true;
                                    });
                                    await Future.delayed(
                                        const Duration(milliseconds: 400), () {
                                      setState(() {
                                        addClicked = false;
                                      });
                                    });
                                  },
                                  icon: const Icon(Icons.add_rounded)
                                      .animate(target: addClicked ? 1 : 0)
                                      .rotate(),
                                )
                              ]
                                  .animate(interval: 250.ms)
                                  .fadeIn(delay: 400.ms)
                                  .slideY(
                                      delay: 400.ms,
                                      begin: -1.2,
                                      duration:
                                          const Duration(milliseconds: 300),
                                      curve: Curves.easeOutSine),
                            ),
                          ]),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Wrap(
              spacing: 8.0,
              crossAxisAlignment: WrapCrossAlignment.center,
              children: [
                const Icon(Icons.email_rounded, color: Colors.grey, size: 14),
                Text(
                  'All Mail',
                  style: TextStyle(color: Colors.grey[200]),
                )
              ]
                  .animate(interval: 250.ms)
                  .fadeIn(
                    delay: 500.ms,
                    duration: const Duration(milliseconds: 400),
                    curve: Curves.easeOutSine,
                  )
                  .slideX(
                      begin: -1.0,
                      duration: const Duration(milliseconds: 400),
                      curve: Curves.easeOutSine),
            ),
          ),
        ),
        SliverList(
            delegate: SliverChildListDelegate(
          emailWidgets.animate(interval: 150.ms).slideY(
                begin: 1.0,
                duration: const Duration(milliseconds: 400),
                curve: Curves.easeOutSine,
              ),
        )),
      ],
    );
  }
}

class EmailWidget extends StatelessWidget {
  final Email email;
  const EmailWidget({
    super.key,
    required this.email,
    required this.index,
  });

  final int index;

  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      widthFactor: 0.85,
      alignment: Alignment.centerLeft,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: index == 0
              ? const BorderRadius.only(
                  topRight: Radius.circular(20.0),
                )
              : null,
          color: Colors.white,
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisSize: MainAxisSize.max,
                //  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                    flex: 4,
                    child: Row(
                      children: [
                        Flexible(
                          child: Container(
                            height: 50,
                            width: 50,
                            constraints: const BoxConstraints(
                              maxWidth: 50,
                              maxHeight: 50,
                            ),
                            decoration: BoxDecoration(
                              color: Colors.grey[400],
                              borderRadius: BorderRadius.circular(16.0),
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(12.0),
                              child: CachedNetworkImage(
                                fit: BoxFit.cover,
                                progressIndicatorBuilder:
                                    (context, child, loadingProgress) {
                                  // if (loadingProgress == null)
                                  //   return child;
                                  return const BlurHash(
                                      hash: 'LGH]zY3D}@F10#E2}XE%BB}A0}a0');
                                },
                                imageUrl:
                                    'https://cdn.discordapp.com/attachments/1091203713370173480/1094309288421380146/C._Vergara_the_man_has_the_name_in_black_in_the_middle_of_the_i_9959ed56-1c63-403f-b320-7ebb27c4bc28.png',
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 5,
                          child: Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 16.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  email.subject!,
                                  style: const TextStyle(
                                    color: Color.fromARGB(255, 61, 61, 61),
                                    fontWeight: FontWeight.bold,
                                  ),
                                  maxLines: 1,
                                ),
                                Text(email.body!,
                                    maxLines: 1,
                                    style: const TextStyle(
                                        overflow: TextOverflow.ellipsis,
                                        color: Color.fromARGB(
                                            255, 163, 163, 163))),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Flexible(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          Jiffy.parseFromDateTime(email.date!).fromNow(),
                          textAlign: TextAlign.end,
                          style: const TextStyle(
                            fontSize: 12.0,
                            color: Color(0xFF333333),
                          ),
                        ),
                        const SizedBox(height: 4.0),
                        Container(
                          width: 40.0,
                          height: 16.0,
                          decoration: BoxDecoration(
                            color: const Color(0xFFED9C18),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          child: const Icon(Icons.airplanemode_active,
                              color: Colors.white, size: 12.0),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Divider(
                color: Colors.grey[300],
                thickness: 1.0,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

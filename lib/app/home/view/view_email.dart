import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_blurhash/flutter_blurhash.dart';
import 'package:jiffy/jiffy.dart';
import 'package:pigeon/app/home/models/email.dart';
import 'package:pigeon/core/presentation/widgets/main_app_bar.dart';

class ViewEmailPage extends StatelessWidget {
  final Email email;
  const ViewEmailPage({super.key, required this.email});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        // padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        //controller: scrollController,

        slivers: [
          MainAppBar(
            // title: email.subject!,
            actions: [
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.more_vert),
              ),
            ],
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Hero(
                        transitionOnUserGestures: true,
                        tag: 'subject-${email.id}',
                        child: Text(
                          email.subject!,
                          style: Theme.of(context).textTheme.titleLarge,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 4),
                        child: Wrap(
                          crossAxisAlignment: WrapCrossAlignment.center,
                          spacing: 8,
                          children: [
                            SizedBox(
                              height: 24,
                              width: 24,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(8.0),
                                child: Hero(
                                  transitionOnUserGestures: true,
                                  tag: 'senderEmail-${email.id}',
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
                            Hero(
                                transitionOnUserGestures: true,
                                tag: 'senderName-${email.id}',
                                child: Text('${email.senderName!} ·')),
                            Text(email.senderEmail!),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const Spacer(),
                  Hero(
                    transitionOnUserGestures: true,
                    tag: 'date-${email.id}',
                    child: Text(
                      Jiffy.parseFromDateTime(email.date!).fromNow(),
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SliverToBoxAdapter(child: Divider()),
          SliverToBoxAdapter(
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
              child: Hero(tag: 'body-${email.id}', child: Text(email.body!)),
            ),
          ),
        ],
      ),
    );
  }
}

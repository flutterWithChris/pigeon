import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_blurhash/flutter_blurhash.dart';
import 'package:go_router/go_router.dart';
import 'package:jiffy/jiffy.dart';

import '../../models/email.dart';

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
    return InkWell(
      onTap: () {
        context.push('/view-email', extra: email);
      },
      child: FractionallySizedBox(
        //widthFactor: 0.85,
        alignment: Alignment.centerLeft,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: index == 0
                ? const BorderRadius.only(
                    topRight: Radius.circular(20.0),
                  )
                : null,
            color: Theme.of(context).colorScheme.background,
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
                          //
                          Expanded(
                            flex: 6,
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 16.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Row(
                                    children: [
                                      Hero(
                                        transitionOnUserGestures: true,
                                        tag: 'subject-${email.id}',
                                        child: Text('${email.subject!}  ·',
                                            style: const TextStyle(
                                              // color: Color.fromARGB(255, 61, 61, 61),
                                              fontWeight: FontWeight.bold,
                                            )),
                                      ),
                                      Flexible(
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 8.0),
                                          child: Container(
                                            height: 18,
                                            width: 18,
                                            constraints: const BoxConstraints(
                                              maxWidth: 50,
                                              maxHeight: 50,
                                            ),
                                            decoration: BoxDecoration(
                                              //  color: Colors.grey[400],
                                              borderRadius:
                                                  BorderRadius.circular(16.0),
                                            ),
                                            child: ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(6.0),
                                              child: Hero(
                                                tag: 'senderEmail-${email.id}',
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
                                          ),
                                        ),
                                      ),
                                      Hero(
                                        transitionOnUserGestures: true,
                                        tag: 'senderName-${email.id}',
                                        child: Text(
                                          email.senderName!,
                                          style: const TextStyle(
                                            overflow: TextOverflow.fade,
                                            // color: Color.fromARGB(255, 61, 61, 61),
                                            fontWeight: FontWeight.normal,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Hero(
                                    transitionOnUserGestures: true,
                                    tag: 'body-${email.id}',
                                    child: Text(
                                      email.body!,
                                      maxLines: 1,
                                      style: const TextStyle(
                                        overflow: TextOverflow.ellipsis,
                                        // color:
                                        //     Color.fromARGB(255, 163, 163, 163),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Hero(
                            transitionOnUserGestures: true,
                            tag: 'date-${email.id}',
                            child: Text(
                              Jiffy.parseFromDateTime(email.date!).fromNow(),
                              textAlign: TextAlign.end,
                              style: const TextStyle(
                                fontSize: 12.0,
                                // color: Color(0xFF333333),
                              ),
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
                // Divider(
                //   color: Colors.grey[300],
                //   thickness: 1.0,
                // ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

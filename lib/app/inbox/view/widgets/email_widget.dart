import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_blurhash/flutter_blurhash.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:jiffy/jiffy.dart';
import 'package:pigeon/app/view_email/mock/mock_emails.dart';
import 'package:pigeon/core/models/email.dart';

class EmailWidget extends StatefulWidget {
  final Email email;
  const EmailWidget({
    super.key,
    required this.email,
    required this.index,
  });

  final int index;

  @override
  State<EmailWidget> createState() => _EmailWidgetState();
}

class _EmailWidgetState extends State<EmailWidget> {
  bool alive = true;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        context.push('/view-email', extra: widget.email);
      },
      child: Slidable(
        key: ValueKey(widget.email.id),
        startActionPane: ActionPane(
          openThreshold: 0.1,
          dismissible: DismissiblePane(onDismissed: () {
            setState(() {
              alive = false;
              mockEmails.remove(widget.email);
            });
          }),
          motion: const ScrollMotion(),
          children: [
            SlidableAction(
              padding: EdgeInsets.zero,
              spacing: 2,
              backgroundColor: Colors.red[500]!,
              // caption: 'Delete',
              // color: Colors.red,
              icon: Icons.delete,
              onPressed: (context) {},
            ),
          ],
        ),
        endActionPane: ActionPane(
          motion: const BehindMotion(),
          children: [
            SlidableAction(
              backgroundColor: Theme.of(context).scaffoldBackgroundColor,
              borderRadius: const BorderRadius.only(
                topRight: Radius.circular(20.0),
                //  bottomRight: Radius.circular(20.0),
              ),
              // caption: 'Delete',
              // color: Colors.red,
              icon: Icons.snooze_rounded,
              onPressed: (context) {},
            ),
          ],
        ),
        child: FractionallySizedBox(
          //widthFactor: 0.85,
          alignment: Alignment.centerLeft,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: widget.index == 0
                  ? const BorderRadius.only(
                      topRight: Radius.circular(20.0),
                    )
                  : null,
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
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                //  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Flexible(
                    flex: 5,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Flexible(
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Flexible(
                                  flex: 3,
                                  child: Hero(
                                    flightShuttleBuilder: (flightContext,
                                        animation,
                                        flightDirection,
                                        fromHeroContext,
                                        toHeroContext) {
                                      return DefaultTextStyle(
                                          style:
                                              DefaultTextStyle.of(toHeroContext)
                                                  .style,
                                          child: toHeroContext.widget);
                                    },
                                    transitionOnUserGestures: true,
                                    tag: 'subject-${widget.email.id}',
                                    child: Material(
                                      type: MaterialType.transparency,
                                      child: Text(widget.email.subject ?? '',
                                          maxLines: 1,
                                          overflow: TextOverflow.fade,
                                          softWrap: false,
                                          style: Theme.of(context)
                                              .textTheme
                                              .titleMedium
                                              ?.copyWith(
                                                  fontWeight:
                                                      widget.email.status ==
                                                              EmailStatus.unread
                                                          ? FontWeight.bold
                                                          : null)),
                                    ),
                                  ),
                                ),
                                Flexible(
                                    child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 8.0),
                                  child: Icon(
                                    widget.email.status == EmailStatus.read
                                        ? FontAwesomeIcons.checkDouble
                                        : FontAwesomeIcons.check,
                                    size: 12,
                                    color:
                                        widget.email.status == EmailStatus.read
                                            ? Colors.blue
                                            : Colors.grey[600],
                                  ),
                                )),
                              ],
                            ),
                          ),
                          Flexible(
                            flex: 1,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                /// const Text(' ·'),
                                Flexible(
                                  child: Padding(
                                    padding: const EdgeInsets.only(right: 8.0),
                                    child: Container(
                                      height: 14,
                                      width: 14,
                                      decoration: BoxDecoration(
                                        //  color: Colors.grey[400],
                                        borderRadius:
                                            BorderRadius.circular(16.0),
                                      ),
                                      child: ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(6.0),
                                        child: Hero(
                                          tag: 'senderEmail-${widget.email.id}',
                                          child: CachedNetworkImage(
                                            fit: BoxFit.cover,
                                            progressIndicatorBuilder: (context,
                                                child, loadingProgress) {
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
                                Expanded(
                                  flex: 1,
                                  child: Hero(
                                    transitionOnUserGestures: true,
                                    tag: 'senderName-${widget.email.id}',
                                    child: Material(
                                      type: MaterialType.transparency,
                                      child: Text(widget.email.senderName!,
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodySmall),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Flexible(
                            child: Hero(
                              transitionOnUserGestures: true,
                              tag: 'body-${widget.email.id}',
                              child: Material(
                                type: MaterialType.transparency,
                                child: Text(
                                  widget.email.body!,
                                  maxLines: 1,
                                  style: const TextStyle(
                                    overflow: TextOverflow.ellipsis,
                                    // color:
                                    //     Color.fromARGB(255, 163, 163, 163),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  widget.email.date != null
                      ? Flexible(
                          fit: FlexFit.tight,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Hero(
                                transitionOnUserGestures: true,
                                tag: 'date-${widget.email.id}',
                                child: Material(
                                  type: MaterialType.transparency,
                                  child: Text(
                                    Jiffy.parseFromDateTime(widget.email.date!)
                                        .fromNow(),
                                    maxLines: 1,
                                    textAlign: TextAlign.end,
                                    style:
                                        Theme.of(context).textTheme.bodySmall,
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
                        )
                      : const SizedBox.shrink(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

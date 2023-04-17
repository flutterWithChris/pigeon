import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_blurhash/flutter_blurhash.dart';
import 'package:pigeon/core/models/email.dart';
import 'package:pigeon/core/presentation/widgets/main_app_bar.dart';
import 'package:pigeon/reply/bloc/reply_bloc.dart';

class ViewEmailPage extends StatelessWidget {
  final Email email;
  const ViewEmailPage({super.key, required this.email});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            context.read<ReplyBloc>().state is ReplyStarted
                ? context.read<ReplyBloc>().add(CancelReply())
                : context.read<ReplyBloc>().add(ReplyToEmail(email: email));
          },
          child: const Icon(
            Icons.reply,
            color: Color.fromARGB(255, 240, 240, 240),
          )),
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
                icon: const Icon(
                  Icons.reply_all_rounded,
                ),
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.forward),
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.more_vert,
                ),
              ),
            ],
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Flexible(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        BlocBuilder<ReplyBloc, ReplyState>(
                          builder: (context, state) {
                            print('State: $state');
                            if (state is ReplyStarted) {
                              final TextEditingController subjectController =
                                  TextEditingController(
                                      text: 'Re: ${state.email.subject}');
                              return Flexible(
                                flex: 4,
                                child: Hero(
                                  transitionOnUserGestures: true,
                                  tag: 'subject-${email.id}',
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
                                  child: Material(
                                      type: MaterialType.transparency,
                                      child: TextField(
                                        controller: subjectController,
                                        decoration: InputDecoration(
                                            contentPadding: EdgeInsets.zero,
                                            isDense: true,
                                            border: InputBorder.none,
                                            hintText: 'Subject',
                                            hintStyle: Theme.of(context)
                                                .textTheme
                                                .titleMedium),
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleMedium,
                                      )
                                          .animate()
                                          .scaleXY(
                                            duration: 200.ms,
                                            begin: 1.2,
                                            end: 1.2,
                                          )
                                          .slideX(begin: 0.1, end: 0.1)),
                                ),
                              );
                            }
                            if (state is ReplyInitial) {
                              return Hero(
                                transitionOnUserGestures: true,
                                tag: 'subject-${email.id}',
                                flightShuttleBuilder: (flightContext,
                                    animation,
                                    flightDirection,
                                    fromHeroContext,
                                    toHeroContext) {
                                  return DefaultTextStyle(
                                      style: DefaultTextStyle.of(toHeroContext)
                                          .style,
                                      child: toHeroContext.widget);
                                },
                                child: Material(
                                    type: MaterialType.transparency,
                                    child: Text(
                                      email.subject!,
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleMedium,
                                    )
                                        .animate()
                                        .scaleXY(
                                          duration: 200.ms,
                                          begin: 1.2,
                                          end: 1.2,
                                        )
                                        .slideX(begin: 0.1, end: 0.1)),
                              );
                            } else {
                              return const SizedBox(
                                child: Center(
                                  child: Text('Something Went Wrong...'),
                                ),
                              );
                            }
                          },
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 4),
                          child: BlocBuilder<ReplyBloc, ReplyState>(
                            builder: (context, state) {
                              if (state is ReplyStarted) {
                                return Wrap(
                                  crossAxisAlignment: WrapCrossAlignment.center,
                                  spacing: 8,
                                  children: [
                                    BlocBuilder<ReplyBloc, ReplyState>(
                                      builder: (context, state) {
                                        if (state is ReplyStarted) {
                                          return const Text('To: ')
                                              .animate()
                                              .slideX(
                                                  curve: Curves.easeOutSine,
                                                  duration: 200.ms);
                                        }
                                        if (state is ReplyInitial) {}
                                        return Container();
                                      },
                                    ),
                                    SizedBox(
                                      height: 24,
                                      width: 24,
                                      child: ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                        child: Hero(
                                          transitionOnUserGestures: true,
                                          tag: 'senderEmail-${email.id}',
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
                                    Hero(
                                        transitionOnUserGestures: true,
                                        tag: 'senderName-${email.id}',
                                        child: Material(
                                            type: MaterialType.transparency,
                                            child: Text(
                                                '${email.senderName!}  ·'))),
                                    Text(email.senderEmail!)
                                    // .animate()
                                    // .fadeIn(
                                    //     curve: Curves.easeOutSine,
                                    //     duration: 400.ms)
                                    // .slideX(
                                    //     curve: Curves.easeOutSine,
                                    //     duration: 400.ms),
                                  ].animate().slideX(),
                                );
                              }
                              if (state is ReplyInitial) {
                                return Wrap(
                                  crossAxisAlignment: WrapCrossAlignment.center,
                                  spacing: 8,
                                  children: [
                                    // BlocBuilder<ReplyBloc, ReplyState>(
                                    //   builder: (context, state) {
                                    //     if (state is ReplyStarted) {
                                    //       return const Text('To: ')
                                    //           .animate()
                                    //           .slideX(
                                    //               curve: Curves.easeOutSine,
                                    //               duration: 400.ms);
                                    //     }
                                    //     if (state is ReplyInitial) {}
                                    //     return Container();
                                    //   },
                                    // ),
                                    SizedBox(
                                      height: 24,
                                      width: 24,
                                      child: ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                        child: Hero(
                                          transitionOnUserGestures: true,
                                          tag: 'senderEmail-${email.id}',
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
                                    Hero(
                                        transitionOnUserGestures: true,
                                        tag: 'senderName-${email.id}',
                                        child: Material(
                                            type: MaterialType.transparency,
                                            child: Text(
                                                '${email.senderName!}  ·'))),
                                    Text(email.senderEmail!)
                                        .animate()
                                        .fadeIn(
                                            curve: Curves.easeOutSine,
                                            duration: 400.ms)
                                        .slideX(
                                            curve: Curves.easeOutSine,
                                            duration: 400.ms),
                                  ],
                                );
                              } else {
                                return const Center(
                                  child: Text('Something Went Wrong...'),
                                );
                              }
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                  //   const Spacer(),
                  // Hero(
                  //   transitionOnUserGestures: true,
                  //   tag: 'date-${email.id}',
                  //   child: Material(
                  //     type: MaterialType.transparency,
                  //     child: Text(
                  //       Jiffy.parseFromDateTime(email.date!).fromNow(),
                  //       style: Theme.of(context).textTheme.bodySmall,
                  //     ),
                  //   ),
                  // ),
                ],
              ),
            ),
          ),
          const SliverToBoxAdapter(child: Divider()),
          BlocBuilder<ReplyBloc, ReplyState>(
            builder: (context, state) {
              if (state is ReplyFailed) {}
              if (state is ReplyCancelled) {}
              if (state is ReplyInitial) {
                return SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 8.0, horizontal: 16.0),
                    child: Hero(
                        tag: 'body-${email.id}',
                        child: Material(
                            type: MaterialType.transparency,
                            child: Text(email.body!))),
                  ),
                );
              }
              if (state is ReplyStarted) {
                return SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 8.0, horizontal: 16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextField(
                          autofocus: true,
                          maxLines: 10,
                          minLines: 1,
                          style: Theme.of(context).textTheme.bodyMedium,
                          textCapitalization: TextCapitalization.sentences,
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Divider(),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8.0),
                          child: Row(
                            children: [
                              Row(
                                children: [
                                  Text(
                                    'Replying to: ',
                                    style:
                                        Theme.of(context).textTheme.bodySmall,
                                  ),
                                  Text(
                                    email.subject!,
                                    style:
                                        Theme.of(context).textTheme.titleSmall,
                                  )
                                ],
                              ).animate().fadeIn(),
                              Row(
                                children: [
                                  const Padding(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 8.0),
                                    child: Text('·'),
                                  ),
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
                                  )
                                      .animate()
                                      .scale(
                                          duration: 200.ms,
                                          curve: Curves.easeInOutBack)
                                      .slideX(
                                          begin: 2.0,
                                          duration: 400.ms,
                                          curve: Curves.easeInOutBack),
                                ],
                              ),
                            ].animate().slideX(duration: 200.ms),
                          ),
                        ),
                        Hero(
                                tag: 'body-${email.id}',
                                child: Material(
                                    type: MaterialType.transparency,
                                    child: Text(email.body!)))
                            .animate()
                            .slideY(
                                begin: -3.0,
                                curve: Curves.easeOutSine,
                                duration: 300.ms),
                      ],
                    ),
                  ),
                );
              }
              if (state is ReplySent) {}
              return const Center(
                child: Text('Something Went Wrong...'),
              );
            },
          ),
        ],
      ),
    );
  }
}

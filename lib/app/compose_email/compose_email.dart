import 'package:flutter/material.dart';
import 'package:pigeon/core/presentation/widgets/main_app_bar.dart';

class ComposeEmail extends StatelessWidget {
  const ComposeEmail({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      floatingActionButton: FloatingActionButton(
          onPressed: () {}, child: const Icon(Icons.send, color: Colors.white)),
      body: CustomScrollView(
        slivers: [
          MainAppBar(
            actions: [
              IconButton(onPressed: () {}, icon: const Icon(Icons.attach_file)),
              IconButton(
                icon: const Icon(Icons.schedule_rounded),
                onPressed: () {},
              ),
              Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: IconButton(
                  icon: const Icon(Icons.more_vert_rounded),
                  onPressed: () {},
                ),
              ),
            ],
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              child: Wrap(
                spacing: 8.0,
                children: const [
                  Text('From: '),
                  Text('christian.vergara531@gmail.com')
                ],
              ),
            ),
          ),
          const SliverToBoxAdapter(
            child: Divider(),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 0.0),
              child: Row(
                children: [
                  const Text('To: '),
                  Flexible(
                      child: Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: TextField(
                      style: Theme.of(context).textTheme.bodyMedium,
                      decoration: const InputDecoration(
                        isDense: true,
                        fillColor: Color.fromARGB(255, 247, 247, 247),
                        // filled: true,
                        // enabledBorder: OutlineInputBorder(
                        //   borderSide: BorderSide(color: Color(0xFFEFEFEF)),
                        //   borderRadius: BorderRadius.all(Radius.circular(20)),
                        // ),
                        border: InputBorder.none,
                        // hintText: 'Enter email address',
                      ),
                    ),
                  )),
                ],
              ),
            ),
          ),
          const SliverToBoxAdapter(
            child: Divider(),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 0.0),
              child: Row(
                children: [
                  Flexible(
                      child: TextField(
                    style: Theme.of(context).textTheme.bodyMedium,
                    textCapitalization: TextCapitalization.sentences,
                    decoration: const InputDecoration(
                      isDense: true,
                      fillColor: Color.fromARGB(255, 247, 247, 247),
                      // enabledBorder: OutlineInputBorder(
                      //   borderSide: BorderSide(color: Color(0xFFEFEFEF)),
                      //   borderRadius: BorderRadius.all(Radius.circular(20)),
                      // ),
                      border: InputBorder.none,
                      hintText: 'Subject',
                    ),
                  )),
                ],
              ),
            ),
          ),
          const SliverToBoxAdapter(
            child: Divider(),
          ),
          SliverFillRemaining(
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              child: TextField(
                style: Theme.of(context).textTheme.bodyMedium,
                maxLines: null,
                textCapitalization: TextCapitalization.sentences,
                decoration: const InputDecoration(
                  isDense: true,
                  fillColor: Color.fromARGB(255, 247, 247, 247),
                  // enabledBorder: OutlineInputBorder(
                  //   borderSide: BorderSide(color: Color(0xFFEFEFEF)),
                  //   borderRadius: BorderRadius.all(Radius.circular(20)),
                  // ),
                  border: InputBorder.none,
                  hintText: 'Compose email',
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

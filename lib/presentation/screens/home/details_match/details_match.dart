import 'package:flutter/material.dart';
import 'package:soccer_app/models/fixlineups/fixture.dart';
import 'package:soccer_app/presentation/widgets/details_match_widgets/custom_app_bar_widget.dart';

class DetailsMatchScreen extends StatefulWidget {
  final Teams team;
  final Fixture fixture;
  const DetailsMatchScreen(
      {super.key, required this.team, required this.fixture});

  @override
  State<DetailsMatchScreen> createState() => _DetailsMatchScreenState();
}

class _DetailsMatchScreenState extends State<DetailsMatchScreen> with SingleTickerProviderStateMixin {

  late TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 2, vsync: this);
  }
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 38, 37, 37),
      body: Column(
        children: [
          CustomAppBar(size: size, team: widget.team, fixture: widget.fixture),
          TabBar(
            controller: tabController,
            tabs: [
              Tab(
                text: 'Lineups',
              ),
              Tab(text: 'Statistics',)
            ],
          ),
          SizedBox(
            height: 200,
            width: 300,
            child: TabBarView(
              controller: tabController,
              children: [
              Text('data1', style: TextStyle(color: Colors.white),),
              Text('data2', style: TextStyle(color: Colors.white),)
            ]),
          )
        ],
      ),
    );
  }
}

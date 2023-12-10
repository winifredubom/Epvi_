
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'dart:ui';
import 'package:flutter/material.dart';
import '../../widget/ExFAB.dart';
import '../../widget/FAB.dart';
import '../../widget/sales_banner.dart';

class TravelAppTransitionConceptPage extends StatefulWidget {
  const TravelAppTransitionConceptPage({Key? key}) : super(key: key);

  @override
  State<TravelAppTransitionConceptPage> createState() => _TravelAppTransitionConceptPageState();
}

class _TravelAppTransitionConceptPageState extends State<TravelAppTransitionConceptPage> {
  ScrollController _scrollController = ScrollController();
  final videoUrl = "https://www.youtube.com/watch?v=WovqzMoA5bA";
  late YoutubePlayerController _youtubePlayerController;
  bool isFAB = false;

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    final videoID = YoutubePlayer.convertUrlToId(videoUrl);
    _youtubePlayerController = YoutubePlayerController(initialVideoId: videoID!,
        flags: const YoutubePlayerFlags(
            autoPlay: false
        ));
    _scrollController.addListener(() {
      if(_scrollController.offset>50)
        {
          setState(() {
            isFAB = true;
          });
        }
      else {
        isFAB = false;
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children:
        [CustomScrollView(
          controller: _scrollController,
          slivers: [
            // SliverAppBar with background image, title, and sale banner
            SliverAppBar(
              title: const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(Icons.arrow_downward, color: Colors.white, size: 30,),
                  Icon(Icons.favorite_border, color: Colors.white,)
                ],
              ),
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(90),
                  topRight: Radius.circular(90),
                ),
              ),
              pinned: true,
              expandedHeight: 600,
              flexibleSpace: FlexibleSpaceBar(
                background: Image.asset(
                  'lib/assets/images/eiffel tower.jpg',
                  fit: BoxFit.cover,
                ),
                centerTitle: false,
                expandedTitleScale: 1.5,
                title: const Padding(
                  padding: EdgeInsets.fromLTRB(0 , 0, 0, 20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      sales_banner(),
                      Text(
                        'Eiffel Tower',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Row(
                        children: [
                          Icon(Icons.location_on_outlined, color: Colors.white,
                            size: 15,),
                          Text(
                            'Paris, France',
                            style: TextStyle(
                              fontSize: 12,
                            ),
                          ),
                          Spacer(),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              bottom: PreferredSize(
                  preferredSize: const Size.fromHeight(50),
                  child: Container(
                    width: double.maxFinite,
                    padding: const EdgeInsets.only(top: 10, bottom: 10),
                    decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(200),
                            topRight: Radius.circular(200)
                        ),
                        color: Colors.white
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(
                          top: 10, left: 170, right: 180),
                      child: Container(
                        height: 10, width: 0,
                        decoration: BoxDecoration(
                            color: Colors.grey[200],
                            borderRadius: const BorderRadius.all(
                                Radius.circular(10))
                        ),
                      ),
                    ),
                  )),
            ),

            SliverToBoxAdapter(
              child: Container(
                height: 100.0,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 5,
                  itemBuilder: (context, index) {
                    return Container(
                      margin: const EdgeInsets.symmetric(horizontal: 10.0),
                      padding: const EdgeInsets.only(left: 10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20.0),
                        child: Image.asset('lib/assets/images/eiffel tower.jpg',
                          fit: BoxFit.cover,),
                      ),
                    );
                  },
                ),
              ),
            ),
            SliverPadding(
              padding: const EdgeInsets.symmetric(
                  horizontal: 20.0, vertical: 10.0).add(
                  const EdgeInsets.only(top: 15)),
              sliver: SliverToBoxAdapter(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Paris, where history whispers from cobblestones, art ignites souls,romance blooms by the Seine, and every bite sings a culinary delight.',
                      style: TextStyle(
                          color: Colors.grey,
                          fontSize: 18
                      ),),
                    const SizedBox(height: 10,),
                    const Center(
                      child: Text(
                        'READ MORE',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.blueGrey
                        ),
                      ),
                    ),
                    const SizedBox(height: 10,),
                    const SizedBox(height: 20.0),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10.0),
                      child: AspectRatio(
                        aspectRatio: 16 / 8,
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            YoutubePlayer(controller: _youtubePlayerController,
                              showVideoProgressIndicator: true,
                              onReady: () => debugPrint('Ready'),
                              bottomActions: [
                                CurrentPosition(),
                                ProgressBar(
                                  isExpanded: true,
                                  colors: const ProgressBarColors(
                                      playedColor: Colors.amber,
                                      handleColor: Colors.amberAccent
                                  ),
                                ),
                                const PlaybackSpeedButton()
                              ],)
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 10,),
                    const Text(
                      'TOP SIGHTS',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 18.0,
                          color: Colors.black
                      ),
                    ),
                    const SizedBox(height: 10,),
                    Row(
                      children: [
                        Container(
                            height: 100,
                            width: 150,
                            margin: const EdgeInsets.symmetric(horizontal: 10.0),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(20.0),
                              child: Image.asset(
                                'lib/assets/images/eiffel tower.jpg',
                                fit: BoxFit.cover,),
                            )
                        ),
                        const SizedBox(width: 50,),
                        const Column(
                          children: [
                            Text('Musee du Louvre',
                              style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold
                              ),),
                            Text('Top choice museum')
                          ],
                        )
                      ],
                    ),
                    const SizedBox(height: 20.0),
                  ],
                ),
              ),
            ),
          ],
        ),
          Positioned(
            bottom: 20,
              right: 0,
              left: 0,
              child: isFAB ? buildExtendedFAB() : buildFAB(),)
        ]
      ),
    );
  }
}


import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_music_player/blocs/music_bloc/music_bloc.dart';
import 'package:flutter_music_player/utils/router.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<MusicBloc, MusicState>(
        builder: (context, state) {
          if (state is MusicLoading) {
            return Center(child: CircularProgressIndicator());
          }
          if (state is MusicLoadSuccess) {
            return Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  end: Alignment.bottomRight,
                  begin: Alignment.topLeft,
                  colors: [
                    Color.fromRGBO(28, 31, 62, 1),
                    Color.fromRGBO(6, 9, 2, 1),
                  ],
                ),
              ),
              child: SafeArea(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                          top: 30.0,
                          left: 12.0,
                        ),
                        child: Text(
                          'Good Evening,',
                          style: GoogleFonts.getFont(
                            'Mulish',
                            fontWeight: FontWeight.w900,
                            fontSize: 30.0,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          top: 6.0,
                          left: 12.0,
                        ),
                        child: Text(
                          'Listen to our latest Lofi and Chillhop hits!',
                          style: GoogleFonts.getFont(
                            'Mulish',
                            fontWeight: FontWeight.w600,
                            fontSize: 15.0,
                            color: Color.fromRGBO(210, 210, 210, 1),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20.0,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: _albumSelector(state, context),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 12.0),
                        child: _curatedList(state, context),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 20.0),
                        child: _albumScrollView(state, context),
                      ),
                    ],
                  ),
                ),
              ),
            );
          }
          if (state is MusicLoadFailure) {
            return Center(
              child: Text(state.error),
            );
          } else {
            return Container();
          }
        },
      ),
    );
  }

  Widget _curatedList(MusicLoadSuccess state, BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(12.0),
          child: Text(
            'Top picks',
            style: GoogleFonts.getFont(
              'Mulish',
              fontWeight: FontWeight.w900,
              fontSize: 20.0,
              color: Colors.white,
            ),
          ),
        ),
        Container(
          height: 200.0,
          child: ListView.separated(
            padding: EdgeInsets.symmetric(
              horizontal: 12.0,
            ),
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemCount: state.albums.albums?.length ?? 2,
            itemBuilder: (context, index) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: ClipRRect(
                      borderRadius: BorderRadius.all(
                        Radius.circular(12.0),
                      ),
                      child: Image.asset(
                        state.albums.albums![index].songs![index].image ?? '',
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 12.0,
                  ),
                  Text(
                    state.albums.albums![index].songs![index].name ?? '',
                    style: GoogleFonts.getFont(
                      'Mulish',
                      fontWeight: FontWeight.w900,
                      fontSize: 15.0,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    state.albums.albums![index].songs![index].authors?.asMap().values.toString() ?? '',
                    style: GoogleFonts.getFont(
                      'Mulish',
                      fontWeight: FontWeight.w900,
                      fontSize: 12.0,
                      color: Colors.white,
                    ),
                  ),
                ],
              );
            },
            separatorBuilder: (context, index) {
              return SizedBox(
                width: 15,
              );
            },
          ),
        ),
      ],
    );
  }

  Widget _albumSelector(MusicLoadSuccess state, BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Recent Albums',
          style: GoogleFonts.getFont(
            'Mulish',
            fontWeight: FontWeight.w900,
            fontSize: 20.0,
            color: Colors.white,
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        GridView.builder(
          shrinkWrap: true,
          gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 200,
            childAspectRatio: 2.5,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
          ),
          itemCount: state.albums.albums!.length,
          itemBuilder: (BuildContext ctx, index) {
            return Container(
              decoration: BoxDecoration(
                color: Color.fromRGBO(48, 51, 82, 1),
                borderRadius: BorderRadius.all(
                  Radius.circular(
                    12.0,
                  ),
                ),
              ),
              width: MediaQuery.of(context).size.width / 2,
              child: Row(
                children: [
                  Expanded(
                    flex: 3,
                    child: ClipRRect(
                      borderRadius: BorderRadius.horizontal(
                        left: Radius.circular(10.0),
                      ),
                      child: Container(
                        height: 80.0,
                        child: Image.asset(
                          state.albums.albums![index].songs![0].image ?? '',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 5,
                    child: Container(
                      padding: EdgeInsets.only(left: 10.0),
                      child: Text(
                        state.albums.albums![index].name ?? '',
                        style: GoogleFonts.getFont(
                          'Mulish',
                          fontWeight: FontWeight.w700,
                          fontSize: 13.0,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ],
    );
  }

  Widget _albumScrollView(MusicLoadSuccess state, BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 24.0, left: 12.0),
          child: Text(
            'Albums',
            style: GoogleFonts.getFont(
              'Mulish',
              fontWeight: FontWeight.w900,
              fontSize: 20.0,
              color: Colors.white,
            ),
          ),
        ),
        for (int i = 0; i < state.albums.albums!.length; i++) ...{
          Padding(
            padding: EdgeInsets.only(
              top: 20.0,
              bottom: 10.0,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 12.0, bottom: 10.0),
                  child: Text(
                    state.albums.albums![i].name ?? '',
                    style: GoogleFonts.getFont(
                      'Mulish',
                      fontWeight: FontWeight.w600,
                      fontSize: 15.0,
                      color: Colors.white,
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, musicPlayerRoute, arguments: []);
                  },
                  child: Container(
                    height: 200.0,
                    child: ListView.separated(
                      padding: EdgeInsets.symmetric(
                        horizontal: 12.0,
                      ),
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemCount: state.albums.albums?[i].songs?.length ?? 0,
                      itemBuilder: (context, index) {
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: ClipRRect(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(12.0),
                                ),
                                child: Image.asset(
                                  state.albums.albums![i].songs![index].image ?? '',
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 12.0,
                            ),
                            Text(
                              state.albums.albums![i].songs![index].name ?? '',
                              style: GoogleFonts.getFont(
                                'Mulish',
                                fontWeight: FontWeight.w900,
                                fontSize: 15.0,
                                color: Colors.white,
                              ),
                            ),
                            Text(
                              state.albums.albums![i].songs![index].authors?.asMap().values.toString() ?? '',
                              style: GoogleFonts.getFont(
                                'Mulish',
                                fontWeight: FontWeight.w900,
                                fontSize: 12.0,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        );
                      },
                      separatorBuilder: (context, index) {
                        return SizedBox(
                          width: 15,
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        }
      ],
    );
  }
}

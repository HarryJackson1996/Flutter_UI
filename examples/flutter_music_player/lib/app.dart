import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_music_player/repositories/music_repository.dart';
import 'package:flutter_music_player/utils/router.dart' as MyRouter;

import 'blocs/music_bloc/music_bloc.dart';
import 'blocs/music_controller_bloc/music_controller_bloc.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<MusicBloc>(
          create: (BuildContext context) => MusicBloc(
            musicRepository: MusicRepository(),
          )..add(MusicFetchedEvent()),
        ),
        BlocProvider<MusicControllerBloc>(
          create: (BuildContext context) => MusicControllerBloc(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Material App',
        onGenerateRoute: MyRouter.Router.generateRoute,
      ),
    );
  }
}

import 'package:flutter_mobile_application/features/main/bloc/index.dart';
import 'package:flutter_mobile_application/features/main/repositories/configuration_repository.dart';
import 'package:flutter_mobile_application/features/main/ui/widgets/main_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainPage extends StatefulWidget {
  MainPage({Key key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: BlocProvider<ConfigurationBloc>(
        create: (context) => ConfigurationBloc(
          ConfigurationEmptyState(),
          RepositoryProvider.of<ConfigurationRepository>(context),
        )..add(
            ConfigurationLoadEvent(),
          ),
        lazy: true,
        child: MainWidget(),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_mobile_application/common/widget/loading_widget.dart';
import 'package:flutter_mobile_application/feature/home/bloc/home_bloc.dart';
import 'package:flutter_mobile_application/feature/home/bloc/home_state.dart';
import 'package:flutter_mobile_application/generated/l10n.dart';

class HomeWidget extends StatefulWidget {
  const HomeWidget({Key key}) : super(key: key);

  @override
  _HomeWidgetState createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        if (state is HomeEmptyState) {
          return Container(
            child: LoadingWidget(),
          );
        }
        if (state is HomeErrorState) {
          return Center(
            child: Text(
              "Could not load home page, please try again later",
              style: TextStyle(color: Colors.white),
            ),
          );
        }
        if (state is HomeLoadedState) {
          return Center(
            child: Text(Content.of(context).home),
          );
        }
        return Container(
          child: LoadingWidget(),
        );
      },
    );
  }
}

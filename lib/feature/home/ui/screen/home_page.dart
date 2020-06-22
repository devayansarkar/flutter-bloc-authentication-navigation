import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_mobile_application/common/constants/env.dart';
import 'package:flutter_mobile_application/common/network/api_provider.dart';
import 'package:flutter_mobile_application/feature/home/bloc/home_bloc.dart';
import 'package:flutter_mobile_application/feature/home/bloc/home_event.dart';
import 'package:flutter_mobile_application/feature/home/services/home_page_service.dart';
import 'package:flutter_mobile_application/feature/home/ui/widget/home_widget.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => HomeBloc(
          service: HomeService(
            env: RepositoryProvider.of<Env>(context),
            apiProvider: RepositoryProvider.of<ApiProvider>(context),
          ),
        )..add(
            LoadHomeEvent(),
          ),
        child: Container(
          child: HomeWidget(),
        ),
      ),
    );
  }
}

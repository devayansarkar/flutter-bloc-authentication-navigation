import 'package:flutter_mobile_application/common/styles/background_style.dart';
import 'package:flutter_mobile_application/features/authentication/bloc/index.dart';
import 'package:flutter_mobile_application/features/main/pages/account/bloc/index.dart';
import 'package:flutter_mobile_application/features/main/pages/account/repositories/account_repository.dart';
import 'package:flutter_mobile_application/features/main/pages/account/ui/widgets/account_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AccountPage extends StatefulWidget {
  AccountPage({Key key}) : super(key: key);

  @override
  _AccountPageState createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: BlocProvider<AccountBloc>(
        create: (context) => AccountBloc(
          AccountEmptyState(),
          RepositoryProvider.of<AccountRepository>(context),
          BlocProvider.of<AuthenticationBloc>(context),
        )..add(
            AccountLoadEvent(),
          ),
        lazy: true,
        child: Container(
          decoration: BackgroundStyle.getGradientBackground(),
          child: AccountWidget(),
        ),
      ),
    );
  }
}

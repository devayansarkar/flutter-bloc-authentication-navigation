import 'package:flutter_mobile_application/common/widgets/action_card.dart';
import 'package:flutter_mobile_application/common/widgets/loading_indicator.dart';
import 'package:flutter_mobile_application/features/main/pages/account/bloc/index.dart';
import 'package:flutter_mobile_application/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AccountWidget extends StatefulWidget {
  AccountWidget({Key key}) : super(key: key);

  @override
  _AccountWidgetState createState() => _AccountWidgetState();
}

class _AccountWidgetState extends State<AccountWidget> {
  void _onLogoutButtonPressed() => BlocProvider.of<AccountBloc>(context).add(
        AccountLogoutEvent(),
      );

  @override
  Widget build(BuildContext context) {
    return BlocListener<AccountBloc, AccountState>(
      listener: (context, state) {
        debugPrint("[ACCOUNT PAGE] Receiving event: $state");
      },
      child: BlocBuilder<AccountBloc, AccountState>(
        builder: (context, state) => _getAccountView(state),
      ),
    );
  }

  Widget _getAccountView(AccountState state) {
    if (state is AccountEmptyState || state is AccountLoadingState)
      return LoadingIndicator();

    return Column(
      children: [
        ActionCard(
          icon: Icons.logout,
          title: Content.of(context).signOutTitle,
          function: _onLogoutButtonPressed,
        ),
      ],
    );
  }
}

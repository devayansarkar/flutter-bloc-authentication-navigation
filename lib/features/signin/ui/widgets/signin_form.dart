import 'package:flutter_mobile_application/common/routes/routes.dart';
import 'package:flutter_mobile_application/common/styles/custom_text_style.dart';
import 'package:flutter_mobile_application/common/constants/asset_images.dart';
import 'package:flutter_mobile_application/common/constants/theme_colors.dart';
import 'package:flutter_mobile_application/common/styles/size_config.dart';
import 'package:flutter_mobile_application/common/widgets/boxed_text_field.dart';
import 'package:flutter_mobile_application/common/widgets/chip_button.dart';
import 'package:flutter_mobile_application/common/widgets/loading_indicator.dart';
import 'package:flutter_mobile_application/features/signin/bloc/index.dart';
import 'package:flutter_mobile_application/generated/l10n.dart';
import 'package:flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignInForm extends StatefulWidget {
  @override
  State<SignInForm> createState() => _SignInFormState();
}

class _SignInFormState extends State<SignInForm>
    with SingleTickerProviderStateMixin {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  final FocusNode _usernameFocusNode = FocusNode();
  final FocusNode _passwordFocusNode = FocusNode();
  AnimationController _controller;
  Animation _animation;

  @override
  void initState() {
    super.initState();

    _controller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 300));
    _animation = Tween(begin: 50.0, end: 20.0).animate(_controller)
      ..addListener(() {
        setState(() {
          // makes the ui repaint
        });
      });

    _usernameFocusNode.addListener(() {
      if (_usernameFocusNode.hasFocus) {
        _controller.forward();
      } else {
        _controller.reverse();
      }
    });

    _passwordFocusNode.addListener(() {
      if (_passwordFocusNode.hasFocus) {
        _controller.forward();
      } else {
        _controller.reverse();
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    _usernameFocusNode.dispose();
    _passwordFocusNode.dispose();

    super.dispose();
  }

  void _onLoginButtonPressed() {
    BlocProvider.of<SignInBloc>(context).add(
      InitiateSignInEvent(
        _usernameController.text.trim(),
        _passwordController.text,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return BlocListener<SignInBloc, SignInState>(
      listener: (context, state) {
        if (state is SignInFailureState) {
          _showSignInError(state);
        }
      },
      child: BlocBuilder<SignInBloc, SignInState>(
        builder: (context, state) => _getSignForm(state),
      ),
    );
  }

  Widget _getSignForm(SignInState state) {
    return InkWell(
      splashColor: Colors.transparent,
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: Container(
        margin: const EdgeInsets.only(left: 20.0, right: 20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            SizedBox(height: _animation.value),
            Image.asset(
              LocalImages.logo,
              height: 100,
            ),
            Text(
              Content.of(context).appName,
              style: CustomTextStyle.getTitleStyle(),
            ),
            SizedBox(height: SizeConfig.blockSizeVertical * 4),
            Text(
              Content.of(context).signInPageTitle,
              style: CustomTextStyle.getHeaderStyle(),
            ),
            SizedBox(height: SizeConfig.blockSizeVertical * 2),
            Form(
              child: Column(
                children: [
                  BoxedTextField(
                    controller: _usernameController,
                    hint: Content.of(context).signInEmailHint,
                    isInputHidden: false,
                    focusNode: _usernameFocusNode,
                  ),
                  SizedBox(height: SizeConfig.blockSizeVertical * 2),
                  BoxedTextField(
                    controller: _passwordController,
                    hint: Content.of(context).signInPasswordHint,
                    isInputHidden: true,
                    focusNode: _passwordFocusNode,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      SizedBox(height: SizeConfig.blockSizeVertical * 5),
                      _signInButton(state),
                    ],
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 10),
                    child: state is InitiatingSignInState
                        ? LoadingIndicator()
                        : Container(),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      SizedBox(height: SizeConfig.blockSizeVertical * 5),
                      Center(
                        child: Text(
                          Content.of(context).signUpHint,
                          style: CustomTextStyle.getSubtitleStyle(),
                        ),
                      ),
                      SizedBox(height: SizeConfig.blockSizeVertical * 1),
                      _signUpButton(context),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _showSignInError(SignInFailureState state) {
    if (state.attempt > 2) {
      final snackBar = SnackBar(
        duration: Duration(seconds: 3),
        backgroundColor: ThemeColors.primaryColor,
        content: Text(
          Content.of(context).signInIssueContactUs,
        ),
      );
      Scaffold.of(context).showSnackBar(snackBar);
    }
    return Flushbar(
      icon: Icon(
        Icons.warning,
        color: ThemeColors.red,
      ),
      leftBarIndicatorColor: ThemeColors.red,
      flushbarPosition: FlushbarPosition.TOP,
      title: Content.of(context).signInFailureTitle,
      message: state.error,
      duration: Duration(seconds: 3),
    )..show(context);
  }

  Widget _signInButton(SignInState state) {
    return ChipButton(
        name: Content.of(context).signInButtonName,
        buttonOperation:
            state is! InitiatingSignInState ? _onLoginButtonPressed : null);
  }

  Widget _signUpButton(BuildContext context) {
    return ChipButton(
        name: Content.of(context).signUpButtonName,
        buttonOperation: () {
          Navigator.of(context).pushNamed(Routes.signUp);
        });
  }
}

import 'package:flutter_mobile_application/common/constants/asset_images.dart';
import 'package:flutter_mobile_application/common/constants/theme_colors.dart';
import 'package:flutter_mobile_application/common/styles/custom_text_style.dart';
import 'package:flutter_mobile_application/common/styles/size_config.dart';
import 'package:flutter_mobile_application/common/widgets/boxed_text_field.dart';
import 'package:flutter_mobile_application/common/widgets/chip_button.dart';
import 'package:flutter_mobile_application/common/widgets/loading_indicator.dart';
import 'package:flutter_mobile_application/features/signup/bloc/index.dart';
import 'package:flutter_mobile_application/generated/l10n.dart';
import 'package:flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpForm extends StatefulWidget {
  @override
  State<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm>
    with SingleTickerProviderStateMixin {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  final _passwordReentryController = TextEditingController();
  final FocusNode _usernameFocusNode = FocusNode();
  final FocusNode _passwordFocusNode = FocusNode();
  final FocusNode _passwordReentryFocusNode = FocusNode();
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

    _passwordReentryFocusNode.addListener(() {
      if (_passwordReentryFocusNode.hasFocus) {
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
    _passwordReentryFocusNode.dispose();

    super.dispose();
  }

  void _onSignUpButtonPressed() {
    if (_passwordController.text != _passwordReentryController.text) {
      Flushbar(
        icon: Icon(
          Icons.warning,
          color: ThemeColors.red,
        ),
        leftBarIndicatorColor: ThemeColors.red,
        flushbarPosition: FlushbarPosition.TOP,
        title: Content.of(context).signUpPasswordMatchTitle,
        message: Content.of(context).signUpPasswordMatch,
        duration: Duration(seconds: 3),
      )..show(context);
    } else {
      BlocProvider.of<SignUpBloc>(context).add(
        InitiateSignUpEvent(
          _usernameController.text.trim(),
          _passwordController.text,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return BlocListener<SignUpBloc, SignUpState>(
      listener: (context, state) {
        if (state is SignUpFailureState) {
          _showSignUpError(state);
        }
        if (state is SignUpSuccessState) {
          Navigator.pop(context);
        }
      },
      child: BlocBuilder<SignUpBloc, SignUpState>(
        builder: (context, state) => _getSignUpForm(state),
      ),
    );
  }

  Widget _getSignUpForm(SignUpState state) {
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
              Content.of(context).signUpPageTitle,
              style: CustomTextStyle.getHeaderStyle(),
            ),
            SizedBox(height: SizeConfig.blockSizeVertical * 2),
            Form(
              child: Column(
                children: [
                  BoxedTextField(
                    controller: _usernameController,
                    hint: Content.of(context).signUpEmailHint,
                    isInputHidden: false,
                    focusNode: _usernameFocusNode,
                  ),
                  SizedBox(height: SizeConfig.blockSizeVertical * 2),
                  BoxedTextField(
                    controller: _passwordController,
                    hint: Content.of(context).signUpPasswordHint,
                    isInputHidden: true,
                    focusNode: _passwordFocusNode,
                  ),
                  SizedBox(height: SizeConfig.blockSizeVertical * 2),
                  BoxedTextField(
                    controller: _passwordReentryController,
                    hint: Content.of(context).signUpPasswordReentryHint,
                    isInputHidden: true,
                    focusNode: _passwordReentryFocusNode,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      SizedBox(height: SizeConfig.blockSizeVertical * 5),
                      _signUpButton(state),
                    ],
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 10),
                    child: state is InitiatingSignUpState
                        ? LoadingIndicator()
                        : Container(),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _showSignUpError(SignUpFailureState state) {
    return Flushbar(
      icon: Icon(
        Icons.warning,
        color: ThemeColors.red,
      ),
      leftBarIndicatorColor: ThemeColors.red,
      flushbarPosition: FlushbarPosition.TOP,
      title: Content.of(context).signUpFailureTitle,
      message: state.error,
      duration: Duration(seconds: 3),
    )..show(context);
  }

  Widget _signUpButton(SignUpState state) {
    return ChipButton(
        name: Content.of(context).signUpButtonName,
        buttonOperation:
            state is! InitiatingSignUpState ? _onSignUpButtonPressed : null);
  }
}

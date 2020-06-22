import 'package:flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_mobile_application/common/constants/themeColors.dart';
import 'package:flutter_mobile_application/common/widget/boxed_text_field.dart';
import 'package:flutter_mobile_application/common/widget/chip_button.dart';
import 'package:flutter_mobile_application/common/widget/loading_widget.dart';
import 'package:flutter_mobile_application/feature/signin/bloc/index.dart';
import 'package:flutter_mobile_application/generated/l10n.dart';

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
    _animation = Tween(begin: 200.0, end: 20.0).animate(_controller)
      ..addListener(() {
        setState(() {});
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
      SignInButtonPressed(
        username: _usernameController.text,
        password: _passwordController.text,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<SignInBloc, SignInState>(
      listener: (context, state) {
        if (state is SignInFailure) {
          Flushbar(
            icon: Icon(
              Icons.warning,
              color: Colors.red,
            ),
            leftBarIndicatorColor: Colors.red,
            flushbarPosition: FlushbarPosition.TOP,
            title: Content.of(context).signInErrorTitle,
            message: state.error,
            duration: Duration(seconds: 3),
          )..show(context);
        }
        if (state is SignInSuccess) {
          Navigator.pop(context);
        }
      },
      child: BlocBuilder<SignInBloc, SignInState>(
        builder: (context, state) {
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
                  Text(
                    Content.of(context).signIn,
                    style: TextStyle(
                      color: ThemeColors.primaryColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 40,
                    ),
                  ),
                  Form(
                    child: Column(
                      children: [
                        const SizedBox(height: 30),
                        BoxedTextField(
                          controller: _usernameController,
                          hint: Content.of(context).userNameHint,
                          focusNode: _usernameFocusNode,
                        ),
                        const SizedBox(height: 15),
                        BoxedTextField(
                          controller: _passwordController,
                          hint: Content.of(context).passwordHint,
                          isInputHidden: true,
                          focusNode: _passwordFocusNode,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: <Widget>[
                            const SizedBox(height: 30),
                            _signInButton(state),
                            const SizedBox(height: 30),
                          ],
                        ),
                        Container(
                          child:
                              state is SignInLoading ? LoadingWidget() : null,
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _signInButton(SignInState state) {
    return ChipButton(
        name: Content.of(context).loginButton,
        buttonOperation:
            state is! SignInLoading ? _onLoginButtonPressed : null);
  }
}

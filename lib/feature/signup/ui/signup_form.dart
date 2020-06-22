import 'package:flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_mobile_application/common/constants/themeColors.dart';
import 'package:flutter_mobile_application/common/widget/boxed_text_field.dart';
import 'package:flutter_mobile_application/common/widget/chip_button.dart';
import 'package:flutter_mobile_application/common/widget/loading_widget.dart';
import 'package:flutter_mobile_application/feature/signup/bloc/signup_bloc.dart';
import 'package:flutter_mobile_application/feature/signup/bloc/signup_event.dart';
import 'package:flutter_mobile_application/feature/signup/bloc/signup_state.dart';
import 'package:flutter_mobile_application/generated/l10n.dart';

class SignUpForm extends StatefulWidget {
  @override
  State<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm>
    with SingleTickerProviderStateMixin {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  final _emailController = TextEditingController();
  final FocusNode _usernameFocusNode = FocusNode();
  final FocusNode _emailFocusNode = FocusNode();
  final FocusNode _passwordFocusNode = FocusNode();
  AnimationController _controller;
  Animation _animation;

  @override
  void initState() {
    super.initState();

    _controller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 300));
    _animation = Tween(begin: 150.0, end: 0.0).animate(_controller)
      ..addListener(() {
        setState(() {});
      });

    _emailFocusNode.addListener(() {
      if (_emailFocusNode.hasFocus) {
        _controller.forward();
      } else {
        _controller.reverse();
      }
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
    _emailFocusNode.dispose();
    _usernameFocusNode.dispose();
    _passwordFocusNode.dispose();

    super.dispose();
  }

  void _onSignUpButtonPressed() {
    BlocProvider.of<SignUpBloc>(context).add(
      SignUpButtonPressed(
        username: _usernameController.text,
        password: _passwordController.text,
        email: _emailController.text,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<SignUpBloc, SignUpState>(
      listener: (context, state) {
        if (state is SignUpFailure) {
          Flushbar(
            icon: Icon(
              Icons.warning,
              color: Colors.red,
            ),
            leftBarIndicatorColor: Colors.red,
            flushbarPosition: FlushbarPosition.TOP,
            title: Content.of(context).signUpErrorTitle,
            message: state.error,
            duration: Duration(seconds: 3),
          )..show(context);
        }

        if (state is SignUpSuccess) {
          Scaffold.of(context).showSnackBar(
            SnackBar(
              content: Text(Content.of(context).signupSuccess),
              backgroundColor: Theme.of(context).accentColor,
            ),
          );
          Navigator.pop(context);
        }
      },
      child: BlocBuilder<SignUpBloc, SignUpState>(
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
                    Content.of(context).signUp,
                    style: TextStyle(
                        color: ThemeColors.primaryColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 40),
                  ),
                  Form(
                    child: Column(
                      children: [
                        const SizedBox(height: 10),
                        BoxedTextField(
                          controller: _emailController,
                          hint: Content.of(context).emailHint,
                          keyboard: TextInputType.emailAddress,
                          focusNode: _emailFocusNode,
                        ),
                        const SizedBox(height: 10),
                        BoxedTextField(
                          controller: _usernameController,
                          hint: Content.of(context).userNameHint,
                          focusNode: _usernameFocusNode,
                        ),
                        const SizedBox(height: 10),
                        BoxedTextField(
                          controller: _passwordController,
                          hint: Content.of(context).passwordHint,
                          isInputHidden: true,
                          keyboard: TextInputType.visiblePassword,
                          focusNode: _passwordFocusNode,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: <Widget>[
                            const SizedBox(height: 30),
                            _signUpButton(state),
                            const SizedBox(height: 30),
                            Text(
                              Content.of(context).alreadyUser,
                              style: TextStyle(
                                color: ThemeColors.primaryColor,
                              ),
                              textAlign: TextAlign.center,
                            ),
                            const SizedBox(height: 10),
                            _signInButton(state),
                          ],
                        ),
                        Container(
                          child:
                              state is SignUpLoading ? LoadingWidget() : null,
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

  Widget _signInButton(SignUpState state) {
    return ChipButton(
        buttonOperation: state is! SignUpLoading
            ? () {
                Navigator.pop(context);
              }
            : null,
        name: Content.of(context).signIn);
  }

  Widget _signUpButton(SignUpState state) {
    return ChipButton(
        buttonOperation:
            state is! SignUpLoading ? _onSignUpButtonPressed : null,
        name: Content.of(context).signUp);
  }
}

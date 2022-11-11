// ignore: unused_import
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_demo/core/utils/mvp_extensions.dart';
import 'package:flutter_demo/features/auth/login/login_presentation_model.dart';
import 'package:flutter_demo/features/auth/login/login_presenter.dart';
import 'package:flutter_demo/localization/app_localizations_utils.dart';

class LoginPage extends StatefulWidget with HasPresenter<LoginPresenter> {
  const LoginPage({
    required this.presenter,
    super.key,
  });

  @override
  final LoginPresenter presenter;

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> with PresenterStateMixin<LoginViewModel, LoginPresenter, LoginPage> {
  @override
  Widget build(BuildContext context) => Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(32.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                decoration: InputDecoration(
                  hintText: appLocalizations.usernameHint,
                ),
                onChanged: (username) => presenter.updateUsername(username),
              ),
              const SizedBox(height: 8),
              TextField(
                obscureText: true,
                decoration: InputDecoration(
                  hintText: appLocalizations.passwordHint,
                ),
                onChanged: (password) => presenter.updatePassword(password),
              ),
              const SizedBox(height: 16),
              stateObserver(
                //show CircularProgressIndicator instead of loading button while signing in
                builder: (context, state) => state.isLoading
                    ? const CircularProgressIndicator()
                    : ElevatedButton(
                        //disable the button if conditions aren't satisfied by passing null as a callback
                        onPressed: () => state.isLoginEnabled ? presenter.login() : null,
                        //add some style to make it visually easier to test
                        style: ElevatedButton.styleFrom(
                          primary: state.isLoginEnabled ? Colors.blue : Colors.grey,
                        ),
                        child: Text(appLocalizations.logInAction),
                      ),
              ),
            ],
          ),
        ),
      );
}

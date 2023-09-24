import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:test_app_mvvm/presentation/common/state_renderer/state_renderer_impl.dart';
import 'package:test_app_mvvm/presentation/manager/app_routs.dart';
import 'package:test_app_mvvm/presentation/manager/assets_manager.dart';
import 'package:test_app_mvvm/presentation/manager/color_manager.dart';
import 'package:test_app_mvvm/presentation/manager/strings_manager.dart';
import 'package:test_app_mvvm/presentation/manager/values_manager.dart';
import 'package:test_app_mvvm/presentation/pages/login/login_view_model/login_view_model.dart';
import 'package:test_app_mvvm/presentation/widgets/app_widget.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final LoginViewModel _loginViewModel = GetIt.instance<LoginViewModel>();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    _loginViewModel.start();
    _usernameController.addListener(
      () {
        _loginViewModel.setUsername(_usernameController.text);
      },
    );
    _passwordController.addListener(
      () {
        _loginViewModel.setPassword(_passwordController.text);
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColorManager.white,
      body: StreamBuilder<FlowState>(
        stream: _loginViewModel.flowStateOutput,
        builder: (context, snapshot) {
          return snapshot.data?.getWidgetScreenState(
                context,
                contentScreenWidget: _myScreenWidgets(),
                retryActionFun: () {
                  _loginViewModel.login();
                },
              ) ??
              _myScreenWidgets();
        },
      ),
    );
  }

  Widget _myScreenWidgets() {
    return SingleChildScrollView(
      child: Column(
        children: [
          const SizedBox(
            height: AppSize.s50,
          ),
          Image.asset(
            ImageAssets.splashLogo,
          ),
          Form(
            key: _formKey,
            child: Column(
              children: [
                const SizedBox(
                  height: AppSize.s40,
                ),
                StreamBuilder<bool>(
                  stream: _loginViewModel.usernameValidOutput,
                  builder: (context, snapshot) => MyTextFormField(
                    controller: _usernameController,
                    hint: AppStringManager.email,
                    error: (snapshot.data ?? true)
                        ? null
                        : AppStringManager.textFailedError,
                    // label: const Text(AppStringManager.email),
                  ),
                ),
                const SizedBox(
                  height: AppSize.s20,
                ),
                StreamBuilder<bool>(
                    stream: _loginViewModel.passwordValidOutput,
                    builder: (context, snapshot) {
                      return MyTextFormField(
                        controller: _passwordController,
                        hint: AppStringManager.password,
                        error: (snapshot.data ?? true)
                            ? null
                            : AppStringManager.textFailedError,
                        // label: const Text(AppStringManager.password),
                      );
                    }),
                const SizedBox(
                  height: AppSize.s50,
                ),
                StreamBuilder<bool>(
                    stream: _loginViewModel.areAllInputValidOutput,
                    builder: (context, snapshot) {
                      return MyButton(
                        onPress: (snapshot.data ?? false)
                            ? () {
                          _loginViewModel.login();
                        }
                            : null,
                        child: Text(
                          AppStringManager.login,
                          style: Theme.of(context)
                              .textTheme
                              .headlineLarge!
                              .copyWith(color: AppColorManager.white),
                          textAlign: TextAlign.center,
                        ),
                      );
                    }),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: AppSize.s16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                MyTextButton(
                  text: AppStringManager.forgetPass,
                  color: AppColorManager.primary,
                  onPress: () => Navigator.of(context).pushNamed(
                    AppRoutes.forgetPass,
                  ),
                ),
                MyTextButton(
                  text: AppStringManager.noAccountSignUp,
                  color: AppColorManager.primary,
                  onPress: () => Navigator.of(context).pushNamed(
                    AppRoutes.register,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _loginViewModel.dispose();
    super.dispose();
  }
}

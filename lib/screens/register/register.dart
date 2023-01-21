import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:intl/intl.dart';
import 'package:map_my_walk/configs/app_typography_ext.dart';

import '../../configs/app.dart';
import '../../configs/app_theme.dart';
import '../../configs/app_typography.dart';
import '../../configs/space.dart';
import '../../cubits/auth/cubit.dart';
import '../../cubits/domain/cubit.dart';
import '../../providers/app_provider.dart';
import '../../utils/custom_snackbar.dart';
import '../../widgets/buttons/app_button.dart';
import '../../widgets/loader/full_screen_loader.dart';
import '../../widgets/screen/screen.dart';
import '../../widgets/text_fields/custom_text_field.dart';
import '../../widgets/text_fields/date_time_text_field.dart';
class RegisterScreen extends StatelessWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    App.init(context);
    ScreenUtil.init(context, designSize: const Size(428, 926));

    final state = AppProvider.state(context);
    final authCubit = AuthCubit.cubit(context);
    final domainCubit = DomainCubit.cubit(context);
    final domains = domainCubit.state.data ?? [];

    return Screen(
      overlayWidgets: [
        BlocConsumer<AuthCubit, AuthState>(
          listener: (context, state) {
            if (state is AuthRegisterFailed) {
              CustomSnackBars.failure(context, state.message!);
            } else if (state is AuthRegisterSuccess) {
              CustomSnackBars.success(
                context,
                'Account has been created successfully. Please check your email for verification.',
                color: AppTheme.c.primary,
              );
              Navigator.pop(context);
            }
          },
          builder: (context, state) {
            if (state is AuthRegisterLoading) {
              return const FullScreenLoader(
                loading: true,
              );
            }
            return const SizedBox();
          },
        ),
      ],
      child: Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            padding: Space.all(),
            child: FormBuilder(
              key: state.registerFormState,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const Align(
                    alignment: Alignment.centerLeft,
                    child: BackButton(),
                  ),
                  Space.y2,
                  Text(
                    'Create Account',
                    style: AppText.h1b.cl(
                      AppTheme.c.primaryDark!,
                    ),
                  ),
                  Text(
                    'Please enter the following information',
                    style: AppText.b2,
                  ),
                  Space.y2,
                  CustomTextField(
                    name: 'name',
                    hint: 'Full name',
                    prefixIcon: const Icon(Icons.person_outline),
                    textInputType: TextInputType.name,
                    validators: FormBuilderValidators.compose([
                      FormBuilderValidators.min(2),
                      FormBuilderValidators.required(),
                    ]),
                  ),
                  Space.y1,
                  CustomTextField(
                    name: 'email',
                    hint: 'Email address',
                    textCapitalization: TextCapitalization.none,
                    prefixIcon: const Icon(Icons.email_outlined),
                    textInputType: TextInputType.emailAddress,
                    validators: FormBuilderValidators.compose([
                      FormBuilderValidators.required(),
                      FormBuilderValidators.email(
                          errorText: 'Invalid email address'),
                    ]),
                  ),
                  Space.y1,
                  CustomTextField(
                    name: 'password',
                    hint: 'Enter password',
                    isPass: true,
                    prefixIcon: const Icon(Icons.lock_outline),
                    textInputType: TextInputType.text,
                    validators: FormBuilderValidators.compose([
                      FormBuilderValidators.min(6,
                          errorText: 'Password must be at least 6 characters'),
                      FormBuilderValidators.required(),
                    ]),
                  ),
                  Space.y1,
                  CustomDateTimeField(
                    hint: 'Date of Birth',
                    name: 'dob',
                    icon: const Icon(Icons.event_outlined),
                    format: DateFormat('dd-MM-yyyy'),
                    initialDate: DateTime(1999),
                    firstDate: DateTime(1956),
                    lastDate: DateTime(2010),
                    validatorFtn: (value) {
                      if (value == null) {
                        return 'Date of birth is required';
                      }
                      return null;
                    },
                  ),
                  Space.y1,
                  CustomTextField(
                    name: 'height',
                    hint: 'Height (ft)',
                    prefixIcon: const Icon(Icons.height_rounded),
                    textInputType: TextInputType.number,
                    validators: FormBuilderValidators.required(),
                  ),
                  Space.y1,
                  CustomTextField(
                    name: 'weight',
                    hint: 'Weight (kg)',
                    prefixIcon: const Icon(Icons.monitor_weight_outlined),
                    textInputType: TextInputType.number,
                    validators: FormBuilderValidators.compose([
                      FormBuilderValidators.min(10,
                          errorText: 'Weight cannot be less than 10 KG'),
                      FormBuilderValidators.required(),
                    ]),
                    inputformatters: [
                      LengthLimitingTextInputFormatter(3),
                    ],
                  ),
                  Space.y1,
                  Text(
                    'Gender',
                    style: AppText.b1b.cl(
                      AppTheme.c.primary,
                    ),
                  ),
                  FormBuilderRadioGroup(
                    decoration: const InputDecoration(
                      contentPadding: EdgeInsets.zero,
                      isDense: true,
                      border: InputBorder.none,
                    ),
                    name: 'gender',
                    activeColor: AppTheme.c.primary,
                    initialValue: 'male',
                    options: ['male', 'female']
                        .map(
                          (e) => FormBuilderFieldOption(
                            value: e,
                            child: Text(
                              toBeginningOfSentenceCase(e)!,
                              style: AppText.b2,
                            ),
                          ),
                        )
                        .toList(),
                  ),
                  Space.y2,
                  AppButton(
                    child: Text(
                      'Register',
                      style: AppText.b1b.cl(
                        Colors.white,
                      ),
                    ),
                    onPressed: () {
                      if (state.registerFormState.currentState!
                          .saveAndValidate()) {
                        FocusScope.of(context).unfocus();

                        final fields =
                            state.registerFormState.currentState!.fields;

                        final values = fields.map(
                          (key, value) => MapEntry(
                            key,
                            value.value.toString().trim(),
                          ),
                        );
                        // !domains.contains(values['email']!.split('@').last) // condition for if
                        if (false) {
                          showDialog(
                            context: context,
                            builder: (context) => inviteOnly(
                              context,
                              values['email']!,
                            ),
                          );
                        } else {
                          authCubit.register(
                            values['name']!,
                            values['email']!,
                            values['password']!,
                            values['gender']!,
                            DateTime.parse(values['dob']!),
                            double.parse(values['weight']!),
                            double.parse(values['height']!),
                          );
                        }
                      }
                    },
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Text('Already have an account?'),
                      TextButton(
                        onPressed: () => Navigator.pop(context),
                        child: const Text('Login'),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget inviteOnly(BuildContext context, String email) {
    return AlertDialog(
      title: Text(
        'Ops!',
        style: AppText.h1b.cl(
          AppTheme.c.primary,
        ),
      ),
      content: Text(
        '$email\n\nWe are testing our app for invite only Email domains for university students.\n\nThank you for you interest, we would love to see you at our Beta launch!',
        style: AppText.b1,
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text('Back'),
        )
      ],
    );
  }
}

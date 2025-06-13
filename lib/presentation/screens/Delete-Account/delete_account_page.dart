import 'package:construction_mate/logic/controllers/delete_account/delete_account_bloc.dart';
import 'package:construction_mate/presentation/widgets/common/common_button.dart';
import 'package:construction_mate/presentation/widgets/common/common_text_form_field.dart';
import 'package:construction_mate/utilities/extension/sized_box_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DeleteAccountPage extends StatelessWidget {
  const DeleteAccountPage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Delete Account',
              style: theme.titleMedium,
            ),
            15.hx,
            Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                border: Border.all(color: Color(0xffEDEDED)),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Enter Email address to delete your account"),
                  CustomTextFormField(
                    hintText: "Enter Email Address",
                    textInputType: TextInputType.emailAddress,
                    textInputAction: TextInputAction.done,
                    onChanged: (value) {
                      // context.read<DeleteAccountBloc>().add(
                      //       DeleteAccountEvent.emailChanged(email: value),
                      //     );
                    },
                  ),
                  15.hx,
                  BlocConsumer<DeleteAccountBloc, DeleteAccountState>(
                    listener: (context, state) {
                      if (state.state.isLoaded) {
                        context.read<DeleteAccountBloc>().add(
                              DeleteAccountEvent.emailChanged(email: ''),
                            );
                      } else if (state.state.isError) {}
                    },
                    builder: (context, state) {
                      return Align(
                        alignment: Alignment.centerRight,
                        child: CustomElevatedButton(
                          isLoading: state.state.isLoading,
                          width: MediaQuery.of(context).size.width * 0.2,
                          onTap: () {
                            if (state.email.isEmpty) {
                              return;
                            } else {
                              context.read<DeleteAccountBloc>().add(
                                    DeleteAccountEvent.deleteAccount(),
                                  );
                            }
                          },
                          label: "Delete Account",
                        ),
                      );
                    },
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

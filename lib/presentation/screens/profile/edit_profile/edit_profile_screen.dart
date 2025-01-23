import 'dart:io';

import 'package:construction_mate/core/constants/colors.dart';
import 'package:construction_mate/core/constants/constants.dart';
import 'package:construction_mate/gen/assets.gen.dart';
import 'package:construction_mate/logic/controllers/Profile/EditProfileBloc/edit_profile_bloc.dart';
import 'package:construction_mate/logic/controllers/Profile/user-watcher/user_watcher_bloc.dart';
import 'package:construction_mate/presentation/screens/bottom_bar.dart';
import 'package:construction_mate/presentation/widgets/common/common_button.dart';
import 'package:construction_mate/presentation/widgets/common/common_text_form_field.dart';
import 'package:construction_mate/utilities/constants/common_assets.dart';
import 'package:construction_mate/utilities/extension/sized_box_extension.dart';
import 'package:construction_mate/utilities/extension/toast_extenstion.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setController();
  }

  setController() {
    final user = context.read<UserWatcherBloc>().state.profile;
    _emailController = TextEditingController(text: user?.email ?? "");
    _gstController = TextEditingController(text: user?.gSTNumber ?? "");
    _mobileNoController =
        TextEditingController(text: user?.mobile.toString() ?? "");
  }

  late TextEditingController _emailController;
  late TextEditingController _gstController;
  late TextEditingController _mobileNoController;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: appBarWidget(theme, context),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              BlocBuilder<EditProfileBloc, EditProfileState>(
                builder: (context, state) {
                  return Center(
                    child: Stack(
                      clipBehavior: Clip.none,
                      children: [
                        state.image == null
                            ? ClipRRect(
                                borderRadius: BorderRadius.circular(100),
                                child: state.imageUrl.isNotEmpty
                                    ? Image.network(
                                        state.imageUrl,
                                        height: 120,
                                        width: 120,
                                        fit: BoxFit.cover,
                                      )
                                    : Image.asset(
                                        Assets.images.user1.path,
                                        height: 120,
                                        width: 120,
                                        fit: BoxFit.cover,
                                      ))
                            : ClipRRect(
                                borderRadius: BorderRadius.circular(100),
                                child: state.image?.path == null
                                    ? Image.file(
                                        File(
                                          state.image?.path ?? '',
                                        ),
                                        height: 120,
                                        width: 120,
                                        fit: BoxFit.cover,
                                      )
                                    : Image.asset(
                                        Assets.images.user1.path,
                                        height: 120,
                                        width: 120,
                                        fit: BoxFit.cover,
                                      ),
                              ),
                        Positioned(
                            bottom: 5,
                            right: -2,
                            child: InkWell(
                              onTap: () async {
                                await selectProfile(
                                  context,
                                  isNumnber: 0,
                                  onCallBack: (file) {
                                    if (file != null) {
                                      context.read<EditProfileBloc>().add(
                                              EditProfileEvent
                                                  .onImageUrlChanged(
                                            imageUrl: file.path,
                                          ));

                                      context
                                          .read<EditProfileBloc>()
                                          .add(EditProfileEvent.onImageChanged(
                                            image: file,
                                          ));
                                    }
                                  },
                                );
                              },
                              child: Container(
                                padding: const EdgeInsets.all(6),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    border: Border.all(
                                        width: 2, color: Colors.white),
                                    color: purple),
                                child: const Icon(
                                  Icons.edit,
                                  size: 18,
                                  color: Colors.black,
                                ),
                              ),
                            ))
                      ],
                    ),
                  );
                },
              ),
              30.hx,
              CustomTextFormField(
                controller: _emailController,
                hintText: "Enter email",
                textInputAction: TextInputAction.next,
                textFieldType: TextFieldType.email,
                textInputType: TextInputType.emailAddress,
                alignLableWithHint: true,
                onChanged: (value) {
                  context
                      .read<EditProfileBloc>()
                      .add(EditProfileEvent.onEmailChanged(email: value));
                },
              ),
              CustomTextFormField(
                controller: _gstController,
                hintText: "Enter GST No.",
                maxLength: 15,
                textInputAction: TextInputAction.next,
                textInputType: TextInputType.number,
                alignLableWithHint: true,
                onChanged: (value) {
                  context
                      .read<EditProfileBloc>()
                      .add(EditProfileEvent.onGSTChanged(gstNo: value));
                },
              ),
              CustomTextFormField(
                controller: _mobileNoController,
                hintText: "Enter Mobile No.",
                maxLength: 10,
                textInputAction: TextInputAction.done,
                textInputType: TextInputType.phone,
                alignLableWithHint: true,
                onChanged: (value) {
                  context
                      .read<EditProfileBloc>()
                      .add(EditProfileEvent.onGSTChanged(gstNo: value));
                },
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16.0),
        child: BlocConsumer<EditProfileBloc, EditProfileState>(
          listener: (context, state) {
            // TODO: implement listener

            if (state.state.isLoaded) {
              const TopSnackBar(message: "Profile Updated");
            } else if (state.state.isError) {
              const TopSnackBar(message: "Something went wrong! Try again");
              const TopSnackBar(message: "Something went wrong!");
            }
          },
          builder: (context, state) {
            return CustomElevatedButton(
              onTap: () {
                context
                    .read<EditProfileBloc>()
                    .add(const EditProfileEvent.onUpdateProfileTap());
              },
              isLoading: state.state.isLoading,
              label: "Update",
            );
          },
        ),
      ),
    );
  }

  AppBar appBarWidget(ThemeData theme, BuildContext context) {
    return AppBar(
      centerTitle: true,
      title: Text(
        "Edit Profile",
        style: theme.textTheme.titleLarge,
      ),
      backgroundColor: theme.scaffoldBackgroundColor,
      leading: IconButton(
          onPressed: () {
            context.pop();
          },
          icon: Icon(
            Icons.arrow_back_ios_new,
            color: theme.canvasColor,
          )),
    );
  }
}

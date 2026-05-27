import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:route_smart/core/app/theme/my_colors.dart';
import 'package:route_smart/core/extensions/context_extensions.dart';
import 'package:route_smart/core/language/lang_keys.dart';
import 'package:route_smart/core/services/flutter_secure.dart';
import 'package:route_smart/core/services/shared_pref/shared_keys.dart';
import 'package:route_smart/core/di/di.dart';
import 'package:route_smart/features/profile/presention/manger/profile_bloc.dart';
import 'package:route_smart/features/profile/presention/manger/profile_event.dart';
import 'package:route_smart/features/profile/presention/manger/profile_state.dart';
import 'package:route_smart/features/profile/presention/refactor/profile_body.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  void initState() {
    super.initState();
    _fetchProfile();
  }

  Future<void> _fetchProfile() async {
    final userId =
        await sl<SecureStorage>().read(PrefKeys.userId) ?? '';
    if (!mounted) return;
    context.read<ProfileBloc>().add(
          ProfileFetchRequested(userId: userId),
        );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.colors.background,
      appBar: AppBar(
        title: Text(context.translate(LangKeys.profile)),
        backgroundColor: context.colors.background,
        elevation: 0,
        centerTitle: true,
      ),
      body: BlocBuilder<ProfileBloc, ProfileState>(
        builder: (context, state) {
          return switch (state) {
            ProfileInitial() || ProfileInProgress() => const Center(
                child: CircularProgressIndicator(),
              ),
            ProfileSuccess(:final user) => ProfileBody(user: user),
            ProfileFailure(:final message) => Center(
                child: Text(
                  message,
                  style: TextStyle(color: context.colors.primary),
                ),
              ),
          };
        },
      ),
    );
  }
}
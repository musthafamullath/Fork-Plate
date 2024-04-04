import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:foodie_fly/controller/api_sevices/profile/api_calling.dart';
import 'package:foodie_fly/model/profile.dart';
import 'package:foodie_fly/view/widgets/function_widgets/snackbar.dart';
import 'package:meta/meta.dart';

part 'profile_event.dart';
part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  ProfileBloc() : super(ProfileInitial()) {
    on<GetProfileEvent>((event, emit) async {
      final profile = await ProfileApiServices().getUserProfile();
      emit(ProfileState(profile: profile));
    });
    on<UpdateUserProfileEvent>((event, emit) async {
      final value = await ProfileApiServices().updateUser(event.profile);
      if (value) {
        showSnack(event.context, Colors.green, 'Updated profile successfully');
        final profile = await ProfileApiServices().getUserProfile();
        emit(ProfileState(profile: profile));
        Navigator.pop(event.context);
      } else {
        showSnack(event.context, Colors.red, 'This email is available.');
      }
    });
  }
}

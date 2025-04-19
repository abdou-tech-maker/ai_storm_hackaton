// ignore_for_file: library_prefixes

import 'package:ai_storm_hackaton/bloc/action/action_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

List<BlocProvider> getProvidersArray(BuildContext context) {
  return [
    BlocProvider<ActionCubit>(
      create: (BuildContext context) => ActionCubit(),
    ),
  ];
}

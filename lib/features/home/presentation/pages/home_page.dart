import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tutors/features/home/presentation/cubit/home_cubit.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: Text("Home"),
            actions: [
              TextButton(
                onPressed: () async {
                  await context.read<HomeCubit>().signOut();
                },
                child: Text("Sign out",style: TextStyle(color: Colors.white),),
              ),
            ],
          ),
        );
      },
    );
  }
}

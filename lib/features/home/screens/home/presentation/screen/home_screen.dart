import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reddit_challenge/config/app_theme.dart';
import 'package:reddit_challenge/core/constants.dart';
import 'package:reddit_challenge/features/home/screens/home/presentation/bloc/home_bloc.dart';
import 'package:reddit_challenge/features/home/screens/home/presentation/widgets/home_top_bar_widget.dart';
import 'package:reddit_challenge/features/home/screens/home/presentation/widgets/post_widget.dart';
import 'package:reddit_challenge/injection_container.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: mainAppPadding),
          child: Column(
            children: [
              const HomeTopBar(),
              BlocProvider(
                create: (context) => sl<HomeBloc>()..add(const GetHomeEvent()),
                child: BlocBuilder<HomeBloc, HomeState>(
                  builder: (context, state) {
                    final bloc = BlocProvider.of<HomeBloc>(context);

                    if (state is HomeLoading) {
                      return const Expanded(
                        child: Center(
                          child: CircularProgressIndicator(
                            color: orangeColor,
                          ),
                        ),
                      );
                    }
                    if (state is LoadedHomeState) {
                      return Expanded(
                        child: RefreshIndicator(
                          child: ListView.separated(
                            itemCount: bloc.products.length,
                            itemBuilder: (context, index) {
                              if (index ==
                                  bloc.products.length - bloc.nextPageTrigger) {
                                bloc.add(
                                    CheckIfNeedMoreDataEvent(index: index));
                              }
                              // return Text("a7a");
                              return index >= bloc.products.length
                                  ? const CircularProgressIndicator()
                                  : PostWidget(post: bloc.products[index]);
                            },
                            separatorBuilder: (context, index) {
                              return const Divider(
                                  height:
                                      1, // You can adjust the height of the line
                                  thickness:
                                      .1, // You can adjust the thickness of the line
                                  color: grayColor);
                            },
                          ),
                          onRefresh: () async {
                            // Add your refreshing logic here
                            await Future<void>.delayed(
                                const Duration(seconds: 2));
                            // After completing the refreshing logic, return a Future<void>
                          },
                          notificationPredicate:
                              (ScrollNotification notification) {
                            return notification.depth ==
                                0; // Change to 0 instead of 1
                          },
                        ),
                      );
                    }
                    return const SizedBox();
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

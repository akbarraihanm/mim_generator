import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mim_generator/core/config/app_color.dart';
import 'package:mim_generator/core/config/app_typography.dart';
import 'package:mim_generator/core/util/app_util.dart';
import 'package:mim_generator/core/util/stretch_overscroll.dart';
import 'package:mim_generator/core/widgets/app_text.dart';
import 'package:mim_generator/core/widgets/refresh_builder.dart';
import 'package:mim_generator/feature/main/di/di_object.dart';
import 'package:mim_generator/feature/main/grid/presentation/blocs/meme_bloc.dart';
import 'package:mim_generator/feature/main/grid/presentation/blocs/meme_event.dart';
import 'package:mim_generator/feature/main/grid/presentation/blocs/meme_state.dart';
import 'package:mim_generator/feature/main/grid/presentation/widgets/meme_grid_view.dart';

class MemeScreen extends StatefulWidget {
  static const routeName = "/meme-grid";

  const MemeScreen({Key? key}) : super(key: key);

  @override
  State<MemeScreen> createState() => _MemeScreenState();
}

class _MemeScreenState extends State<MemeScreen> {

  final _bloc = locator<MemeBloc>();

  @override
  void initState() {
    super.initState();
    _bloc.add(GetAll());
  }

  @override
  void dispose() {
    super.dispose();
    _bloc.close();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.biruGelap,
        title: AppText(
          title: "Mim Generator",
          textStyle: AppTypography.titleMedium(color: Colors.white),
        ),
      ),
      body: StretchOverScrollWidget(
        child: RefreshBuilder(
          refresh: () => _bloc.add(GetAll()),
          child: BlocBuilder<MemeBloc, MemeState>(
            bloc: _bloc,
            builder: (ctx, state) {
              return state.when(
                onInit: (state) => MemeGridView(list: _bloc.list),
                onError: (state) {
                  AppUtil.showError(context, message: state.message);
                  return Container(
                    color: Colors.red,
                  );
                },
                onLoading: (state) => Container(
                  height: 150,
                  width: double.infinity,
                  color: Colors.green,
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}

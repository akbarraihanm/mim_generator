import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mim_generator/core/common/navigation.dart';
import 'package:mim_generator/core/config/app_color.dart';
import 'package:mim_generator/core/config/app_typography.dart';
import 'package:mim_generator/core/const/app_string.dart';
import 'package:mim_generator/core/util/app_util.dart';
import 'package:mim_generator/core/util/stretch_overscroll.dart';
import 'package:mim_generator/core/widgets/app_form_field.dart';
import 'package:mim_generator/core/widgets/app_text.dart';
import 'package:mim_generator/feature/main/detail/param/meme_detail_param.dart';
import 'package:mim_generator/feature/main/detail/presentation/blocs/meme_detail_bloc.dart';
import 'package:mim_generator/feature/main/detail/presentation/blocs/meme_detail_event.dart';
import 'package:mim_generator/feature/main/detail/presentation/blocs/meme_detail_state.dart';
import 'package:mim_generator/feature/main/detail/presentation/widgets/draggable_image.dart';
import 'package:mim_generator/feature/main/detail/presentation/widgets/draggable_text.dart';
import 'package:mim_generator/feature/main/di/di_object.dart';
import 'package:mim_generator/feature/main/save_share/param/save_share_param.dart';
import 'package:mim_generator/feature/main/save_share/presentation/save_share_screen.dart';
import 'package:screenshot/screenshot.dart';

class MemeDetailScreen extends StatefulWidget {
  static const routeName = "/meme-detail";
  final MemeDetailParam param;

  const MemeDetailScreen({Key? key, required this.param}) : super(key: key);

  @override
  State<MemeDetailScreen> createState() => _MemeDetailScreenState();
}

class _MemeDetailScreenState extends State<MemeDetailScreen> {
  final _bloc = locator<MemeDetailBloc>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.biruGelap,
        title: AppText(
          title: AppString.name,
          textStyle: AppTypography.titleMedium(color: Colors.white),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: Screenshot(
              controller: _bloc.ssCtrl,
              child: Stack(
                children: [
                  StretchOverScrollWidget(
                    child: SizedBox(
                      height: double.infinity,
                      width: double.infinity,
                      child: SingleChildScrollView(
                        padding: const EdgeInsets.all(16),
                        child: Image.network(
                          widget.param.url,
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                  ),
                  BlocBuilder<MemeDetailBloc, MemeDetailState>(
                    bloc: _bloc,
                    builder: (BuildContext context, state) {
                      if (state is ShowError) {
                        AppUtil.showError(context, message: state.message);
                      }
                      return Visibility(
                        visible: _bloc.file != null,
                        child: Positioned(
                          left: _bloc.xImage,
                          top: _bloc.yImage,
                          child: DraggableImage(
                            file: _bloc.file ?? File(""),
                            drag: (x, y) => _bloc.add(DragImage(x, y)),
                          ),
                        ),
                      );
                    },
                  ),
                  BlocBuilder<MemeDetailBloc, MemeDetailState>(
                    bloc: _bloc,
                    builder: (BuildContext context, state) {
                      if (state is ShowError) {
                        AppUtil.showError(context, message: state.message);
                      }
                      return Visibility(
                        visible: _bloc.text != null,
                        child: Positioned(
                          left: _bloc.xText,
                          top: _bloc.yText,
                          child: DraggableText(
                            text: _bloc.text ?? "",
                            drag: (x, y) => _bloc.add(DragText(x, y)),
                          ),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _ColItem(
                  title: "Add Logo",
                  icon: Icons.image,
                  onTap: () => _bloc.add(OpenGallery()),
                ),
                _ColItem(
                  title: "Add Text",
                  icon: Icons.text_fields,
                  onTap: () => AppUtil.showBottomSheet(
                    context,
                    child: Scaffold(
                      backgroundColor: Colors.transparent,
                      body: AppFormField(
                        hint: "Input a text here",
                        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                        margin: const EdgeInsets.all(16),
                        borderColor: AppColor.biruGelap,
                        onSubmit: (v) {
                          AppNav.pop(context);
                          _bloc.add(InputText(v));
                        },
                      ),
                    )
                  ),
                ),
                BlocBuilder<MemeDetailBloc, MemeDetailState>(
                  bloc: _bloc,
                  builder: (ctx, state) {
                    if (state is ShowError) {
                      AppUtil.showError(context, message: state.message);
                    } else if (state is ScreenshotSuccess) {
                      AppUtil.bindingInstance(() {
                        AppNav.pushData(
                          context, routeName: SaveShareScreen.routeName,
                          arguments: SaveShareParam(state.ss, state.image),
                        );
                      });
                    }
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: InkWell(
                        onTap: () => _bloc.add(CaptureWidget()),
                        child: Icon(
                          Icons.check,
                          size: 30,
                          color: AppColor.biruGelap,
                        ),
                      ),
                    );
                  }
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class _ColItem extends StatelessWidget {
  final String title;
  final IconData icon;
  final Function onTap;

  const _ColItem({
    Key? key,
    required this.title,
    required this.icon,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onTap.call(),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            AppText(
              title: title,
              textStyle: AppTypography.action(color: AppColor.hitamPekat),
              margin: const EdgeInsets.only(bottom: 12),
            ),
            Icon(icon, size: 24, color: AppColor.hitamPekat),
          ],
        ),
      ),
    );
  }
}

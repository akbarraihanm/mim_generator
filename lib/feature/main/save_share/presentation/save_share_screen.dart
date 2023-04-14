import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:mim_generator/core/config/app_color.dart';
import 'package:mim_generator/core/config/app_typography.dart';
import 'package:mim_generator/core/const/app_string.dart';
import 'package:mim_generator/core/util/app_util.dart';
import 'package:mim_generator/core/widgets/app_button.dart';
import 'package:mim_generator/core/widgets/app_text.dart';
import 'package:mim_generator/feature/main/di/di_object.dart';
import 'package:mim_generator/feature/main/save_share/param/save_share_param.dart';
import 'package:mim_generator/feature/main/save_share/presentation/blocs/save_share_bloc.dart';
import 'package:mim_generator/feature/main/save_share/presentation/blocs/save_share_event.dart';
import 'package:mim_generator/feature/main/save_share/presentation/blocs/save_share_state.dart';
import 'package:share_plus/share_plus.dart';

class SaveShareScreen extends StatefulWidget {
  static const routeName = "/save-share";
  final SaveShareParam param;

  const SaveShareScreen({Key? key, required this.param}) : super(key: key);

  @override
  State<SaveShareScreen> createState() => _SaveShareScreenState();
}

class _SaveShareScreenState extends State<SaveShareScreen> {
  final _bloc = locator<SaveShareBloc>();

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
            child: SingleChildScrollView(
              child: Image.file(
                widget.param.file,
                width: double.infinity,
                fit: BoxFit.contain,
              ),
            ),
          ),
          Row(
            children: [
              Expanded(
                child: BlocBuilder<SaveShareBloc, SaveShareState>(
                  bloc: _bloc,
                  builder: (ctx, state) {
                    if (state is Success) {
                      AppUtil.bindingInstance(() => Navigator.popUntil(
                        context, (route) => route.isFirst,
                      ));
                      Fluttertoast.showToast(msg: state.message);
                    }
                    return AppButton(
                      title: "Save",
                      margin: const EdgeInsets.only(right: 8, left: 16),
                      color: AppColor.biruGelap,
                      onPressed: () => _bloc.add(Save(widget.param.file)),
                    );
                  }
                ),
              ),
              Expanded(
                child: AppButton(
                  title: "Share",
                  margin: const EdgeInsets.only(left: 8, right: 16),
                  color: AppColor.biruGelap,
                  onPressed: () {
                    Share.shareXFiles([XFile(widget.param.file.path)], text: 'Meme Gan');
                  },
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}

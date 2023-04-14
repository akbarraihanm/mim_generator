import 'package:flutter/material.dart';
import 'package:mim_generator/core/common/navigation.dart';
import 'package:mim_generator/feature/main/detail/param/meme_detail_param.dart';
import 'package:mim_generator/feature/main/detail/presentation/page/meme_detail_screen.dart';
import 'package:mim_generator/feature/main/grid/domain/entity/meme_entity.dart';

class MemeGridView extends StatelessWidget {
  final List<ContentMeme> list;
  
  const MemeGridView({Key? key, required this.list}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      itemCount: list.length,
      physics: const NeverScrollableScrollPhysics(),
      padding: const EdgeInsets.all(12),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        mainAxisSpacing: 12,
        crossAxisSpacing: 12,
      ),
      itemBuilder: (ctx, pos) => InkWell(
        onTap: () => AppNav.pushData(
          context, routeName: MemeDetailScreen.routeName,
          arguments: MemeDetailParam(list[pos].url ?? ""),
        ),
        child: Image.network(
          list[pos].url ?? "",
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

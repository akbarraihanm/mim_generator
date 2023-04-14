import 'package:mim_generator/core/network/http_helper.dart';
import 'package:mim_generator/core/network/url_helper.dart';
import 'package:mim_generator/feature/main/grid/data/models/meme_response.dart';

class MemeService extends HttpHelper {
  Future<MemeResponse> getAll() async {
    final map = await getMethod(URL.getMemes);
    return MemeResponse.fromJsonMap(map);
  }
}
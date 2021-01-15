import 'package:bienes_servicios/src/models/response.dart';
import 'package:bienes_servicios/src/repositories/graphql_config.dart';
import 'package:bienes_servicios/src/repositories/home/first_page/query.dart';

class FirstPageRepository {
  Future showAds(double lat, double lon, double km, int page, int limit) async {
    final Response result = await graphQLConfig.query(
        queryShowAds(lat, lon, km, page, limit), null);
    if (result.getToken != null) {
      GraphQLConfig.setToken();
    }
    return result;
  }
}

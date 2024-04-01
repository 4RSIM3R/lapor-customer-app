import 'package:injectable/injectable.dart';
import 'package:next_starter/common/base/base_dio_remote_source.dart';
import 'package:next_starter/common/utils/api_path.dart';
import 'package:next_starter/data/datasources/remote_datasources/site_remote/site_remote.dart';
import 'package:next_starter/data/models/site/site_detail_mode.dart';
import 'package:next_starter/data/models/site/site_model.dart';

@LazySingleton(as: SiteRemote)
class SiteRemoteImpl extends BaseDioRemoteSource implements SiteRemote {
  SiteRemoteImpl(super.dio, super.session);

  @override
  Future<List<SiteModel>> getAllSite() async {
    return networkRequest(
      isAuth: true,
      request: (dio) => dio.get(ApiPath.site),
      onResponse: (json) => (json['data']['data'] as List).map((e) => SiteModel.fromJson(e)).toList(),
    );
  }

  @override
  Future<SiteDetailModel> getDetailSite({required int id}) async {
    return networkRequest(
      isAuth: true,
      request: (dio) => dio.get('${ApiPath.siteDetail}/$id'),
      onResponse: (json) => SiteDetailModel.fromJson(json['data']),
    );
  }
}

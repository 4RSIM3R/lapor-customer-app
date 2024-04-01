import 'package:next_starter/data/models/site/site_detail_mode.dart';
import 'package:next_starter/data/models/site/site_model.dart';

abstract class SiteRemote {

  Future<List<SiteModel>> getAllSite();
  Future<SiteDetailModel> getDetailSite({required int id});
  
}
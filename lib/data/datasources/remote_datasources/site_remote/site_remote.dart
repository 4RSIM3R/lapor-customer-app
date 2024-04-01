import 'package:next_starter/data/models/site/site_model.dart';

abstract class SiteRemote {

  Future<List<SiteModel>> getAllSite();
  
}
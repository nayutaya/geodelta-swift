
public class Core {
}

/*
var core = {};

var projector = require("./projector.js");
var delta_geometry = require("./delta_geometry.js");
var encoder = require("./encoder.js");

// 緯度経度からデルタID列を取得する
core.getDeltaIds = function(lat, lng, level) {
  var nxy = projector.latLngToNxy(lat, lng);
  return delta_geometry.getDeltaIds(nxy.nx, nxy.ny, level);
};

// 緯度経度からGeoDeltaコードを取得する
core.getDeltaCode = function(lat, lng, level) {
  var ids = this.getDeltaIds(lat, lng, level);
  return encoder.encode(ids);
};

/*
module GeoDelta
  def self.get_center_from_delta_ids(ids)
    nx, ny = GeoDelta::DeltaGeometry.get_center(ids)
    return GeoDelta::Projector.nxy_to_latlng(nx, ny)
  end

  def self.get_center_from_delta_code(code)
    ids = GeoDelta::Encoder.decode(code)
    return self.get_center_from_delta_ids(ids)
  end

  def self.get_coordinates_from_ids(ids)
    return GeoDelta::DeltaGeometry.get_coordinates(ids).
      map { |nx, ny| GeoDelta::Projector.nxy_to_latlng(nx, ny) }
  end

  def self.get_coordinates_from_code(code)
    ids = GeoDelta::Encoder.decode(code)
    return self.get_coordinates_from_ids(ids)
  end
end
*/

module.exports = core;
*/

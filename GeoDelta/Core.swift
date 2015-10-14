
public class Core {
    // 緯度経度からデルタID列を取得する
    public static func getDeltaIds(lat: Double, _ lng: Double, _ level: UInt8) -> [UInt8] {
        let nxny = Projector.latLngToNxNy(lat: lat, lng: lng)
        return DeltaGeometry.getDeltaIds(nxny.nx, nxny.ny, level)
    }
}

/*
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

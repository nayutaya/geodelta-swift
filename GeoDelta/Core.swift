
public class Core {
    // 緯度経度からデルタID列を取得する
    public static func getDeltaIds(lat lat: Double, lng: Double, level: UInt8) -> [UInt8] {
        let nxny = Projector.latLngToNxNy(lat: lat, lng: lng)
        return DeltaGeometry.getDeltaIds(nxny.nx, nxny.ny, level)
    }

    // 緯度経度からGeoDeltaコードを取得する
    public static func getDeltaCode(lat lat: Double, lng: Double, level: UInt8) -> String {
        let ids = Core.getDeltaIds(lat: lat, lng: lng, level: level)
        return try! Encoder.encode(ids)
    }
}

/*
module GeoDelta
  def getCenterFromDeltaIds(ids)
    nx, ny = GeoDelta::DeltaGeometry.get_center(ids)
    return GeoDelta::Projector.nxy_to_latlng(nx, ny)
  end

  def getCenterFromDeltaCode(code)
    ids = GeoDelta::Encoder.decode(code)
    return self.get_center_from_delta_ids(ids)
  end

  def getCoordinatesFromIds(ids)
    return GeoDelta::DeltaGeometry.get_coordinates(ids).
      map { |nx, ny| GeoDelta::Projector.nxy_to_latlng(nx, ny) }
  end

  def getCoordinatesFromCode(code)
    ids = GeoDelta::Encoder.decode(code)
    return self.get_coordinates_from_ids(ids)
  end
end
*/

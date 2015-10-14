
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

    // デルタID列から中心座標を取得する
    public static func getCenterFromDeltaIds(ids: [UInt8]) -> (lat: Double, lng: Double) {
        let nxny = DeltaGeometry.getCenter(ids)
        return Projector.nxNyToLatLng(nx: nxny.x, ny: nxny.y)
    }
    
    // GeoDeltaコードから中心座標を取得する
    public static func getCenterFromDeltaCode(code: String) -> (lat: Double, lng: Double) {
        let ids = try! Encoder.decode(code)
        return Core.getCenterFromDeltaIds(ids)
    }
}

/*
module GeoDelta
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

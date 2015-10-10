
import WebMercator

public class Projector {
    // 一辺を1.0とする正三角形の高さ
    public static let DELTA_HEIGHT = sqrt(0.75)

    // 緯度をメルカトルY座標に変換する
    public static func latToMy(lat: Double) -> Double {
        return WebMercator.Projector.latitudeToMercatorY(lat)
    }
    
    // 経度をメルカトルX座標に変換する
    public static func lngToMx(lng: Double) -> Double {
        return WebMercator.Projector.longitudeToMercatorX(lng)
    }
    
    // メルカトルY座標を緯度に変換する
    public static func myToLat(my: Double) -> Double {
        return WebMercator.Projector.mercatorYToLatitude(my)
    }
    
    // メルカトルX座標を経度に変換する
    public static func mxToLng(mx: Double) -> Double {
        return WebMercator.Projector.mercatorXToLongitude(mx)
    }
    
    // メルカトルY座標を正規化Y座標に変換する
    public static func myToNy(my: Double) -> Double {
        return my / DELTA_HEIGHT * 12.0
    }
    
    // メルカトルX座標を正規化X座標に変換する
    public static func mxToNx(mx: Double) -> Double {
        return mx * 12.0
    }
    
    // 正規化Y座標をメルカトルY座標に変換する
    public static func nyToMy(ny: Double) -> Double {
        return ny / 12.0 * DELTA_HEIGHT
    }
    
    // 正規化X座標をメルカトルX座標に変換する
    public static func nxToMx(nx: Double) -> Double {
        return nx / 12.0
    }
    
    // 緯度を正規化Y座標に変換する
    public static func latToNy(lat: Double) -> Double {
        return myToNy(latToMy(lat))
    }
    
    // 経度を正規化X座標に変換する
    public static func lngToNx(lng: Double) -> Double {
        return mxToNx(lngToMx(lng))
    }
    
    // 正規化Y座標を緯度に変換する
    public static func nyToLat(ny: Double) -> Double {
        return myToLat(nyToMy(ny))
    }
    
    // 正規化X座標を経度に変換する
    public static func nxToLng(nx: Double) -> Double {
        return mxToLng(nxToMx(nx))
    }
    
    // 緯度経度を正規化XY座標に変換する
    public static func latLngToNxy(lat lat: Double, lng: Double) -> (nx: Double, ny: Double) {
        return (lngToNx(lng), latToNy(lat))
    }
}

/*

// 正規化XY座標を緯度経度に変換する
projector.nxyToLatLng = function(nx, ny) {
  return {
    lat: projector.nyToLat(ny),
    lng: projector.nxToLng(nx)
  };
};

module.exports = projector;
*/

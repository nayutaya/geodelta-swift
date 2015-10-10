
import WebMercator

public class Projector {
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
}

/*
// 一辺を1.0とする正三角形の高さ
var DELTA_HEIGHT = Math.sqrt(0.75);
projector.DELTA_HEIGHT = function() { return DELTA_HEIGHT; };

// メルカトルY座標を正規化Y座標に変換する
projector.myToNy = function(my) {
  return my / DELTA_HEIGHT * 12.0;
};

// メルカトルX座標を正規化X座標に変換する
projector.mxToNx = function(mx) {
  return mx * 12.0;
};

// 正規化Y座標をメルカトルY座標に変換する
projector.nyToMy = function(ny) {
  return ny / 12.0 * DELTA_HEIGHT;
};

// 正規化X座標をメルカトルX座標に変換する
projector.nxToMx = function(nx) {
  return nx / 12.0;
};

// 緯度を正規化Y座標に変換する
projector.latToNy = function(lat) {
  return projector.myToNy(projector.latToMy(lat));
};

// 経度を正規化X座標に変換する
projector.lngToNx = function(lng) {
  return projector.mxToNx(projector.lngToMx(lng));
};

// 正規化Y座標を緯度に変換する
projector.nyToLat = function(ny) {
  return projector.myToLat(projector.nyToMy(ny));
};

// 正規化X座標を経度に変換する
projector.nxToLng = function(nx) {
  return projector.mxToLng(projector.nxToMx(nx));
};

// 緯度経度を正規化XY座標に変換する
projector.latLngToNxy = function(lat, lng) {
  return {
    nx: projector.lngToNx(lng),
    ny: projector.latToNy(lat)
  };
};

// 正規化XY座標を緯度経度に変換する
projector.nxyToLatLng = function(nx, ny) {
  return {
    lat: projector.nyToLat(ny),
    lng: projector.nxToLng(nx)
  };
};

module.exports = projector;
*/

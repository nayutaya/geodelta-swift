
public class DeltaGeometry {
    private static func mod(a: Double, _ b: Double) -> Double {
        var val = a
        while ( val >= b ) { val -= b }
        while ( val < 0.0 ) {  val += b }
        return val
    }

    // 座標をワールドデルタIDに変換する
    public static func getWorldDeltaId(x: Double, _ y: Double) -> UInt8 {
        let xx = DeltaGeometry.mod(x, 24.0)
        let yy = abs(y)
        let base: UInt8 = (y >= 0.0 ? 0 : 4)
        if      yy >= +2.0 * (xx -  0.0) { return base + 0 }
        else if yy <= -2.0 * (xx - 12.0) { return base + 1 }
        else if yy >= +2.0 * (xx - 12.0) { return base + 2 }
        else if yy <= -2.0 * (xx - 24.0) { return base + 3 }
        return base
    }
    
    // 座標を上向きのサブデルタIDに変換する
    public static func getUpperDeltaId(x: Double, _ y: Double) -> UInt8 {
        if      y < -2.0 * (x - 6.0) { return 3 }
        else if y < +2.0 * (x - 6.0) { return 2 }
        else if y > 6.0              { return 1 }
        else                         { return 0 }
    }
    
    // 座標を下向きのサブデルタIDに変換する
    public static func getLowerDeltaId(x: Double, _ y: Double) -> UInt8 {
        if      y > -2.0 * (x - 12.0) { return 3 }
        else if y > +2.0 * x          { return 2 }
        else if y < 6.0               { return 1 }
        else                          { return 0 }
    }
    
    // 指定されたワールドデルタIDが上向きかどうか判定する
    public static func isUpperWorldDelta(id: UInt8) -> Bool {
        return (id % 2 == (id < 4 ? 1 : 0))
    }
    
    // 指定されたサブデルタIDが上向きかどうか判定する
    public static func isUpperSubDelta(parentIsUpper: Bool, _ id: UInt8) -> Bool {
        return (parentIsUpper ? (id != 0) : (id == 0))
    }
    
    // 指定されたデルタID列が上向きかどうか判定する
    public static func isUpperDelta(ids: [UInt8]) -> Bool {
        var upper = false
        let length = ids.count
        for var i = 0; i < length; i++ {
            if i == 0 {
                upper = isUpperWorldDelta(ids[i])
            } else {
                upper = isUpperSubDelta(upper, ids[i])
            }
        }
        return upper
    }
    
    // 指定された座標を指定されたワールドデルタID内における正規化座標系に平行移動する
    public static func transformWorldDelta(id: UInt8, _ x: Double, _ y: Double) -> (x: Double, y: Double) {
        let xs = [+6.0, +0.0, -6.0, -12.0,  +6.0,  +0.0,  -6.0, -12.0]
        let ys = [+0.0, +0.0, +0.0,  +0.0, +12.0, +12.0, +12.0, +12.0]
        let xx = DeltaGeometry.mod((x + xs[Int(id)]), 12.0)
        let yy = DeltaGeometry.mod((y + ys[Int(id)]), 12.0)
        return (xx, yy)
    }
    
    // 指定された座標を指定された上向きのサブデルタID内における正規化座標系に平行移動する
    public static func transformUpperDelta(id: UInt8, _ x: Double, _ y: Double) -> (x: Double, y: Double) {
        let xs = [-3.0, -3.0, -6.0, -0.0]
        let ys = [-0.0, -6.0, -0.0, -0.0]
        let xx = (x + xs[Int(id)]) * 2
        let yy = (y + ys[Int(id)]) * 2
        return (xx, yy)
    }
    
    // 指定された座標を指定された下向きのサブデルタID内における正規化座標系に平行移動する
    public static func transformLowerDelta(id: UInt8, _ x: Double, _ y: Double) -> (x: Double, y: Double) {
        let xs = [-3.0, -3.0, -0.0, -6.0]
        let ys = [-6.0, -0.0, -6.0, -6.0]
        let xx = (x + xs[Int(id)]) * 2
        let yy = (y + ys[Int(id)]) * 2
        return (xx, yy)
    }
    
    // FIXME: メソッド名を「getDeltaId」に変更する
    // 指定された座標を指定されたレベルのデルタID列に変換する
    public static func getDeltaIds(x: Double, _ y: Double, _ level: UInt8) -> [UInt8] {
        var ids: [UInt8] = [UInt8](count: Int(level), repeatedValue: 0)
        ids[0] = getWorldDeltaId(x, y)
        var xxyy = transformWorldDelta(ids[0], x, y)
        var upper = isUpperWorldDelta(ids[0])

        for var i = 1; i < Int(level); i++ {
            ids[i] = (upper ? getUpperDeltaId(xxyy.x, xxyy.y) : getLowerDeltaId(xxyy.x, xxyy.y))
            xxyy = (upper ? transformUpperDelta(ids[i], xxyy.x, xxyy.y) : transformLowerDelta(ids[i], xxyy.x, xxyy.y))
            upper = isUpperSubDelta(upper, ids[i])
        }
        
        return ids;
    }
    
    // 指定されたワールドデルタIDの中心座標を取得する
    public static func getWorldDeltaCenter(id: UInt8) -> (x: Double, y: Double) {
        let xs = [+0.0, +6.0, +12.0, +18.0, +0.0, +6.0, +12.0, +18.0]
        let ys = [+8.0, +4.0, +8.0, +4.0, -8.0, -4.0, -8.0, -4.0]
        let x = xs[Int(id)]
        let y = ys[Int(id)]
        return (x, y)
    }
    
    // 指定されたサブデルタIDの上向き上位デルタからの距離を取得する
    public static func getUpperSubDeltaDistance(id: UInt8) -> (x: Double, y: Double) {
        let xs = [+0.0, +0.0, +3.0, -3.0]
        let ys = [+0.0, +4.0, -2.0, -2.0]
        let dx = xs[Int(id)]
        let dy = ys[Int(id)]
        return (dx, dy)
    }
    
    // 指定されたサブデルタIDの下向き上位デルタからの距離を取得する
    public static func getLowerSubDeltaDistance(id: UInt8) -> (x: Double, y: Double) {
        let xs = [+0.0, +0.0, -3.0, +3.0]
        let ys = [+0.0, -4.0, +2.0, +2.0]
        let dx = xs[Int(id)]
        let dy = ys[Int(id)]
        return (dx, dy)
    }
}

/*

// 指定されたサブデルタIDの上位デルタからの距離を取得する
delta_geometry.getSubDeltaDistance = function(parentIsUpper, id) {
  return (parentIsUpper ? this.getUpperSubDeltaDistance(id) : this.getLowerSubDeltaDistance(id));
};

// FIXME: メソッド名を「getDeltaCenter」に変更する
// デルタID列から中心座標を取得する
delta_geometry.getCenter = function(ids) {
  var xs = [];
  var ys = [];
  var xy = undefined;
  var upper = false;

  for ( var i = 0, len = ids.length; i < len; i++ )
  {
    if ( i == 0 ) {
      xy = this.getWorldDeltaCenter(ids[0]);
      upper = this.isUpperWorldDelta(ids[0]);
      xs.push(xy[0]);
      ys.push(xy[1]);
    } else {
      xy = this.getSubDeltaDistance(upper, ids[i]);
      upper = this.isUpperSubDelta(upper, ids[i]);
      xs.push(xy[0] / Math.pow(2, (i - 1)));
      ys.push(xy[1] / Math.pow(2, (i - 1)));
    }
  }

  var sort = function(array) { array.sort(function(a, b) { return a - b;}); };
  var sum = function(array) {
    var total = 0.0;
    for ( var i = 0, len = array.length; i < len; i++ ) {
      total += array[i];
    }
    return total;
  };

  sort(xs);
  sort(ys);

  var x = sum(xs);
  var y = sum(ys);
  return [(x > 12.0 ? x - 24.0 : x), y];
};

// FIXME: メソッド名を「getDeltaCoordinates」に変更する
// FIXME: 返り値を一次元配列に変更する
// デルタID列からデルタの中心座標、頂点座標を取得する
delta_geometry.getCoordinates = function(ids) {
  var cxy = this.getCenter(ids);
  var level = ids.length;
  var sign = (this.isUpperDelta(ids) ? +1 : -1);
  var scale = 1.0 / Math.pow(2, level - 1) * sign;

  var dx1 = 0.0;
  var dy1 = 8.0 * scale;
  var dx2 = 6.0 * scale;
  var dy2 = 4.0 * scale;

  return [
    [cxy[0], cxy[1]],
    [cxy[0] + dx1, cxy[1] + dy1],
    [cxy[0] + dx2, cxy[1] - dy2],
    [cxy[0] - dx2, cxy[1] - dy2],
  ];
};

module.exports = delta_geometry;
*/

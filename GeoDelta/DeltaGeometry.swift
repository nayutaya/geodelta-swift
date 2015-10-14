
public class DeltaGeometry {
    // 座標をワールドデルタIDに変換する
    public static func getWorldDeltaId(x: Double, _ y: Double) -> UInt8 {
        let mod = { (a: Double, b: Double) -> Double in
            var val = a
            while ( val >= b ) { val -= b }
            while ( val < 0.0 ) {  val += b }
            return val
        }
        let xx = mod(x, 24.0)
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
}

/*

// 座標を下向きのサブデルタIDに変換する
delta_geometry.getLowerDeltaId = function(x, y) {
  if ( y > -2.0 * (x - 12.0) ) {
    return 3;
  } else if ( y > +2.0 * x ) {
    return 2;
  } else if ( y < 6.0 ) {
    return 1;
  }
  return 0;
};

// 指定されたワールドデルタIDが上向きかどうか判定する
delta_geometry.isUpperWorldDelta = function(id) {
  return (id % 2 == (id < 4 ? 1 : 0));
};

// 指定されたサブデルタIDが上向きかどうか判定する
delta_geometry.isUpperSubDelta = function(parentIsUpper, id) {
  return (parentIsUpper ? (id != 0) : (id == 0));
};

// 指定されたデルタID列が上向きかどうか判定する
delta_geometry.isUpperDelta = function(ids) {
  var upper = false;
  for ( var i = 0, len = ids.length; i < len; i++ ) {
    if ( i == 0 ) {
      upper = this.isUpperWorldDelta(ids[i]);
    } else {
      upper = this.isUpperSubDelta(upper, ids[i]);
    }
  }
  return upper;
};

// 指定された座標を指定されたワールドデルタID内における正規化座標系に平行移動する
delta_geometry.transformWorldDelta = function(id, x, y) {
  var xs = [+6.0, +0.0, -6.0, -12.0, +6.0, +0.0, -6.0, -12.0];
  var ys = [+0.0, +0.0, +0.0, +0.0, +12.0, +12.0, +12.0, +12.0];
  var xx = math.mod((x + xs[id]), 12.0);
  var yy = math.mod((y + ys[id]), 12.0);
  return [xx, yy];
};

// 指定された座標を指定された上向きのサブデルタID内における正規化座標系に平行移動する
delta_geometry.transformUpperDelta = function(id, x, y) {
  var xs = [-3.0, -3.0, -6.0, -0.0];
  var ys = [-0.0, -6.0, -0.0, -0.0];
  var xx = (x + xs[id]) * 2;
  var yy = (y + ys[id]) * 2;
  return [xx, yy];
};

// 指定された座標を指定された下向きのサブデルタID内における正規化座標系に平行移動する
delta_geometry.transformLowerDelta = function(id, x, y) {
  var xs = [-3.0, -3.0, -0.0, -6.0];
  var ys = [-6.0, -0.0, -6.0, -6.0];
  var xx = (x + xs[id]) * 2;
  var yy = (y + ys[id]) * 2;
  return [xx, yy];
};

// FIXME: メソッド名を「getDeltaId」に変更する
// 指定された座標を指定されたレベルのデルタID列に変換する
delta_geometry.getDeltaIds = function(x, y, level) {
  var ids = [];
  ids[0] = this.getWorldDeltaId(x, y);
  var xxyy = this.transformWorldDelta(ids[0], x, y);
  var upper = this.isUpperWorldDelta(ids[0]);

  for ( var i = 1; i < level; i++ ) {
    ids[i] = (upper ? this.getUpperDeltaId(xxyy[0], xxyy[1]) : this.getLowerDeltaId(xxyy[0], xxyy[1]));
    xxyy = (upper ? this.transformUpperDelta(ids[i], xxyy[0], xxyy[1]) : this.transformLowerDelta(ids[i], xxyy[0], xxyy[1]));
    upper = this.isUpperSubDelta(upper, ids[i]);
  }

  return ids;
};

// 指定されたワールドデルタIDの中心座標を取得する
delta_geometry.getWorldDeltaCenter = function(id) {
  var xs = [+0.0, +6.0, +12.0, +18.0, +0.0, +6.0, +12.0, +18.0];
  var ys = [+8.0, +4.0, +8.0, +4.0, -8.0, -4.0, -8.0, -4.0];
  var x = xs[id];
  var y = ys[id];
  return [x, y];
};

// 指定されたサブデルタIDの上向き上位デルタからの距離を取得する
delta_geometry.getUpperSubDeltaDistance = function(id) {
  var xs = [+0.0, +0.0, +3.0, -3.0];
  var ys = [+0.0, +4.0, -2.0, -2.0];
  var dx = xs[id];
  var dy = ys[id];
  return [dx, dy];
};

// 指定されたサブデルタIDの下向き上位デルタからの距離を取得する
delta_geometry.getLowerSubDeltaDistance = function(id) {
  var xs = [+0.0, +0.0, -3.0, +3.0];
  var ys = [+0.0, -4.0, +2.0, +2.0];
  var dx = xs[id];
  var dy = ys[id];
  return [dx, dy];
};

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

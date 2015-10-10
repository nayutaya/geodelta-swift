
import Quick
import Nimble
@testable import GeoDelta

class ProjectorSpec : QuickSpec {
    override func spec() {
        describe("") {
            it("") {
            }
        }
    }
}

/*
describe("projector", function() {
  var assertRoughlyEquals = function(expected, actual, delta) {
    assert(Math.abs(expected - actual) < delta);
  };

  describe(".latToMy", function() {
    it("緯度をメルカトルY座標に変換する", function() {
      assertRoughlyEquals(+1.0, projector.latToMy(+85.0511), 1e-05);
      assertRoughlyEquals( 0.0, projector.latToMy(  0.0000), 1e-05);
      assertRoughlyEquals(-1.0, projector.latToMy(-85.0511), 1e-05);
    });
  });

  describe(".lngToMx", function() {
    it("経度をメルカトルX座標に変換する", function() {
      assertRoughlyEquals(+1.0, projector.lngToMx(+180.0), 1e-05);
      assertRoughlyEquals(+0.5, projector.lngToMx( +90.0), 1e-05);
      assertRoughlyEquals( 0.0, projector.lngToMx(   0.0), 1e-05);
      assertRoughlyEquals(-0.5, projector.lngToMx( -90.0), 1e-05);
      assertRoughlyEquals(-1.0, projector.lngToMx(-180.0), 1e-05);
    });
  });

  describe(".myToLat", function() {
    it("メルカトルY座標を緯度に変換する", function() {
      assertRoughlyEquals(+85.0511, projector.myToLat(+1.0), 1e-04);
      assertRoughlyEquals(  0.0,    projector.myToLat( 0.0), 1e-15);
      assertRoughlyEquals(-85.0511, projector.myToLat(-1.0), 1e-04);
    });
  });

  describe(".mxToLng", function() {
    it("メルカトルX座標を経度に変換する", function() {
      assertRoughlyEquals( -90.0, projector.mxToLng(+1.5), 1e-15);
      assertRoughlyEquals(-180.0, projector.mxToLng(+1.0), 1e-15);
      assertRoughlyEquals( +90.0, projector.mxToLng(+0.5), 1e-15);
      assertRoughlyEquals(   0.0, projector.mxToLng( 0.0), 1e-15);
      assertRoughlyEquals( -90.0, projector.mxToLng(-0.5), 1e-15);
      assertRoughlyEquals(-180.0, projector.mxToLng(-1.0), 1e-15);
      assertRoughlyEquals( +90.0, projector.mxToLng(-1.5), 1e-15);
    });
  });

  describe(".myToNy", function() {
    it("メルカトルY座標を正規化Y座標に変換する", function() {
      var max = projector.DELTA_HEIGHT();
      assertRoughlyEquals(+12.0, projector.myToNy(+max), 1e-15);
      assertRoughlyEquals(  0.0, projector.myToNy( 0.0), 1e-15);
      assertRoughlyEquals(-12.0, projector.myToNy(-max), 1e-15);
    });
  });

  describe(".mxToNx", function() {
    it("メルカトルX座標を正規化X座標に変換する", function() {
      assertRoughlyEquals(+12.0, projector.mxToNx(+1.0), 1e-15);
      assertRoughlyEquals(  0.0, projector.mxToNx( 0.0), 1e-15);
      assertRoughlyEquals(-12.0, projector.mxToNx(-1.0), 1e-15);
    });
  });

  describe(".nyToMy", function() {
    it("正規化Y座標をメルカトルY座標に変換する", function() {
      var max = projector.DELTA_HEIGHT();
      assertRoughlyEquals(+max, projector.nyToMy(+12.0), 1e-15);
      assertRoughlyEquals( 0.0, projector.nyToMy(  0.0), 1e-15);
      assertRoughlyEquals(-max, projector.nyToMy(-12.0), 1e-15);
    });
  });

  describe(".nxToMx", function() {
    it("正規化X座標をメルカトルX座標に変換する", function() {
      assertRoughlyEquals(+1.0, projector.nxToMx(+12.0), 1e-15);
      assertRoughlyEquals( 0.0, projector.nxToMx(  0.0), 1e-15);
      assertRoughlyEquals(-1.0, projector.nxToMx(-12.0), 1e-15);
    });
  });

  describe(".latToNy", function() {
    it("緯度を正規化Y座標に変換する", function() {
      assertRoughlyEquals(projector.myToNy(projector.latToMy(+82.4674)), projector.latToNy(+82.4674), 1e-15);
      assertRoughlyEquals(                                          0.0, projector.latToNy(  0.0   ), 1e-15);
      assertRoughlyEquals(projector.myToNy(projector.latToMy(-82.4674)), projector.latToNy(-82.4674), 1e-15);
    });
  });

  describe(".lngToNx", function() {
    it("経度を正規化X座標に変換する", function() {
      assertRoughlyEquals(projector.mxToNx(projector.lngToMx(+180.0)), projector.lngToNx(+180.0), 1e-15);
      assertRoughlyEquals(                                        0.0, projector.lngToNx(   0.0), 1e-15);
      assertRoughlyEquals(projector.mxToNx(projector.lngToMx(-180.0)), projector.lngToNx(-180.0), 1e-15);
    });
  });

  describe(".nyToLat", function() {
    it("正規化Y座標を緯度に変換する", function() {
      assertRoughlyEquals(projector.myToLat(projector.nyToMy(+12.0)), projector.nyToLat(+12.0), 1e-15);
      assertRoughlyEquals(                                       0.0, projector.nyToLat(  0.0), 1e-15);
      assertRoughlyEquals(projector.myToLat(projector.nyToMy(-12.0)), projector.nyToLat(-12.0), 1e-15);
    });
  });

  describe(".nxToMx", function() {
    it("正規化X座標を経度に変換する", function() {
      assertRoughlyEquals(projector.mxToLng(projector.nxToMx(+12.0)), projector.nxToLng(+12.0), 1e-15);
      assertRoughlyEquals(                                       0.0, projector.nxToLng(  0.0), 1e-15);
      assertRoughlyEquals(projector.mxToLng(projector.nxToMx(-12.0)), projector.nxToLng(-12.0), 1e-15);
    });
  });

  describe(".latLngToNxy", function() {
    it("緯度経度を正規化XY座標に変換する", function() {
      assertRoughlyEquals(projector.lngToNx(+180.0000), projector.latLngToNxy(+82.4674, +180.0).nx, 1e-15);
      assertRoughlyEquals(projector.latToNy( +82.4674), projector.latLngToNxy(+82.4674, +180.0).ny, 1e-15);
      assertRoughlyEquals(0.0, projector.latLngToNxy(0.0, 0.0).nx, 1e-15);
      assertRoughlyEquals(0.0, projector.latLngToNxy(0.0, 0.0).ny, 1e-15);
      assertRoughlyEquals(projector.lngToNx(-180.0000), projector.latLngToNxy(-82.4674, -180.0).nx, 1e-15);
      assertRoughlyEquals(projector.latToNy( -82.4674), projector.latLngToNxy(-82.4674, -180.0).ny, 1e-15);
    });
  });

  describe(".nxyToLatLng", function() {
    it("正規化XY座標を緯度経度に変換する", function() {
      assertRoughlyEquals(projector.nyToLat(+12.0), projector.nxyToLatLng(+12.0, +12.0).lat, 1e-15);
      assertRoughlyEquals(projector.nxToLng(+12.0), projector.nxyToLatLng(+12.0, +12.0).lng, 1e-15);
      assertRoughlyEquals(0.0, projector.nxyToLatLng(0.0, 0.0).lat, 1e-15);
      assertRoughlyEquals(0.0, projector.nxyToLatLng(0.0, 0.0).lng, 1e-15);
      assertRoughlyEquals(projector.nyToLat(-12.0), projector.nxyToLatLng(-12.0, -12.0).lat, 1e-15);
      assertRoughlyEquals(projector.nxToLng(-12.0), projector.nxyToLatLng(-12.0, -12.0).lng, 1e-15);
    });
  });

TODO: function test_randomLatLngAndNxy()
{
  final double latMax = geodelta.projector.nyToLat(+12.0);
  final double lngMax = 180.0;
  final Random r = new Random();
  for ( int i = 0; i < 1000; i++ )
  {
    final double lat1 = r.nextDouble() * latMax * 2 - latMax;
    final double lng1 = r.nextDouble() * lngMax * 2 - lngMax;
    final double nx = geodelta.projector.lngToNx(lng1);
    final double ny = geodelta.projector.latToNy(lat1);
    final double lat2 = geodelta.projector.nyToLat(ny);
    final double lng2 = geodelta.projector.nxToLng(nx);
    assertRoughlyEquals(lat1, lat2, 1E-13);
    assertRoughlyEquals(lng1, lng2, 1E-13);
  }
}

});
*/

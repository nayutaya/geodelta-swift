
import Quick
import Nimble
@testable import GeoDelta

class ProjectorSpec : QuickSpec {
    override func spec() {
        describe(".latToMy") {
            it("緯度をメルカトルY座標に変換する") {
                expect(Projector.latToMy(+85.05112)).to(beCloseTo(+1.0, within: 1e-5))
                expect(Projector.latToMy(  0.00000)).to(beCloseTo( 0.0, within: 1e-5))
                expect(Projector.latToMy(-85.05112)).to(beCloseTo(-1.0, within: 1e-5))
            }
        }

        describe(".lngToMx") {
            it("経度をメルカトルX座標に変換する") {
                expect(Projector.lngToMx(+180.0)).to(beCloseTo(+1.0, within: 1e-5))
                expect(Projector.lngToMx( +90.0)).to(beCloseTo(+0.5, within: 1e-5))
                expect(Projector.lngToMx(   0.0)).to(beCloseTo( 0.0, within: 1e-5))
                expect(Projector.lngToMx( -90.0)).to(beCloseTo(-0.5, within: 1e-5))
                expect(Projector.lngToMx(-180.0)).to(beCloseTo(-1.0, within: 1e-5))
            }
        }

        describe(".myToLat") {
            it("メルカトルY座標を緯度に変換する") {
                expect(Projector.myToLat(+1.0)).to(beCloseTo(+85.05112, within: 1e-5))
                expect(Projector.myToLat( 0.0)).to(beCloseTo(  0.00000, within: 1e-15))
                expect(Projector.myToLat(-1.0)).to(beCloseTo(-85.05112, within: 1e-5))
            }
        }

        describe(".mxToLng") {
            it("メルカトルX座標を経度に変換する") {
                expect(Projector.mxToLng(+1.5)).to(beCloseTo( -90.0, within: 1e-15))
                expect(Projector.mxToLng(+1.0)).to(beCloseTo(+180.0, within: 1e-15))
                expect(Projector.mxToLng(+0.5)).to(beCloseTo( +90.0, within: 1e-15))
                expect(Projector.mxToLng( 0.0)).to(beCloseTo(   0.0, within: 1e-15))
                expect(Projector.mxToLng(-0.5)).to(beCloseTo( -90.0, within: 1e-15))
                expect(Projector.mxToLng(-1.0)).to(beCloseTo(-180.0, within: 1e-15))
                expect(Projector.mxToLng(-1.5)).to(beCloseTo( +90.0, within: 1e-15))
            }
        }

        describe(".myToNy") {
            it("メルカトルY座標を正規化Y座標に変換する") {
                let max = Projector.DELTA_HEIGHT
                expect(Projector.myToNy(+max)).to(beCloseTo(+12.0, within: 1e-15))
                expect(Projector.myToNy( 0.0)).to(beCloseTo(  0.0, within: 1e-15))
                expect(Projector.myToNy(-max)).to(beCloseTo(-12.0, within: 1e-15))
            }
        }

        describe(".mxToNx") {
            it("メルカトルX座標を正規化X座標に変換する") {
                expect(Projector.mxToNx(+1.0)).to(beCloseTo(+12.0, within: 1e-15))
                expect(Projector.mxToNx( 0.0)).to(beCloseTo(  0.0, within: 1e-15))
                expect(Projector.mxToNx(-1.0)).to(beCloseTo(-12.0, within: 1e-15))
            }
        }

        describe(".nyToMy") {
            it("正規化Y座標をメルカトルY座標に変換する") {
                let max = Projector.DELTA_HEIGHT
                expect(Projector.nyToMy(+12.0)).to(beCloseTo(+max, within: 1e-15))
                expect(Projector.nyToMy(  0.0)).to(beCloseTo( 0.0, within: 1e-15))
                expect(Projector.nyToMy(-12.0)).to(beCloseTo(-max, within: 1e-15))
            }
        }

        describe(".nxToMx") {
            it("正規化X座標をメルカトルX座標に変換する") {
                expect(Projector.nxToMx(+12.0)).to(beCloseTo(+1.0, within: 1e-15))
                expect(Projector.nxToMx(  0.0)).to(beCloseTo( 0.0, within: 1e-15))
                expect(Projector.nxToMx(-12.0)).to(beCloseTo(-1.0, within: 1e-15))
            }
        }

        describe(".latToNy") {
            it("緯度を正規化Y座標に変換する") {
                expect(Projector.latToNy(+82.4674)).to(beCloseTo(Projector.myToNy(Projector.latToMy(+82.4674)), within: 1e-15))
                expect(Projector.latToNy(  0.0   )).to(beCloseTo(                                          0.0, within: 1e-15))
                expect(Projector.latToNy(-82.4674)).to(beCloseTo(Projector.myToNy(Projector.latToMy(-82.4674)), within: 1e-15))
            }
        }

        describe(".lngToNx") {
            it("経度を正規化X座標に変換する") {
                expect(Projector.lngToNx(+180.0)).to(beCloseTo(Projector.mxToNx(Projector.lngToMx(+180.0)), within: 1e-15))
                expect(Projector.lngToNx(   0.0)).to(beCloseTo(                                        0.0, within: 1e-15))
                expect(Projector.lngToNx(-180.0)).to(beCloseTo(Projector.mxToNx(Projector.lngToMx(-180.0)), within: 1e-15))
            }
        }

        describe(".nyToLat") {
            it("正規化Y座標を緯度に変換する") {
                expect(Projector.nyToLat(+12.0)).to(beCloseTo(Projector.myToLat(Projector.nyToMy(+12.0)), within: 1e-15))
                expect(Projector.nyToLat(  0.0)).to(beCloseTo(                                       0.0, within: 1e-15))
                expect(Projector.nyToLat(-12.0)).to(beCloseTo(Projector.myToLat(Projector.nyToMy(-12.0)), within: 1e-15))
            }
        }

        /*
        describe("") {
            it("") {
            }
        }
        */
    }
}

/*
describe("projector", function() {

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

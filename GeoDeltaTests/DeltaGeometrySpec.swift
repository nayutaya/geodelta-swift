
import Quick
import Nimble
@testable import GeoDelta

class DeltaGeometrySpec : QuickSpec {
    override func spec() {
        describe(".getWorldDeltaId") {
            it("座標をワールドデルタIDに変換する") {
                expect(DeltaGeometry.getWorldDeltaId( -6.0, +12.0)).to(equal(2))
                expect(DeltaGeometry.getWorldDeltaId( -6.0,  +6.0)).to(equal(3))
                expect(DeltaGeometry.getWorldDeltaId( -6.0,   0.0)).to(equal(3))
                expect(DeltaGeometry.getWorldDeltaId( -3.0,  +6.0)).to(equal(3))
                expect(DeltaGeometry.getWorldDeltaId(  0.0, +12.0)).to(equal(0))
                expect(DeltaGeometry.getWorldDeltaId(  0.0,  +6.0)).to(equal(0))
                expect(DeltaGeometry.getWorldDeltaId(  0.0,   0.0)).to(equal(0))
                expect(DeltaGeometry.getWorldDeltaId( +3.0,  +6.0)).to(equal(0))
                expect(DeltaGeometry.getWorldDeltaId( +6.0, +12.0)).to(equal(0))
                expect(DeltaGeometry.getWorldDeltaId( +6.0,  +6.0)).to(equal(1))
                expect(DeltaGeometry.getWorldDeltaId( +6.0,   0.0)).to(equal(1))
                expect(DeltaGeometry.getWorldDeltaId( +9.0,  +6.0)).to(equal(1))
                expect(DeltaGeometry.getWorldDeltaId(+12.0,   0.0)).to(equal(1))
                expect(DeltaGeometry.getWorldDeltaId(+12.0, +12.0)).to(equal(2))
                expect(DeltaGeometry.getWorldDeltaId(+12.0,  +6.0)).to(equal(2))
                expect(DeltaGeometry.getWorldDeltaId(+15.0,  +6.0)).to(equal(2))
                expect(DeltaGeometry.getWorldDeltaId(+18.0, +12.0)).to(equal(2))
                expect(DeltaGeometry.getWorldDeltaId(+18.0,  +6.0)).to(equal(3))
                expect(DeltaGeometry.getWorldDeltaId(+18.0,   0.0)).to(equal(3))
                expect(DeltaGeometry.getWorldDeltaId(+21.0,  +6.0)).to(equal(3))
                expect(DeltaGeometry.getWorldDeltaId(+24.0, +12.0)).to(equal(0))
                expect(DeltaGeometry.getWorldDeltaId(+24.0,  +6.0)).to(equal(0))
                expect(DeltaGeometry.getWorldDeltaId(+24.0,   0.0)).to(equal(0))

                expect(DeltaGeometry.getWorldDeltaId( -6.0, -12.0)).to(equal(6))
                expect(DeltaGeometry.getWorldDeltaId( -6.0,  -6.0)).to(equal(7))
                expect(DeltaGeometry.getWorldDeltaId( -3.0,  -6.0)).to(equal(7))
                expect(DeltaGeometry.getWorldDeltaId(  0.0,  -6.0)).to(equal(4))
                expect(DeltaGeometry.getWorldDeltaId(  0.0, -12.0)).to(equal(4))
                expect(DeltaGeometry.getWorldDeltaId( +3.0,  -6.0)).to(equal(4))
                expect(DeltaGeometry.getWorldDeltaId( +6.0, -12.0)).to(equal(4))
                expect(DeltaGeometry.getWorldDeltaId( +6.0,  -6.0)).to(equal(5))
                expect(DeltaGeometry.getWorldDeltaId( +9.0,  -6.0)).to(equal(5))
                expect(DeltaGeometry.getWorldDeltaId(+12.0,  -6.0)).to(equal(6))
                expect(DeltaGeometry.getWorldDeltaId(+12.0, -12.0)).to(equal(6))
                expect(DeltaGeometry.getWorldDeltaId(+15.0,  -6.0)).to(equal(6))
                expect(DeltaGeometry.getWorldDeltaId(+18.0, -12.0)).to(equal(6))
                expect(DeltaGeometry.getWorldDeltaId(+18.0,  -6.0)).to(equal(7))
                expect(DeltaGeometry.getWorldDeltaId(+21.0,  -6.0)).to(equal(7))
                expect(DeltaGeometry.getWorldDeltaId(+24.0,  -6.0)).to(equal(4))
                expect(DeltaGeometry.getWorldDeltaId(+24.0, -12.0)).to(equal(4))
            }
        }

        describe(".getUpperDeltaId") {
            it("座標を上向きのサブデルタIDに変換する") {
                expect(DeltaGeometry.getUpperDeltaId( 0.0,  0.0)).to(equal(3))
                expect(DeltaGeometry.getUpperDeltaId( 1.5,  3.0)).to(equal(3))
                expect(DeltaGeometry.getUpperDeltaId( 3.0,  3.0)).to(equal(3))
                expect(DeltaGeometry.getUpperDeltaId( 3.0,  0.0)).to(equal(3))
                expect(DeltaGeometry.getUpperDeltaId( 9.0,  3.0)).to(equal(2))
                expect(DeltaGeometry.getUpperDeltaId( 9.0,  0.0)).to(equal(2))
                expect(DeltaGeometry.getUpperDeltaId(10.5,  3.0)).to(equal(2))
                expect(DeltaGeometry.getUpperDeltaId(12.0,  0.0)).to(equal(2))
                expect(DeltaGeometry.getUpperDeltaId( 4.5,  9.0)).to(equal(1))
                expect(DeltaGeometry.getUpperDeltaId( 6.0, 12.0)).to(equal(1))
                expect(DeltaGeometry.getUpperDeltaId( 6.0,  9.0)).to(equal(1))
                expect(DeltaGeometry.getUpperDeltaId( 7.5,  9.0)).to(equal(1))
                expect(DeltaGeometry.getUpperDeltaId( 3.0,  6.0)).to(equal(0))
                expect(DeltaGeometry.getUpperDeltaId( 4.5,  3.0)).to(equal(0))
                expect(DeltaGeometry.getUpperDeltaId( 6.0,  6.0)).to(equal(0))
                expect(DeltaGeometry.getUpperDeltaId( 6.0,  3.0)).to(equal(0))
                expect(DeltaGeometry.getUpperDeltaId( 6.0,  0.0)).to(equal(0))
                expect(DeltaGeometry.getUpperDeltaId( 7.5,  3.0)).to(equal(0))
                expect(DeltaGeometry.getUpperDeltaId( 9.0,  6.0)).to(equal(0))
            }
        }

        describe(".getLowerDeltaId") {
            it("座標を下向きのサブデルタIDに変換する") {
                expect(DeltaGeometry.getLowerDeltaId( 9.0, 12.0)).to(equal(3))
                expect(DeltaGeometry.getLowerDeltaId( 9.0,  9.0)).to(equal(3))
                expect(DeltaGeometry.getLowerDeltaId(10.5,  9.0)).to(equal(3))
                expect(DeltaGeometry.getLowerDeltaId(12.0, 12.0)).to(equal(3))
                expect(DeltaGeometry.getLowerDeltaId( 0.0, 12.0)).to(equal(2))
                expect(DeltaGeometry.getLowerDeltaId( 1.5,  9.0)).to(equal(2))
                expect(DeltaGeometry.getLowerDeltaId( 3.0, 12.0)).to(equal(2))
                expect(DeltaGeometry.getLowerDeltaId( 3.0,  9.0)).to(equal(2))
                expect(DeltaGeometry.getLowerDeltaId( 4.5,  3.0)).to(equal(1))
                expect(DeltaGeometry.getLowerDeltaId( 6.0,  3.0)).to(equal(1))
                expect(DeltaGeometry.getLowerDeltaId( 6.0,  0.0)).to(equal(1))
                expect(DeltaGeometry.getLowerDeltaId( 7.5,  3.0)).to(equal(1))
                expect(DeltaGeometry.getLowerDeltaId( 3.0,  6.0)).to(equal(0))
                expect(DeltaGeometry.getLowerDeltaId( 4.5,  9.0)).to(equal(0))
                expect(DeltaGeometry.getLowerDeltaId( 6.0, 12.0)).to(equal(0))
                expect(DeltaGeometry.getLowerDeltaId( 6.0,  9.0)).to(equal(0))
                expect(DeltaGeometry.getLowerDeltaId( 6.0,  6.0)).to(equal(0))
                expect(DeltaGeometry.getLowerDeltaId( 7.5,  9.0)).to(equal(0))
                expect(DeltaGeometry.getLowerDeltaId( 9.0,  6.0)).to(equal(0))
            }
        }

        describe(".isUpperWorldDelta") {
            it("指定されたワールドデルタIDが上向きかどうか判定する") {
                expect(DeltaGeometry.isUpperWorldDelta(0)).to(equal(false))
                expect(DeltaGeometry.isUpperWorldDelta(1)).to(equal(true ))
                expect(DeltaGeometry.isUpperWorldDelta(2)).to(equal(false))
                expect(DeltaGeometry.isUpperWorldDelta(3)).to(equal(true ))
                expect(DeltaGeometry.isUpperWorldDelta(4)).to(equal(true ))
                expect(DeltaGeometry.isUpperWorldDelta(5)).to(equal(false))
                expect(DeltaGeometry.isUpperWorldDelta(6)).to(equal(true ))
                expect(DeltaGeometry.isUpperWorldDelta(7)).to(equal(false))
            }
        }

        describe(".isUpperSubDelta") {
            it("指定されたサブデルタIDが上向きかどうか判定する") {
                expect(DeltaGeometry.isUpperSubDelta(true,  0)).to(equal(false))
                expect(DeltaGeometry.isUpperSubDelta(true,  1)).to(equal(true ))
                expect(DeltaGeometry.isUpperSubDelta(true,  2)).to(equal(true ))
                expect(DeltaGeometry.isUpperSubDelta(true,  3)).to(equal(true ))
                expect(DeltaGeometry.isUpperSubDelta(false, 0)).to(equal(true ))
                expect(DeltaGeometry.isUpperSubDelta(false, 1)).to(equal(false))
                expect(DeltaGeometry.isUpperSubDelta(false, 2)).to(equal(false))
                expect(DeltaGeometry.isUpperSubDelta(false, 3)).to(equal(false))
            }
        }

        describe(".isUpperDelta") {
            it("指定されたデルタID列が上向きかどうか判定する") {
                expect(DeltaGeometry.isUpperDelta([0])).to(equal(false))
                expect(DeltaGeometry.isUpperDelta([1])).to(equal(true ))
                expect(DeltaGeometry.isUpperDelta([4])).to(equal(true ))
                expect(DeltaGeometry.isUpperDelta([5])).to(equal(false))

                expect(DeltaGeometry.isUpperDelta([0, 0])).to(equal(true ))
                expect(DeltaGeometry.isUpperDelta([0, 1])).to(equal(false))
                expect(DeltaGeometry.isUpperDelta([0, 2])).to(equal(false))
                expect(DeltaGeometry.isUpperDelta([0, 3])).to(equal(false))

                expect(DeltaGeometry.isUpperDelta([4, 0])).to(equal(false))
                expect(DeltaGeometry.isUpperDelta([4, 1])).to(equal(true ))
                expect(DeltaGeometry.isUpperDelta([4, 2])).to(equal(true ))
                expect(DeltaGeometry.isUpperDelta([4, 3])).to(equal(true ))

                expect(DeltaGeometry.isUpperDelta([0, 0, 0      ])).to(equal(false))
                expect(DeltaGeometry.isUpperDelta([0, 0, 0, 0   ])).to(equal(true ))
                expect(DeltaGeometry.isUpperDelta([0, 0, 0, 0, 0])).to(equal(false))
            }
        }

        describe(".transformWorldDelta") {
            it("指定された座標を指定されたワールドデルタID内における正規化座標系に平行移動する") {
                expect(DeltaGeometry.transformWorldDelta(0,  +0.0, +4.0).x).to(beCloseTo(+6.0, within: 1e-15))
                expect(DeltaGeometry.transformWorldDelta(0,  +0.0, +4.0).y).to(beCloseTo(+4.0, within: 1e-15))
                expect(DeltaGeometry.transformWorldDelta(1,  +6.0, +4.0).x).to(beCloseTo(+6.0, within: 1e-15))
                expect(DeltaGeometry.transformWorldDelta(1,  +6.0, +4.0).y).to(beCloseTo(+4.0, within: 1e-15))
                expect(DeltaGeometry.transformWorldDelta(2, +12.0, +4.0).x).to(beCloseTo(+6.0, within: 1e-15))
                expect(DeltaGeometry.transformWorldDelta(2, +12.0, +4.0).y).to(beCloseTo(+4.0, within: 1e-15))
                expect(DeltaGeometry.transformWorldDelta(3, +18.0, +4.0).x).to(beCloseTo(+6.0, within: 1e-15))
                expect(DeltaGeometry.transformWorldDelta(3, +18.0, +4.0).y).to(beCloseTo(+4.0, within: 1e-15))
                expect(DeltaGeometry.transformWorldDelta(4,  +0.0, -8.0).x).to(beCloseTo(+6.0, within: 1e-15))
                expect(DeltaGeometry.transformWorldDelta(4,  +0.0, -8.0).y).to(beCloseTo(+4.0, within: 1e-15))
                expect(DeltaGeometry.transformWorldDelta(5,  +6.0, -8.0).x).to(beCloseTo(+6.0, within: 1e-15))
                expect(DeltaGeometry.transformWorldDelta(5,  +6.0, -8.0).y).to(beCloseTo(+4.0, within: 1e-15))
                expect(DeltaGeometry.transformWorldDelta(6, +12.0, -8.0).x).to(beCloseTo(+6.0, within: 1e-15))
                expect(DeltaGeometry.transformWorldDelta(6, +12.0, -8.0).y).to(beCloseTo(+4.0, within: 1e-15))
                expect(DeltaGeometry.transformWorldDelta(7, +18.0, -8.0).x).to(beCloseTo(+6.0, within: 1e-15))
                expect(DeltaGeometry.transformWorldDelta(7, +18.0, -8.0).y).to(beCloseTo(+4.0, within: 1e-15))
            }
        }

        describe(".transformUpperDelta") {
            it("指定された座標を指定された上向きのサブデルタID内における正規化座標系に平行移動する") {
                expect(DeltaGeometry.transformUpperDelta(0, +6.0, +4.0).x).to(beCloseTo(+6.0, within: 1e-15))
                expect(DeltaGeometry.transformUpperDelta(0, +6.0, +4.0).y).to(beCloseTo(+8.0, within: 1e-15))
                expect(DeltaGeometry.transformUpperDelta(1, +6.0, +8.0).x).to(beCloseTo(+6.0, within: 1e-15))
                expect(DeltaGeometry.transformUpperDelta(1, +6.0, +8.0).y).to(beCloseTo(+4.0, within: 1e-15))
                expect(DeltaGeometry.transformUpperDelta(2, +9.0, +2.0).x).to(beCloseTo(+6.0, within: 1e-15))
                expect(DeltaGeometry.transformUpperDelta(2, +9.0, +2.0).y).to(beCloseTo(+4.0, within: 1e-15))
                expect(DeltaGeometry.transformUpperDelta(3, +3.0, +2.0).x).to(beCloseTo(+6.0, within: 1e-15))
                expect(DeltaGeometry.transformUpperDelta(3, +3.0, +2.0).y).to(beCloseTo(+4.0, within: 1e-15))
            }
        }

        describe(".transformLowerDelta") {
            it("指定された座標を指定された下向きのサブデルタID内における正規化座標系に平行移動する") {
                expect(DeltaGeometry.transformLowerDelta(0, +6.0,  +8.0).x).to(beCloseTo(+6.0, within: 1e-15))
                expect(DeltaGeometry.transformLowerDelta(0, +6.0,  +8.0).y).to(beCloseTo(+4.0, within: 1e-15))
                expect(DeltaGeometry.transformLowerDelta(1, +6.0,  +4.0).x).to(beCloseTo(+6.0, within: 1e-15))
                expect(DeltaGeometry.transformLowerDelta(1, +6.0,  +4.0).y).to(beCloseTo(+8.0, within: 1e-15))
                expect(DeltaGeometry.transformLowerDelta(2, +3.0, +10.0).x).to(beCloseTo(+6.0, within: 1e-15))
                expect(DeltaGeometry.transformLowerDelta(2, +3.0, +10.0).y).to(beCloseTo(+8.0, within: 1e-15))
                expect(DeltaGeometry.transformLowerDelta(3, +9.0, +10.0).x).to(beCloseTo(+6.0, within: 1e-15))
                expect(DeltaGeometry.transformLowerDelta(3, +9.0, +10.0).y).to(beCloseTo(+8.0, within: 1e-15))
            }
        }

        describe(".getDeltaIds") {
            it("指定された座標を指定されたレベルのデルタID列に変換する（レベル1）") {
                expect(DeltaGeometry.getDeltaIds( 0.0, +6.0, 1)).to(equal([0]))
                expect(DeltaGeometry.getDeltaIds( 6.0, +6.0, 1)).to(equal([1]))
                expect(DeltaGeometry.getDeltaIds(12.0, +6.0, 1)).to(equal([2]))
                expect(DeltaGeometry.getDeltaIds(18.0, +6.0, 1)).to(equal([3]))
                expect(DeltaGeometry.getDeltaIds( 0.0, -6.0, 1)).to(equal([4]))
                expect(DeltaGeometry.getDeltaIds( 6.0, -6.0, 1)).to(equal([5]))
                expect(DeltaGeometry.getDeltaIds(12.0, -6.0, 1)).to(equal([6]))
                expect(DeltaGeometry.getDeltaIds(18.0, -6.0, 1)).to(equal([7]))
            }
            it("指定された座標を指定されたレベルのデルタID列に変換する（レベル2）") {
                expect(DeltaGeometry.getDeltaIds( +0.0,  +8.0, 2)).to(equal([0, 0]))
                expect(DeltaGeometry.getDeltaIds( +0.0,  +4.0, 2)).to(equal([0, 1]))
                expect(DeltaGeometry.getDeltaIds( -3.0, +10.0, 2)).to(equal([0, 2]))
                expect(DeltaGeometry.getDeltaIds( +3.0, +10.0, 2)).to(equal([0, 3]))
                expect(DeltaGeometry.getDeltaIds( +6.0,  +4.0, 2)).to(equal([1, 0]))
                expect(DeltaGeometry.getDeltaIds( +6.0,  +8.0, 2)).to(equal([1, 1]))
                expect(DeltaGeometry.getDeltaIds( +9.0,  +2.0, 2)).to(equal([1, 2]))
                expect(DeltaGeometry.getDeltaIds( +3.0,  +2.0, 2)).to(equal([1, 3]))
                expect(DeltaGeometry.getDeltaIds( +9.0, +10.0, 2)).to(equal([2, 2]))
                expect(DeltaGeometry.getDeltaIds(+15.0,  +2.0, 2)).to(equal([3, 3]))

                expect(DeltaGeometry.getDeltaIds( +0.0,  -8.0, 2)).to(equal([4, 0]))
                expect(DeltaGeometry.getDeltaIds( +0.0,  -4.0, 2)).to(equal([4, 1]))
                expect(DeltaGeometry.getDeltaIds( +3.0, -10.0, 2)).to(equal([4, 2]))
                expect(DeltaGeometry.getDeltaIds( -3.0, -10.0, 2)).to(equal([4, 3]))
                expect(DeltaGeometry.getDeltaIds( +6.0,  -4.0, 2)).to(equal([5, 0]))
                expect(DeltaGeometry.getDeltaIds( +6.0,  -8.0, 2)).to(equal([5, 1]))
                expect(DeltaGeometry.getDeltaIds( +3.0,  -2.0, 2)).to(equal([5, 2]))
                expect(DeltaGeometry.getDeltaIds( +9.0,  -2.0, 2)).to(equal([5, 3]))
                expect(DeltaGeometry.getDeltaIds(+15.0, -10.0, 2)).to(equal([6, 2]))
                expect(DeltaGeometry.getDeltaIds(+21.0,  -2.0, 2)).to(equal([7, 3]))
            }
            it("指定された座標を指定されたレベルのデルタID列に変換する（レベル3）") {
                expect(DeltaGeometry.getDeltaIds(+0.0, +8.0, 3)).to(equal([0, 0, 0]))
                expect(DeltaGeometry.getDeltaIds(+6.0, +4.0, 3)).to(equal([1, 0, 0]))
            }
            it("指定された座標を指定されたレベルのデルタID列に変換する（レベル4）") {
                expect(DeltaGeometry.getDeltaIds(+0.0, +8.0, 4)).to(equal([0, 0, 0, 0]))
                expect(DeltaGeometry.getDeltaIds(+6.0, +4.0, 4)).to(equal([1, 0, 0, 0]))
            }
        }

        describe(".getWorldDeltaCenter") {
            it("指定されたワールドデルタIDの中心座標を取得する") {
                expect(DeltaGeometry.getWorldDeltaCenter(0).x).to(beCloseTo( +0.0, within: 1e-15))
                expect(DeltaGeometry.getWorldDeltaCenter(0).y).to(beCloseTo( +8.0, within: 1e-15))
                expect(DeltaGeometry.getWorldDeltaCenter(1).x).to(beCloseTo( +6.0, within: 1e-15))
                expect(DeltaGeometry.getWorldDeltaCenter(1).y).to(beCloseTo( +4.0, within: 1e-15))
                expect(DeltaGeometry.getWorldDeltaCenter(2).x).to(beCloseTo(+12.0, within: 1e-15))
                expect(DeltaGeometry.getWorldDeltaCenter(2).y).to(beCloseTo( +8.0, within: 1e-15))
                expect(DeltaGeometry.getWorldDeltaCenter(3).x).to(beCloseTo(+18.0, within: 1e-15))
                expect(DeltaGeometry.getWorldDeltaCenter(3).y).to(beCloseTo( +4.0, within: 1e-15))
                expect(DeltaGeometry.getWorldDeltaCenter(4).x).to(beCloseTo( +0.0, within: 1e-15))
                expect(DeltaGeometry.getWorldDeltaCenter(4).y).to(beCloseTo( -8.0, within: 1e-15))
                expect(DeltaGeometry.getWorldDeltaCenter(5).x).to(beCloseTo( +6.0, within: 1e-15))
                expect(DeltaGeometry.getWorldDeltaCenter(5).y).to(beCloseTo( -4.0, within: 1e-15))
                expect(DeltaGeometry.getWorldDeltaCenter(6).x).to(beCloseTo(+12.0, within: 1e-15))
                expect(DeltaGeometry.getWorldDeltaCenter(6).y).to(beCloseTo( -8.0, within: 1e-15))
                expect(DeltaGeometry.getWorldDeltaCenter(7).x).to(beCloseTo(+18.0, within: 1e-15))
                expect(DeltaGeometry.getWorldDeltaCenter(7).y).to(beCloseTo( -4.0, within: 1e-15))
            }
        }
    }
}

/*
describe("delta_geometry", function() {

  describe(".getUpperSubDeltaDistance", function() {
    it("指定されたサブデルタIDの上向き上位デルタからの距離を取得する", function() {
      assertArrayEquals([+0.0, +0.0], delta_geometry.getUpperSubDeltaDistance(0), 1e-15);
      assertArrayEquals([+0.0, +4.0], delta_geometry.getUpperSubDeltaDistance(1), 1e-15);
      assertArrayEquals([+3.0, -2.0], delta_geometry.getUpperSubDeltaDistance(2), 1e-15);
      assertArrayEquals([-3.0, -2.0], delta_geometry.getUpperSubDeltaDistance(3), 1e-15);
    });
  });

  describe(".getLowerSubDeltaDistance", function() {
    it("指定されたサブデルタIDの下向き上位デルタからの距離を取得する", function() {
      assertArrayEquals([+0.0, +0.0], delta_geometry.getLowerSubDeltaDistance(0), 1e-15);
      assertArrayEquals([+0.0, -4.0], delta_geometry.getLowerSubDeltaDistance(1), 1e-15);
      assertArrayEquals([-3.0, +2.0], delta_geometry.getLowerSubDeltaDistance(2), 1e-15);
      assertArrayEquals([+3.0, +2.0], delta_geometry.getLowerSubDeltaDistance(3), 1e-15);
    });
  });

  describe(".getSubDeltaDistance", function() {
    it("指定されたサブデルタIDの上位デルタからの距離を取得する", function() {
      assertArrayEquals([+0.0, +4.0], delta_geometry.getSubDeltaDistance(true,  1), 1e-15);
      assertArrayEquals([+3.0, -2.0], delta_geometry.getSubDeltaDistance(true,  2), 1e-15);
      assertArrayEquals([+0.0, -4.0], delta_geometry.getSubDeltaDistance(false, 1), 1e-15);
      assertArrayEquals([-3.0, +2.0], delta_geometry.getSubDeltaDistance(false, 2), 1e-15);
    });
  });

  describe(".getCenter", function() {
    it("デルタID列から中心座標を取得する（レベル1）", function() {
      assertArrayEquals([+0.0, +8.0], delta_geometry.getCenter([0]), 1e-15);
      assertArrayEquals([+6.0, +4.0], delta_geometry.getCenter([1]), 1e-15);
      assertArrayEquals([+0.0, -8.0], delta_geometry.getCenter([4]), 1e-15);
      assertArrayEquals([+6.0, -4.0], delta_geometry.getCenter([5]), 1e-15);
    });
    it("デルタID列から中心座標を取得する（レベル2）", function() {
      assertArrayEquals([+0.0,  +8.0], delta_geometry.getCenter([0, 0]), 1e-15);
      assertArrayEquals([+0.0,  +4.0], delta_geometry.getCenter([0, 1]), 1e-15);
      assertArrayEquals([-3.0, +10.0], delta_geometry.getCenter([0, 2]), 1e-15);
      assertArrayEquals([+3.0, +10.0], delta_geometry.getCenter([0, 3]), 1e-15);
      assertArrayEquals([+6.0,  +4.0], delta_geometry.getCenter([1, 0]), 1e-15);
      assertArrayEquals([+6.0,  +8.0], delta_geometry.getCenter([1, 1]), 1e-15);
      assertArrayEquals([+9.0,  +2.0], delta_geometry.getCenter([1, 2]), 1e-15);
      assertArrayEquals([+3.0,  +2.0], delta_geometry.getCenter([1, 3]), 1e-15);
      assertArrayEquals([+9.0, +10.0], delta_geometry.getCenter([2, 2]), 1e-15);
      assertArrayEquals([-9.0,  +2.0], delta_geometry.getCenter([3, 3]), 1e-15);

      assertArrayEquals([+0.0,  -8.0], delta_geometry.getCenter([4, 0]), 1e-15);
      assertArrayEquals([+0.0,  -4.0], delta_geometry.getCenter([4, 1]), 1e-15);
      assertArrayEquals([+3.0, -10.0], delta_geometry.getCenter([4, 2]), 1e-15);
      assertArrayEquals([-3.0, -10.0], delta_geometry.getCenter([4, 3]), 1e-15);
      assertArrayEquals([+6.0,  -4.0], delta_geometry.getCenter([5, 0]), 1e-15);
      assertArrayEquals([+6.0,  -8.0], delta_geometry.getCenter([5, 1]), 1e-15);
      assertArrayEquals([+3.0,  -2.0], delta_geometry.getCenter([5, 2]), 1e-15);
      assertArrayEquals([+9.0,  -2.0], delta_geometry.getCenter([5, 3]), 1e-15);
      assertArrayEquals([-9.0, -10.0], delta_geometry.getCenter([6, 2]), 1e-15);
      assertArrayEquals([-3.0,  -2.0], delta_geometry.getCenter([7, 3]), 1e-15);
    });
    it("デルタID列から中心座標を取得する（レベル3）", function() {
      assertArrayEquals([+0.0,  +8.0], delta_geometry.getCenter([0, 0, 0]), 1e-15);
      assertArrayEquals([+0.0, +10.0], delta_geometry.getCenter([0, 0, 1]), 1e-15);
      assertArrayEquals([-1.5,  +5.0], delta_geometry.getCenter([0, 1, 2]), 1e-15);
      assertArrayEquals([-1.5, +11.0], delta_geometry.getCenter([0, 2, 3]), 1e-15);
      assertArrayEquals([+3.0, +10.0], delta_geometry.getCenter([0, 3, 0]), 1e-15);
    });
  });

  describe(".getCoordinates", function() {
    it("デルタID列からデルタの中心座標、頂点座標を取得する（レベル1）", function() {
      var expected1 = [
          [+0.0,  +8.0],
          [+0.0,  +0.0], // +0.0, -8.0
          [-6.0, +12.0], // -6.0, +4.0
          [+6.0, +12.0], // +6.0, +4.0
      ];
      assertArrayArrayEquals(expected1, delta_geometry.getCoordinates([0]), 1e-15);

      var expected2 = [
          [ +6.0,  +4.0],
          [ +6.0, +12.0], // +0.0, +8.0
          [+12.0,  +0.0], // +6.0, -4.0
          [ +0.0,  +0.0], // -6.0, -4.0
      ];
      assertArrayArrayEquals(expected2, delta_geometry.getCoordinates([1]), 1e-15);

      var expected3 = [
          [+0.0,  -8.0],
          [+0.0,  +0.0], // +0.0, +8.0
          [+6.0, -12.0], // +6.0, -4.0
          [-6.0, -12.0], // -6.0, -4.0
      ];
      assertArrayArrayEquals(expected3, delta_geometry.getCoordinates([4]), 1e-15);

      var expected4 = [
          [ +6.0,  -4.0],
          [ +6.0, -12.0], // +0.0, -8.0
          [ +0.0,  +0.0], // -6.0, +4.0
          [+12.0,  +0.0], // +6.0, +4.0
      ];
      assertArrayArrayEquals(expected4, delta_geometry.getCoordinates([5]), 1e-15);
    });
    it("デルタID列からデルタの中心座標、頂点座標を取得する（レベル2）", function() {
      var expected1 = [
          [ +0.0,  +8.0],
          [ +0.0, +12.0], // +0.0, +4.0
          [ +3.0,  +6.0], // +3.0, -2.0
          [ -3.0,  +6.0], // -3.0, -2.0
      ];
      assertArrayArrayEquals(expected1, delta_geometry.getCoordinates([0, 0]), 1e-15);

      var expected2 = [
          [ +0.0, +4.0],
          [ +0.0, +0.0], // +0.0, -4.0
          [ -3.0, +6.0], // -3.0, +2.0
          [ +3.0, +6.0], // +3.0, +2.0
      ];
      assertArrayArrayEquals(expected2, delta_geometry.getCoordinates([0, 1]), 1e-15);

      var expected3 = [
          [ -3.0, +10.0],
          [ -3.0,  +6.0], // +0.0, -4.0
          [ -6.0, +12.0], // -3.0, +2.0
          [ +0.0, +12.0], // +3.0, +2.0
      ];
      assertArrayArrayEquals(expected3, delta_geometry.getCoordinates([0, 2]), 1e-15);

      var expected4 = [
          [ +3.0, +10.0],
          [ +3.0,  +6.0], // +0.0, -4.0
          [ +0.0, +12.0], // -3.0, +2.0
          [ +6.0, +12.0], // +3.0, +2.0
      ];
      assertArrayArrayEquals(expected4, delta_geometry.getCoordinates([0, 3]), 1e-15);

      var expected5 = [
          [ +0.0,  -8.0],
          [ +0.0, -12.0], // +0.0, -4.0
          [ -3.0,  -6.0], // -3.0, +2.0
          [ +3.0,  -6.0], // +3.0, +2.0
      ];
      assertArrayArrayEquals(expected5, delta_geometry.getCoordinates([4, 0]), 1e-15);

      var expected6 = [
          [ +0.0, -4.0],
          [ +0.0, +0.0], // +0.0, +4.0
          [ +3.0, -6.0], // +3.0, -2.0
          [ -3.0, -6.0], // -3.0, -2.0
      ];
      assertArrayArrayEquals(expected6, delta_geometry.getCoordinates([4, 1]), 1e-15);

      var expected7 = [
          [ +3.0, -10.0],
          [ +3.0,  -6.0], // +0.0, +4.0
          [ +6.0, -12.0], // +3.0, -2.0
          [ +0.0, -12.0], // -3.0, -2.0
      ];
      assertArrayArrayEquals(expected7, delta_geometry.getCoordinates([4, 2]), 1e-15);

      var expected8 = [
          [ -3.0, -10.0],
          [ -3.0,  -6.0], // +0.0, +4.0
          [ +0.0, -12.0], // +3.0, -2.0
          [ -6.0, -12.0], // -3.0, -2.0
      ];
      assertArrayArrayEquals(expected8, delta_geometry.getCoordinates([4, 3]), 1e-15);
    });
    it("デルタID列からデルタの中心座標、頂点座標を取得する（レベル3）", function() {
      var expected1 = [
          [ +0.0, +8.0],
          [ +0.0, +6.0], // +0.0, -2.0
          [ -1.5, +9.0], // -1.5, +1.0
          [ +1.5, +9.0], // +1.5, +1.0
      ];
      assertArrayArrayEquals(expected1, delta_geometry.getCoordinates([0, 0, 0]), 1e-15);

      var expected = [
          [ -1.5, +5.0],
          [ -1.5, +3.0], // +0.0, -2.0
          [ -3.0, +6.0], // -1.5, +1.0
          [ +0.0, +6.0], // +1.5, +1.0
      ];
      assertArrayArrayEquals(expected, delta_geometry.getCoordinates([0, 1, 2]), 1e-15);
    });
  });

/*
  function test_randomCenter()
  {
    final Random r = new Random();
    for ( int i = 0; i < 1000; i++ )
    {
      final int level = r.nextInt(20) + 1;
      final double x1 = (r.nextDouble() * 24.0) - 12.0;
      final double y1 = (r.nextDouble() * 24.0) - 12.0;
      final byte[] ids1 = geodelta.delta_geometry.getDeltaIds(x1, y1, level);
      final double[] xy2 = geodelta.delta_geometry.getCenter(ids1);
      final byte[] ids2 = geodelta.delta_geometry.getDeltaIds(xy2[0], xy2[1], level);
      final double[] xy3 = geodelta.delta_geometry.getCenter(ids2);
      assertArrayEquals(ids1, ids2);
      assertArrayEquals(xy2, xy3, 1E-15);
    }
  }
*/

/*
  describe(".TODO", function() {
    it("TODO", function() {
    });
  });
*/
});
*/

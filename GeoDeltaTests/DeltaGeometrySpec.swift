
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
    }
}

/*
describe("delta_geometry", function() {

  describe(".getUpperDeltaId", function() {
    it("座標を上向きのサブデルタIDに変換する", function() {
      assertEquals(3, delta_geometry.getUpperDeltaId( 0.0,  0.0));
      assertEquals(3, delta_geometry.getUpperDeltaId( 1.5,  3.0));
      assertEquals(3, delta_geometry.getUpperDeltaId( 3.0,  3.0));
      assertEquals(3, delta_geometry.getUpperDeltaId( 3.0,  0.0));
      assertEquals(2, delta_geometry.getUpperDeltaId( 9.0,  3.0));
      assertEquals(2, delta_geometry.getUpperDeltaId( 9.0,  0.0));
      assertEquals(2, delta_geometry.getUpperDeltaId(10.5,  3.0));
      assertEquals(2, delta_geometry.getUpperDeltaId(12.0,  0.0));
      assertEquals(1, delta_geometry.getUpperDeltaId( 4.5,  9.0));
      assertEquals(1, delta_geometry.getUpperDeltaId( 6.0, 12.0));
      assertEquals(1, delta_geometry.getUpperDeltaId( 6.0,  9.0));
      assertEquals(1, delta_geometry.getUpperDeltaId( 7.5,  9.0));
      assertEquals(0, delta_geometry.getUpperDeltaId( 3.0,  6.0));
      assertEquals(0, delta_geometry.getUpperDeltaId( 4.5,  3.0));
      assertEquals(0, delta_geometry.getUpperDeltaId( 6.0,  6.0));
      assertEquals(0, delta_geometry.getUpperDeltaId( 6.0,  3.0));
      assertEquals(0, delta_geometry.getUpperDeltaId( 6.0,  0.0));
      assertEquals(0, delta_geometry.getUpperDeltaId( 7.5,  3.0));
      assertEquals(0, delta_geometry.getUpperDeltaId( 9.0,  6.0));
    });
  });

  describe(".getLowerDeltaId", function() {
    it("座標を下向きのサブデルタIDに変換する", function() {
      assertEquals(3, delta_geometry.getLowerDeltaId( 9.0, 12.0));
      assertEquals(3, delta_geometry.getLowerDeltaId( 9.0,  9.0));
      assertEquals(3, delta_geometry.getLowerDeltaId(10.5,  9.0));
      assertEquals(3, delta_geometry.getLowerDeltaId(12.0, 12.0));
      assertEquals(2, delta_geometry.getLowerDeltaId( 0.0, 12.0));
      assertEquals(2, delta_geometry.getLowerDeltaId( 1.5,  9.0));
      assertEquals(2, delta_geometry.getLowerDeltaId( 3.0, 12.0));
      assertEquals(2, delta_geometry.getLowerDeltaId( 3.0,  9.0));
      assertEquals(1, delta_geometry.getLowerDeltaId( 4.5,  3.0));
      assertEquals(1, delta_geometry.getLowerDeltaId( 6.0,  3.0));
      assertEquals(1, delta_geometry.getLowerDeltaId( 6.0,  0.0));
      assertEquals(1, delta_geometry.getLowerDeltaId( 7.5,  3.0));
      assertEquals(0, delta_geometry.getLowerDeltaId( 3.0,  6.0));
      assertEquals(0, delta_geometry.getLowerDeltaId( 4.5,  9.0));
      assertEquals(0, delta_geometry.getLowerDeltaId( 6.0, 12.0));
      assertEquals(0, delta_geometry.getLowerDeltaId( 6.0,  9.0));
      assertEquals(0, delta_geometry.getLowerDeltaId( 6.0,  6.0));
      assertEquals(0, delta_geometry.getLowerDeltaId( 7.5,  9.0));
      assertEquals(0, delta_geometry.getLowerDeltaId( 9.0,  6.0));
    });
  });

  describe(".isUpperWorldDelta", function() {
    it("指定されたワールドデルタIDが上向きかどうか判定する", function() {
      assertEquals(false, delta_geometry.isUpperWorldDelta(0));
      assertEquals(true,  delta_geometry.isUpperWorldDelta(1));
      assertEquals(false, delta_geometry.isUpperWorldDelta(2));
      assertEquals(true,  delta_geometry.isUpperWorldDelta(3));
      assertEquals(true,  delta_geometry.isUpperWorldDelta(4));
      assertEquals(false, delta_geometry.isUpperWorldDelta(5));
      assertEquals(true,  delta_geometry.isUpperWorldDelta(6));
      assertEquals(false, delta_geometry.isUpperWorldDelta(7));
    });
  });

  describe(".isUpperSubDelta", function() {
    it("指定されたサブデルタIDが上向きかどうか判定する", function() {
      assertEquals(false, delta_geometry.isUpperSubDelta(true,  0));
      assertEquals(true,  delta_geometry.isUpperSubDelta(true,  1));
      assertEquals(true,  delta_geometry.isUpperSubDelta(true,  2));
      assertEquals(true,  delta_geometry.isUpperSubDelta(true,  3));
      assertEquals(true,  delta_geometry.isUpperSubDelta(false, 0));
      assertEquals(false, delta_geometry.isUpperSubDelta(false, 1));
      assertEquals(false, delta_geometry.isUpperSubDelta(false, 2));
      assertEquals(false, delta_geometry.isUpperSubDelta(false, 3));
    });
  });

  describe(".isUpperDelta", function() {
    it("指定されたデルタID列が上向きかどうか判定する", function() {
      assertEquals(false, delta_geometry.isUpperDelta([0]));
      assertEquals(true,  delta_geometry.isUpperDelta([1]));
      assertEquals(true,  delta_geometry.isUpperDelta([4]));
      assertEquals(false, delta_geometry.isUpperDelta([5]));

      assertEquals(true,  delta_geometry.isUpperDelta([0, 0]));
      assertEquals(false, delta_geometry.isUpperDelta([0, 1]));
      assertEquals(false, delta_geometry.isUpperDelta([0, 2]));
      assertEquals(false, delta_geometry.isUpperDelta([0, 3]));

      assertEquals(false, delta_geometry.isUpperDelta([4, 0]));
      assertEquals(true,  delta_geometry.isUpperDelta([4, 1]));
      assertEquals(true,  delta_geometry.isUpperDelta([4, 2]));
      assertEquals(true,  delta_geometry.isUpperDelta([4, 3]));

      assertEquals(false, delta_geometry.isUpperDelta([0, 0, 0]));
      assertEquals(true,  delta_geometry.isUpperDelta([0, 0, 0, 0]));
      assertEquals(false, delta_geometry.isUpperDelta([0, 0, 0, 0, 0]));
    });
  });

  describe(".transformWorldDelta", function() {
    it("指定された座標を指定されたワールドデルタID内における正規化座標系に平行移動する", function() {
      assertArrayEquals([+6.0, +4.0], delta_geometry.transformWorldDelta(0,  +0.0, +4.0), 1e-15);
      assertArrayEquals([+6.0, +4.0], delta_geometry.transformWorldDelta(1,  +6.0, +4.0), 1e-15);
      assertArrayEquals([+6.0, +4.0], delta_geometry.transformWorldDelta(2, +12.0, +4.0), 1e-15);
      assertArrayEquals([+6.0, +4.0], delta_geometry.transformWorldDelta(3, +18.0, +4.0), 1e-15);
      assertArrayEquals([+6.0, +4.0], delta_geometry.transformWorldDelta(4,  +0.0, -8.0), 1e-15);
      assertArrayEquals([+6.0, +4.0], delta_geometry.transformWorldDelta(5,  +6.0, -8.0), 1e-15);
      assertArrayEquals([+6.0, +4.0], delta_geometry.transformWorldDelta(6, +12.0, -8.0), 1e-15);
      assertArrayEquals([+6.0, +4.0], delta_geometry.transformWorldDelta(7, +18.0, -8.0), 1e-15);
    });
  });

  describe(".transformUpperDelta", function() {
    it("指定された座標を指定された上向きのサブデルタID内における正規化座標系に平行移動する", function() {
      assertArrayEquals([+6.0, +8.0], delta_geometry.transformUpperDelta(0, +6.0, +4.0), 1e-15);
      assertArrayEquals([+6.0, +4.0], delta_geometry.transformUpperDelta(1, +6.0, +8.0), 1e-15);
      assertArrayEquals([+6.0, +4.0], delta_geometry.transformUpperDelta(2, +9.0, +2.0), 1e-15);
      assertArrayEquals([+6.0, +4.0], delta_geometry.transformUpperDelta(3, +3.0, +2.0), 1e-15);
    });
  });

  describe(".transformLowerDelta", function() {
    it("指定された座標を指定された下向きのサブデルタID内における正規化座標系に平行移動する", function() {
      assertArrayEquals([+6.0, +4.0], delta_geometry.transformLowerDelta(0, +6.0,  +8.0), 1e-15);
      assertArrayEquals([+6.0, +8.0], delta_geometry.transformLowerDelta(1, +6.0,  +4.0), 1e-15);
      assertArrayEquals([+6.0, +8.0], delta_geometry.transformLowerDelta(2, +3.0, +10.0), 1e-15);
      assertArrayEquals([+6.0, +8.0], delta_geometry.transformLowerDelta(3, +9.0, +10.0), 1e-15);
    });
  });

  describe(".getDeltaIds", function() {
    it("指定された座標を指定されたレベルのデルタID列に変換する（レベル1）", function() {
      assertArrayEquals([0], delta_geometry.getDeltaIds( 0.0, +6.0, 1));
      assertArrayEquals([1], delta_geometry.getDeltaIds( 6.0, +6.0, 1));
      assertArrayEquals([2], delta_geometry.getDeltaIds(12.0, +6.0, 1));
      assertArrayEquals([3], delta_geometry.getDeltaIds(18.0, +6.0, 1));
      assertArrayEquals([4], delta_geometry.getDeltaIds( 0.0, -6.0, 1));
      assertArrayEquals([5], delta_geometry.getDeltaIds( 6.0, -6.0, 1));
      assertArrayEquals([6], delta_geometry.getDeltaIds(12.0, -6.0, 1));
      assertArrayEquals([7], delta_geometry.getDeltaIds(18.0, -6.0, 1));
    });
    it("指定された座標を指定されたレベルのデルタID列に変換する（レベル2）", function() {
      assertArrayEquals([0, 0], delta_geometry.getDeltaIds( +0.0,  +8.0, 2));
      assertArrayEquals([0, 1], delta_geometry.getDeltaIds( +0.0,  +4.0, 2));
      assertArrayEquals([0, 2], delta_geometry.getDeltaIds( -3.0, +10.0, 2));
      assertArrayEquals([0, 3], delta_geometry.getDeltaIds( +3.0, +10.0, 2));
      assertArrayEquals([1, 0], delta_geometry.getDeltaIds( +6.0,  +4.0, 2));
      assertArrayEquals([1, 1], delta_geometry.getDeltaIds( +6.0,  +8.0, 2));
      assertArrayEquals([1, 2], delta_geometry.getDeltaIds( +9.0,  +2.0, 2));
      assertArrayEquals([1, 3], delta_geometry.getDeltaIds( +3.0,  +2.0, 2));
      assertArrayEquals([2, 2], delta_geometry.getDeltaIds( +9.0, +10.0, 2));
      assertArrayEquals([3, 3], delta_geometry.getDeltaIds(+15.0,  +2.0, 2));

      assertArrayEquals([4, 0], delta_geometry.getDeltaIds( +0.0,  -8.0, 2));
      assertArrayEquals([4, 1], delta_geometry.getDeltaIds( +0.0,  -4.0, 2));
      assertArrayEquals([4, 2], delta_geometry.getDeltaIds( +3.0, -10.0, 2));
      assertArrayEquals([4, 3], delta_geometry.getDeltaIds( -3.0, -10.0, 2));
      assertArrayEquals([5, 0], delta_geometry.getDeltaIds( +6.0,  -4.0, 2));
      assertArrayEquals([5, 1], delta_geometry.getDeltaIds( +6.0,  -8.0, 2));
      assertArrayEquals([5, 2], delta_geometry.getDeltaIds( +3.0,  -2.0, 2));
      assertArrayEquals([5, 3], delta_geometry.getDeltaIds( +9.0,  -2.0, 2));
      assertArrayEquals([6, 2], delta_geometry.getDeltaIds(+15.0, -10.0, 2));
      assertArrayEquals([7, 3], delta_geometry.getDeltaIds(+21.0,  -2.0, 2));
    });
    it("指定された座標を指定されたレベルのデルタID列に変換する（レベル3）", function() {
      assertArrayEquals([0, 0, 0], delta_geometry.getDeltaIds(+0.0, +8.0, 3));
      assertArrayEquals([1, 0, 0], delta_geometry.getDeltaIds(+6.0, +4.0, 3));
    });
    it("指定された座標を指定されたレベルのデルタID列に変換する（レベル4）", function() {
      assertArrayEquals([0, 0, 0, 0], delta_geometry.getDeltaIds(+0.0, +8.0, 4));
      assertArrayEquals([1, 0, 0, 0], delta_geometry.getDeltaIds(+6.0, +4.0, 4));
    });
  });

  describe(".getWorldDeltaCenter", function() {
    it("指定されたワールドデルタIDの中心座標を取得する", function() {
      assertArrayEquals([ +0.0, +8.0], delta_geometry.getWorldDeltaCenter(0), 1e-15);
      assertArrayEquals([ +6.0, +4.0], delta_geometry.getWorldDeltaCenter(1), 1e-15);
      assertArrayEquals([+12.0, +8.0], delta_geometry.getWorldDeltaCenter(2), 1e-15);
      assertArrayEquals([+18.0, +4.0], delta_geometry.getWorldDeltaCenter(3), 1e-15);
      assertArrayEquals([ +0.0, -8.0], delta_geometry.getWorldDeltaCenter(4), 1e-15);
      assertArrayEquals([ +6.0, -4.0], delta_geometry.getWorldDeltaCenter(5), 1e-15);
      assertArrayEquals([+12.0, -8.0], delta_geometry.getWorldDeltaCenter(6), 1e-15);
      assertArrayEquals([+18.0, -4.0], delta_geometry.getWorldDeltaCenter(7), 1e-15);
    });
  });

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

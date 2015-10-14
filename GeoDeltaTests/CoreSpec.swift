
import Quick
import Nimble
@testable import GeoDelta

class CoreSpec : QuickSpec {
    override func spec() {
        describe(".getDeltaIds") {
            it("緯度経度からデルタID列を取得する") {
                expect(Core.getDeltaIds(lat: +45.0, lng:   +0.0, level: 1)).to(equal([0]))
                expect(Core.getDeltaIds(lat: +45.0, lng:  +90.0, level: 1)).to(equal([1]))
                expect(Core.getDeltaIds(lat: +45.0, lng: +180.0, level: 1)).to(equal([2]))
                expect(Core.getDeltaIds(lat: +45.0, lng:  -90.0, level: 1)).to(equal([3]))
                expect(Core.getDeltaIds(lat: +45.0, lng: -180.0, level: 1)).to(equal([2]))

                expect(Core.getDeltaIds(lat: -45.0, lng:   +0.0, level: 1)).to(equal([4]))
                expect(Core.getDeltaIds(lat: -45.0, lng:  +90.0, level: 1)).to(equal([5]))
                expect(Core.getDeltaIds(lat: -45.0, lng: +180.0, level: 1)).to(equal([6]))
                expect(Core.getDeltaIds(lat: -45.0, lng:  -90.0, level: 1)).to(equal([7]))
                expect(Core.getDeltaIds(lat: -45.0, lng: -180.0, level: 1)).to(equal([6]))

                expect(Core.getDeltaIds(lat: +0.0, lng: +0.0, level: 1)).to(equal([0         ]))
                expect(Core.getDeltaIds(lat: +0.0, lng: +0.0, level: 2)).to(equal([0, 1      ]))
                expect(Core.getDeltaIds(lat: +0.0, lng: +0.0, level: 3)).to(equal([0, 1, 1   ]))
                expect(Core.getDeltaIds(lat: +0.0, lng: +0.0, level: 4)).to(equal([0, 1, 1, 1]))
            }
        }

        describe(".getDeltaCode") {
            it("緯度経度からGeoDeltaコードを取得する") {
                expect(try! Core.getDeltaCode(lat: +45.0, lng:   +0.0, level: 1)).to(equal("Z"))
                expect(try! Core.getDeltaCode(lat: +45.0, lng:  +90.0, level: 1)).to(equal("Y"))
                expect(try! Core.getDeltaCode(lat: +45.0, lng: +180.0, level: 1)).to(equal("X"))
                expect(try! Core.getDeltaCode(lat: +45.0, lng:  -90.0, level: 1)).to(equal("W"))
                expect(try! Core.getDeltaCode(lat: +45.0, lng: -180.0, level: 1)).to(equal("X"))

                expect(try! Core.getDeltaCode(lat: -45.0, lng:   +0.0, level: 1)).to(equal("V"))
                expect(try! Core.getDeltaCode(lat: -45.0, lng:  +90.0, level: 1)).to(equal("T"))
                expect(try! Core.getDeltaCode(lat: -45.0, lng: +180.0, level: 1)).to(equal("S"))
                expect(try! Core.getDeltaCode(lat: -45.0, lng:  -90.0, level: 1)).to(equal("R"))
                expect(try! Core.getDeltaCode(lat: -45.0, lng: -180.0, level: 1)).to(equal("S"))

                expect(try! Core.getDeltaCode(lat: +0.0, lng: +0.0, level: 1)).to(equal("Z"  ))
                expect(try! Core.getDeltaCode(lat: +0.0, lng: +0.0, level: 2)).to(equal("ZM" ))
                expect(try! Core.getDeltaCode(lat: +0.0, lng: +0.0, level: 3)).to(equal("Z7" ))
                expect(try! Core.getDeltaCode(lat: +0.0, lng: +0.0, level: 4)).to(equal("Z7M"))
            }
        }

        describe(".getCenterFromDeltaIds") {
            it("デルタID列から中心座標を取得する") {
                expect(Core.getCenterFromDeltaIds([0]).lat).to(beCloseTo( +71.480, within: 1e-3))
                expect(Core.getCenterFromDeltaIds([0]).lng).to(beCloseTo(  +0.000, within: 1e-3))
                expect(Core.getCenterFromDeltaIds([1]).lat).to(beCloseTo( +46.024, within: 1e-3))
                expect(Core.getCenterFromDeltaIds([1]).lng).to(beCloseTo( +90.000, within: 1e-3))
                expect(Core.getCenterFromDeltaIds([2]).lat).to(beCloseTo( +71.480, within: 1e-3))
                expect(Core.getCenterFromDeltaIds([2]).lng).to(beCloseTo(180.000, within: 1e-3)) // TODO: Ruby版と符号が逆
                expect(Core.getCenterFromDeltaIds([3]).lat).to(beCloseTo( +46.024, within: 1e-3))
                expect(Core.getCenterFromDeltaIds([3]).lng).to(beCloseTo( -90.000, within: 1e-3))

                expect(Core.getCenterFromDeltaIds([4]).lat).to(beCloseTo( -71.480, within: 1e-3))
                expect(Core.getCenterFromDeltaIds([4]).lng).to(beCloseTo(  +0.000, within: 1e-3))
                expect(Core.getCenterFromDeltaIds([5]).lat).to(beCloseTo( -46.024, within: 1e-3))
                expect(Core.getCenterFromDeltaIds([5]).lng).to(beCloseTo( +90.000, within: 1e-3))
                expect(Core.getCenterFromDeltaIds([6]).lat).to(beCloseTo( -71.480, within: 1e-3))
                expect(Core.getCenterFromDeltaIds([6]).lng).to(beCloseTo(180.000, within: 1e-3)) // TODO: Ruby版と符号が逆
                expect(Core.getCenterFromDeltaIds([7]).lat).to(beCloseTo( -46.024, within: 1e-3))
                expect(Core.getCenterFromDeltaIds([7]).lng).to(beCloseTo( -90.000, within: 1e-3))

                expect(Core.getCenterFromDeltaIds([0, 0]).lat).to(beCloseTo(+71.480, within: 1e-3))
                expect(Core.getCenterFromDeltaIds([0, 0]).lng).to(beCloseTo( +0.000, within: 1e-3))
                expect(Core.getCenterFromDeltaIds([0, 0, 0]).lat).to(beCloseTo(+71.480, within: 1e-3))
                expect(Core.getCenterFromDeltaIds([0, 0, 0]).lng).to(beCloseTo( +0.000, within: 1e-3))
            }
        }

        describe(".getCenterFromDeltaCode") {
            it("GeoDeltaコードから中心座標を取得する") {
                expect(try! Core.getCenterFromDeltaCode("Z").lat).to(beCloseTo( +71.480, within: 1e-3))
                expect(try! Core.getCenterFromDeltaCode("Z").lng).to(beCloseTo(  +0.000, within: 1e-3))
                expect(try! Core.getCenterFromDeltaCode("Y").lat).to(beCloseTo( +46.024, within: 1e-3))
                expect(try! Core.getCenterFromDeltaCode("Y").lng).to(beCloseTo( +90.000, within: 1e-3))
                expect(try! Core.getCenterFromDeltaCode("X").lat).to(beCloseTo( +71.480, within: 1e-3))
                expect(try! Core.getCenterFromDeltaCode("X").lng).to(beCloseTo(180.000, within: 1e-3)) // TODO: Ruby版と符号が逆
                expect(try! Core.getCenterFromDeltaCode("W").lat).to(beCloseTo( +46.024, within: 1e-3))
                expect(try! Core.getCenterFromDeltaCode("W").lng).to(beCloseTo( -90.000, within: 1e-3))

                expect(try! Core.getCenterFromDeltaCode("V").lat).to(beCloseTo( -71.480, within: 1e-3))
                expect(try! Core.getCenterFromDeltaCode("V").lng).to(beCloseTo(  +0.000, within: 1e-3))
                expect(try! Core.getCenterFromDeltaCode("T").lat).to(beCloseTo( -46.024, within: 1e-3))
                expect(try! Core.getCenterFromDeltaCode("T").lng).to(beCloseTo( +90.000, within: 1e-3))
                expect(try! Core.getCenterFromDeltaCode("S").lat).to(beCloseTo( -71.480, within: 1e-3))
                expect(try! Core.getCenterFromDeltaCode("S").lng).to(beCloseTo(180.000, within: 1e-3)) // TODO: Ruby版と符号が逆
                expect(try! Core.getCenterFromDeltaCode("R").lat).to(beCloseTo( -46.024, within: 1e-3))
                expect(try! Core.getCenterFromDeltaCode("R").lng).to(beCloseTo( -90.000, within: 1e-3))

                expect(try! Core.getCenterFromDeltaCode("ZK").lat).to(beCloseTo(+71.480, within: 1e-3))
                expect(try! Core.getCenterFromDeltaCode("ZK").lng).to(beCloseTo( +0.000, within: 1e-3))
                expect(try! Core.getCenterFromDeltaCode("Z2").lat).to(beCloseTo(+71.480, within: 1e-3))
                expect(try! Core.getCenterFromDeltaCode("Z2").lng).to(beCloseTo( +0.000, within: 1e-3))
            }
        }
    }
}

/*
class GeoDeltaTest < Test::Unit::TestCase
  def test_getCoordinatesFromIds__1
    delta0 = Core.getCoordinatesFromIds([0])
    assert_equal(4, delta0.size)
    assert_equal(2, delta0[0].size)
    assert_equal(2, delta0[1].size)
    assert_equal(2, delta0[2].size)
    assert_equal(2, delta0[3].size)
    assert_in_delta( +71.480, delta0[0][0], 1e-3)
    assert_in_delta(  +0.000, delta0[0][1], 1e-3)
    assert_in_delta(  +0.000, delta0[1][0], 1e-3)
    assert_in_delta(  +0.000, delta0[1][1], 1e-3)
    assert_in_delta( +82.467, delta0[2][0], 1e-3)
    assert_in_delta( -90.000, delta0[2][1], 1e-3)
    assert_in_delta( +82.467, delta0[3][0], 1e-3)
    assert_in_delta( +90.000, delta0[3][1], 1e-3)

    delta4 = Core.getCoordinatesFromIds([4])
    assert_in_delta( -71.480, delta4[0][0], 1e-3)
    assert_in_delta(  +0.000, delta4[0][1], 1e-3)
    assert_in_delta(  +0.000, delta4[1][0], 1e-3)
    assert_in_delta(  +0.000, delta4[1][1], 1e-3)
    assert_in_delta( -82.467, delta4[2][0], 1e-3)
    assert_in_delta( +90.000, delta4[2][1], 1e-3)
    assert_in_delta( -82.467, delta4[3][0], 1e-3)
    assert_in_delta( -90.000, delta4[3][1], 1e-3)
  end

  def test_getCoordinatesFromIds__2
    delta = (0..7).map { |id| Core.getCoordinatesFromIds([id]) }
    assert_equal(delta[0][1], delta[1][3])
    assert_equal(delta[0][1], delta[3][2])
    assert_equal(delta[0][1], delta[4][1])
    assert_equal(delta[0][1], delta[5][2])
    assert_equal(delta[0][1], delta[7][3])
    assert_equal(delta[0][2], delta[2][3])
    assert_equal(delta[0][2], delta[3][1])
    assert_equal(delta[0][3], delta[1][1])
    assert_equal(delta[0][3], delta[2][2])
    assert_equal(delta[1][2], delta[2][1])
    assert_equal(delta[1][2], delta[3][3])
    assert_equal(delta[1][2], delta[5][3])
    assert_equal(delta[1][2], delta[6][1])
    assert_equal(delta[1][2], delta[7][2])
    assert_equal(delta[4][3], delta[6][2])
    assert_equal(delta[4][3], delta[7][1])
    assert_equal(delta[4][2], delta[5][1])
    assert_equal(delta[4][2], delta[6][3])
  end

  def test_getCoordinatesFromIds__3
    delta = (0..3).map { |id| Core.getCoordinatesFromIds([0, id]) }
    assert_equal(delta[0][1], delta[2][3])
    assert_equal(delta[0][1], delta[3][2])
    assert_equal(delta[0][2], delta[1][3])
    assert_equal(delta[0][2], delta[3][1])
    assert_equal(delta[0][3], delta[1][2])
    assert_equal(delta[0][3], delta[2][1])
  end

  def test_getCoordinatesFromCode
    assert_equal(
      Core.getCoordinatesFromIds([0]),
      Core.getCoordinatesFromCode("Z"))
    assert_equal(
      Core.getCoordinatesFromIds([0, 1, 2]),
      Core.getCoordinatesFromCode("Z8"))
  end

  def test_rush
    1000.times {
      lat1  = rand * 180.0 -  90.0
      lng1  = rand * 360.0 - 180.0
      level = rand(30) + 1
      code1 = Core.get_delta_code(lat1, lng1, level)
      lat2,
      lng2  = Core.getCenterFromDeltaCode(code1)
      code2 = Core.get_delta_code(lat2, lng2, level)
      lat3,
      lng3  = Core.getCenterFromDeltaCode(code2)
      assert_equal(code1, code2)
      assert_equal([lat2, lng2], [lat3, lng3])
    }
  end
end
*/

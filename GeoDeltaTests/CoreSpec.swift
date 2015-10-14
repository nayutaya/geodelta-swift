
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
                expect(Core.getDeltaCode(lat: +45.0, lng:   +0.0, level: 1)).to(equal("Z"))
                expect(Core.getDeltaCode(lat: +45.0, lng:  +90.0, level: 1)).to(equal("Y"))
                expect(Core.getDeltaCode(lat: +45.0, lng: +180.0, level: 1)).to(equal("X"))
                expect(Core.getDeltaCode(lat: +45.0, lng:  -90.0, level: 1)).to(equal("W"))
                expect(Core.getDeltaCode(lat: +45.0, lng: -180.0, level: 1)).to(equal("X"))

                expect(Core.getDeltaCode(lat: -45.0, lng:   +0.0, level: 1)).to(equal("V"))
                expect(Core.getDeltaCode(lat: -45.0, lng:  +90.0, level: 1)).to(equal("T"))
                expect(Core.getDeltaCode(lat: -45.0, lng: +180.0, level: 1)).to(equal("S"))
                expect(Core.getDeltaCode(lat: -45.0, lng:  -90.0, level: 1)).to(equal("R"))
                expect(Core.getDeltaCode(lat: -45.0, lng: -180.0, level: 1)).to(equal("S"))

                expect(Core.getDeltaCode(lat: +0.0, lng: +0.0, level: 1)).to(equal("Z"  ))
                expect(Core.getDeltaCode(lat: +0.0, lng: +0.0, level: 2)).to(equal("ZM" ))
                expect(Core.getDeltaCode(lat: +0.0, lng: +0.0, level: 3)).to(equal("Z7" ))
                expect(Core.getDeltaCode(lat: +0.0, lng: +0.0, level: 4)).to(equal("Z7M"))
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
    }
}

/*
class GeoDeltaTest < Test::Unit::TestCase
  def getCenterFromDeltaCode
    lat, lng = Core.getCenterFromDeltaCode("Z")
    assert_in_delta( +71.480, lat, 1.0E-3)
    assert_in_delta(  +0.000, lng, 1.0E-3)
    lat, lng = Core.getCenterFromDeltaCode("Y")
    assert_in_delta( +46.024, lat, 1.0E-3)
    assert_in_delta( +90.000, lng, 1.0E-3)
    lat, lng = Core.getCenterFromDeltaCode("X")
    assert_in_delta( +71.480, lat, 1.0E-3)
    assert_in_delta(-180.000, lng, 1.0E-3)
    lat, lng = Core.getCenterFromDeltaCode("W")
    assert_in_delta( +46.024, lat, 1.0E-3)
    assert_in_delta( -90.000, lng, 1.0E-3)

    lat, lng = Core.getCenterFromDeltaCode("V")
    assert_in_delta( -71.480, lat, 1.0E-3)
    assert_in_delta(  +0.000, lng, 1.0E-3)
    lat, lng = Core.getCenterFromDeltaCode("T")
    assert_in_delta( -46.024, lat, 1.0E-3)
    assert_in_delta( +90.000, lng, 1.0E-3)
    lat, lng = Core.getCenterFromDeltaCode("S")
    assert_in_delta( -71.480, lat, 1.0E-3)
    assert_in_delta(-180.000, lng, 1.0E-3)
    lat, lng = Core.getCenterFromDeltaCode("R")
    assert_in_delta( -46.024, lat, 1.0E-3)
    assert_in_delta( -90.000, lng, 1.0E-3)

    lat, lng = Core.getCenterFromDeltaCode("ZK")
    assert_in_delta(+71.480, lat, 1.0E-3)
    assert_in_delta( +0.000, lng, 1.0E-3)
    lat, lng = Core.getCenterFromDeltaCode("Z2")
    assert_in_delta(+71.480, lat, 1.0E-3)
    assert_in_delta( +0.000, lng, 1.0E-3)
  end

  def test_getCoordinatesFromIds__1
    delta0 = Core.getCoordinatesFromIds([0])
    assert_equal(4, delta0.size)
    assert_equal(2, delta0[0].size)
    assert_equal(2, delta0[1].size)
    assert_equal(2, delta0[2].size)
    assert_equal(2, delta0[3].size)
    assert_in_delta( +71.480, delta0[0][0], 1.0E-3)
    assert_in_delta(  +0.000, delta0[0][1], 1.0E-3)
    assert_in_delta(  +0.000, delta0[1][0], 1.0E-3)
    assert_in_delta(  +0.000, delta0[1][1], 1.0E-3)
    assert_in_delta( +82.467, delta0[2][0], 1.0E-3)
    assert_in_delta( -90.000, delta0[2][1], 1.0E-3)
    assert_in_delta( +82.467, delta0[3][0], 1.0E-3)
    assert_in_delta( +90.000, delta0[3][1], 1.0E-3)

    delta4 = Core.getCoordinatesFromIds([4])
    assert_in_delta( -71.480, delta4[0][0], 1.0E-3)
    assert_in_delta(  +0.000, delta4[0][1], 1.0E-3)
    assert_in_delta(  +0.000, delta4[1][0], 1.0E-3)
    assert_in_delta(  +0.000, delta4[1][1], 1.0E-3)
    assert_in_delta( -82.467, delta4[2][0], 1.0E-3)
    assert_in_delta( +90.000, delta4[2][1], 1.0E-3)
    assert_in_delta( -82.467, delta4[3][0], 1.0E-3)
    assert_in_delta( -90.000, delta4[3][1], 1.0E-3)
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


import Quick
import Nimble
@testable import GeoDelta

class EncoderSpec : QuickSpec {
    override func spec() {
        describe(".encodeWorldDelta") {
            it("ワールドデルタIDをエンコードする") {
                expect(try! Encoder.encodeWorldDelta(0)).to(equal("Z"))
                expect(try! Encoder.encodeWorldDelta(1)).to(equal("Y"))
                expect(try! Encoder.encodeWorldDelta(2)).to(equal("X"))
                expect(try! Encoder.encodeWorldDelta(3)).to(equal("W"))
                expect(try! Encoder.encodeWorldDelta(4)).to(equal("V"))
                expect(try! Encoder.encodeWorldDelta(5)).to(equal("T"))
                expect(try! Encoder.encodeWorldDelta(6)).to(equal("S"))
                expect(try! Encoder.encodeWorldDelta(7)).to(equal("R"))
            }
            it("異常値の場合、エラーをスローする") {
                expect { try Encoder.encodeWorldDelta(-1) }.to(throwError())
                expect { try Encoder.encodeWorldDelta( 8) }.to(throwError())
            }
        }

        describe(".decodeWorldDelta") {
            it("ワールドデルタコードをデコードする") {
                expect(try! Encoder.decodeWorldDelta("Z")).to(equal(0))
                expect(try! Encoder.decodeWorldDelta("Y")).to(equal(1))
                expect(try! Encoder.decodeWorldDelta("X")).to(equal(2))
                expect(try! Encoder.decodeWorldDelta("W")).to(equal(3))
                expect(try! Encoder.decodeWorldDelta("V")).to(equal(4))
                expect(try! Encoder.decodeWorldDelta("T")).to(equal(5))
                expect(try! Encoder.decodeWorldDelta("S")).to(equal(6))
                expect(try! Encoder.decodeWorldDelta("R")).to(equal(7))
            }
            it("異常値の場合、エラーをスローする") {
                expect { try Encoder.decodeWorldDelta("z") }.to(throwError())
                expect { try Encoder.decodeWorldDelta("A") }.to(throwError())
            }
        }

        describe("encode and decode world delta") {
            it("") {
                for var id = 0; id <= 7; id++ {
                    let encoded1 = try! Encoder.encodeWorldDelta(id)
                    let decoded1 = try! Encoder.decodeWorldDelta(encoded1)
                    let encoded2 = try! Encoder.encodeWorldDelta(decoded1)
                    expect(encoded2).to(equal(encoded1))
                }
            }
        }
        
        describe(".encodeSubDelta") {
            it("サブデルタID列をエンコードする") {
                expect(try! Encoder.encodeSubDelta([0, 0])).to(equal("2"))
                expect(try! Encoder.encodeSubDelta([0, 1])).to(equal("3"))
                expect(try! Encoder.encodeSubDelta([0, 2])).to(equal("4"))
                expect(try! Encoder.encodeSubDelta([0, 3])).to(equal("5"))
                expect(try! Encoder.encodeSubDelta([1, 0])).to(equal("6"))
                expect(try! Encoder.encodeSubDelta([1, 1])).to(equal("7"))
                expect(try! Encoder.encodeSubDelta([1, 2])).to(equal("8"))
                expect(try! Encoder.encodeSubDelta([1, 3])).to(equal("A"))
                expect(try! Encoder.encodeSubDelta([2, 0])).to(equal("B"))
                expect(try! Encoder.encodeSubDelta([2, 1])).to(equal("C"))
                expect(try! Encoder.encodeSubDelta([2, 2])).to(equal("D"))
                expect(try! Encoder.encodeSubDelta([2, 3])).to(equal("E"))
                expect(try! Encoder.encodeSubDelta([3, 0])).to(equal("F"))
                expect(try! Encoder.encodeSubDelta([3, 1])).to(equal("G"))
                expect(try! Encoder.encodeSubDelta([3, 2])).to(equal("H"))
                expect(try! Encoder.encodeSubDelta([3, 3])).to(equal("J"))
            }
            it("サブデルタID列をエンコードする") {
                expect(try! Encoder.encodeSubDelta([0])).to(equal("K"))
                expect(try! Encoder.encodeSubDelta([1])).to(equal("M"))
                expect(try! Encoder.encodeSubDelta([2])).to(equal("N"))
                expect(try! Encoder.encodeSubDelta([3])).to(equal("P"))
            }
            it("サブデルタID列をエンコードする") {
                expect(try! Encoder.encodeSubDelta([0, 0, 0   ])).to(equal("2K"))
                expect(try! Encoder.encodeSubDelta([0, 0, 0, 0])).to(equal("22"))
                expect(try! Encoder.encodeSubDelta([0, 1, 2   ])).to(equal("3N"))
                expect(try! Encoder.encodeSubDelta([0, 1, 2, 3])).to(equal("3E"))
            }
            it("異常値の場合、エラーをスローする") {
                expect { try Encoder.encodeSubDelta([]) }.to(throwError())
                expect { try Encoder.encodeSubDelta([-1]) }.to(throwError())
                expect { try Encoder.encodeSubDelta([ 4]) }.to(throwError())
                expect { try Encoder.encodeSubDelta([-1,  0]) }.to(throwError())
                expect { try Encoder.encodeSubDelta([ 4,  0]) }.to(throwError())
                expect { try Encoder.encodeSubDelta([ 0, -1]) }.to(throwError())
                expect { try Encoder.encodeSubDelta([ 0,  4]) }.to(throwError())
            }
        }

        describe(".decodeSubDelta") {
            it("サブデルタコードをデコードする") {
                expect(try! Encoder.decodeSubDelta("2")).to(equal([0, 0]))
                expect(try! Encoder.decodeSubDelta("3")).to(equal([0, 1]))
                expect(try! Encoder.decodeSubDelta("4")).to(equal([0, 2]))
                expect(try! Encoder.decodeSubDelta("5")).to(equal([0, 3]))
                expect(try! Encoder.decodeSubDelta("6")).to(equal([1, 0]))
                expect(try! Encoder.decodeSubDelta("7")).to(equal([1, 1]))
                expect(try! Encoder.decodeSubDelta("8")).to(equal([1, 2]))
                expect(try! Encoder.decodeSubDelta("A")).to(equal([1, 3]))
                expect(try! Encoder.decodeSubDelta("B")).to(equal([2, 0]))
                expect(try! Encoder.decodeSubDelta("C")).to(equal([2, 1]))
                expect(try! Encoder.decodeSubDelta("D")).to(equal([2, 2]))
                expect(try! Encoder.decodeSubDelta("E")).to(equal([2, 3]))
                expect(try! Encoder.decodeSubDelta("F")).to(equal([3, 0]))
                expect(try! Encoder.decodeSubDelta("G")).to(equal([3, 1]))
                expect(try! Encoder.decodeSubDelta("H")).to(equal([3, 2]))
                expect(try! Encoder.decodeSubDelta("J")).to(equal([3, 3]))
            }
            it("サブデルタコードをデコードする") {
                expect(try! Encoder.decodeSubDelta("K")).to(equal([0]))
                expect(try! Encoder.decodeSubDelta("M")).to(equal([1]))
                expect(try! Encoder.decodeSubDelta("N")).to(equal([2]))
                expect(try! Encoder.decodeSubDelta("P")).to(equal([3]))
            }
            it("サブデルタコードをデコードする") {
                expect(try! Encoder.decodeSubDelta("2K")).to(equal([0, 0, 0   ]))
                expect(try! Encoder.decodeSubDelta("22")).to(equal([0, 0, 0, 0]))
                expect(try! Encoder.decodeSubDelta("3N")).to(equal([0, 1, 2   ]))
                expect(try! Encoder.decodeSubDelta("3E")).to(equal([0, 1, 2, 3]))
            }
            it("異常値の場合、エラーをスローする") {
                expect { try Encoder.decodeSubDelta("") }.to(throwError())
                expect { try Encoder.decodeSubDelta("1") }.to(throwError())
                expect { try Encoder.decodeSubDelta("Z") }.to(throwError())
            }
        }

        describe(".encode") {
            it("デルタID列をエンコードする") {
                expect(try! Encoder.encode([0         ])).to(equal("Z"))
                expect(try! Encoder.encode([0, 1      ])).to(equal("ZM"))
                expect(try! Encoder.encode([0, 1, 2   ])).to(equal("Z8"))
                expect(try! Encoder.encode([0, 1, 2, 3])).to(equal("Z8P"))
                expect(try! Encoder.encode([7         ])).to(equal("R"))
                expect(try! Encoder.encode([7, 3      ])).to(equal("RP"))
                expect(try! Encoder.encode([7, 3, 2   ])).to(equal("RH"))
                expect(try! Encoder.encode([7, 3, 2, 1])).to(equal("RHM"))
            }
            it("異常値の場合、nilを返す") {
                expect { try Encoder.encode([]) }.to(throwError())
            }
        }

        describe(".decode") {
            it("GeoDeltaコードをデコードする") {
                expect(try! Encoder.decode("Z"  )).to(equal([0         ]))
                expect(try! Encoder.decode("ZM" )).to(equal([0, 1      ]))
                expect(try! Encoder.decode("Z8" )).to(equal([0, 1, 2   ]))
                expect(try! Encoder.decode("Z8P")).to(equal([0, 1, 2, 3]))
                expect(try! Encoder.decode("R"  )).to(equal([7         ]))
                expect(try! Encoder.decode("RP" )).to(equal([7, 3      ]))
                expect(try! Encoder.decode("RH" )).to(equal([7, 3, 2   ]))
                expect(try! Encoder.decode("RHM")).to(equal([7, 3, 2, 1]))
            }
            it("異常値の場合、nilを返す") {
                expect { try Encoder.decode("") }.to(throwError())
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
describe("encoder", function() {
//    @Test
//    public void allEncodeAndDecodeSubDelta__level2()
//    {
//        for ( int id1 = 0; id1 <= 3; id1++ )
//        {
//            final byte[] ids = {(byte)id1};
//            final String encoded1 = geodelta.encoder.encodeSubDelta(ids);
//            final byte[] decoded1 = geodelta.encoder.decodeSubDelta(encoded1);
//            final String encoded2 = geodelta.encoder.encodeSubDelta(decoded1);
//            assertEquals(encoded1, encoded2);
//        }
//    }
//    @Test
//    public void allEncodeAndDecodeSubDelta__level3()
//    {
//        for ( int id1 = 0; id1 <= 3; id1++ )
//        {
//            for ( int id2 = 0; id2 <= 3; id2++ )
//            {
//                final byte[] ids = {(byte)id1, (byte)id2};
//                final String encoded1 = geodelta.encoder.encodeSubDelta(ids);
//                final byte[] decoded1 = geodelta.encoder.decodeSubDelta(encoded1);
//                final String encoded2 = geodelta.encoder.encodeSubDelta(decoded1);
//                assertEquals(encoded1, encoded2);
//            }
//        }
//    }

//    @Test
//    public void randomEncodeAndDecode()
//    {
//        final Random r = new Random();
//        for ( int i = 0; i < 1000; i++ )
//        {
//            final byte[] ids = createRandomDeltaIds(r, 20);
//            final String encoded1 = geodelta.encoder.encode(ids);
//            final byte[] decoded1 = geodelta.encoder.decode(encoded1);
//            final String encoded2 = geodelta.encoder.encode(decoded1);
//            assertArrayEquals(ids, decoded1);
//            assertEquals(encoded1, encoded2);
//        }
//    }
//    // FIXME: refactoring
//    private byte[] createRandomDeltaIds(final Random random, final int level)
//    {
//        final byte[] ids = new byte[random.nextInt(level) + 1];
//        ids[0] = (byte)random.nextInt(8);
//        for ( int i = 1; i < ids.length; i++ )
//        {
//            ids[i] = (byte)random.nextInt(4);
//        }
//        return ids;
//    }

*/

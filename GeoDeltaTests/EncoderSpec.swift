
import Quick
import Nimble
@testable import GeoDelta

class EncoderSpec : QuickSpec {
    override func spec() {
        describe(".encodeWorldDelta") {
            it("ワールドデルタIDをエンコードする") {
                expect(Encoder.encodeWorldDelta(0)).to(equal("Z"))
                expect(Encoder.encodeWorldDelta(1)).to(equal("Y"))
                expect(Encoder.encodeWorldDelta(2)).to(equal("X"))
                expect(Encoder.encodeWorldDelta(3)).to(equal("W"))
                expect(Encoder.encodeWorldDelta(4)).to(equal("V"))
                expect(Encoder.encodeWorldDelta(5)).to(equal("T"))
                expect(Encoder.encodeWorldDelta(6)).to(equal("S"))
                expect(Encoder.encodeWorldDelta(7)).to(equal("R"))
            }
        }

        describe(".decodeWorldDelta") {
            it("ワールドデルタコードをデコードする") {
                expect(Encoder.decodeWorldDelta("Z")).to(equal(0))
                expect(Encoder.decodeWorldDelta("Y")).to(equal(1))
                expect(Encoder.decodeWorldDelta("X")).to(equal(2))
                expect(Encoder.decodeWorldDelta("W")).to(equal(3))
                expect(Encoder.decodeWorldDelta("V")).to(equal(4))
                expect(Encoder.decodeWorldDelta("T")).to(equal(5))
                expect(Encoder.decodeWorldDelta("S")).to(equal(6))
                expect(Encoder.decodeWorldDelta("R")).to(equal(7))
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

//TODO:
//function test_encodeWorldDelta__invalidArg1()
//{
//  try
//  {
//    geodelta.encoder.encodeWorldDelta(-1);
//  }
//  catch ( e )
//  {
//    return;
//  }
//  fail("exception not raised");
//}

// TODO:
//function test_encodeWorldDelta__invalidArg2()
//{
//  try
//  {
//    geodelta.encoder.encodeWorldDelta(8);
//  }
//  catch ( e )
//  {
//    return;
//  }
//  fail("exception not raised");
//}

// TODO:
//    @Test(expected = IllegalArgumentException.class)
//    public void decodeWorldDelta__invalidArg1()
//    {
//        geodelta.encoder.decodeWorldDelta("z");
//    }
//    @Test(expected = IllegalArgumentException.class)
//    public void decodeWorldDelta__invalidArg2()
//    {
//        geodelta.encoder.decodeWorldDelta("A");
//    }
//    @Test
//    public void allEncodeAndDecodeWorldDelta()
//    {
//        for ( int id = 0; id <= 7; id++ )
//        {
//            final char encoded1 = geodelta.encoder.encodeWorldDelta((byte)id);
//            final byte decoded1 = geodelta.encoder.decodeWorldDelta(encoded1);
//            final char encoded2 = geodelta.encoder.encodeWorldDelta(decoded1);
//            assertEquals(encoded1, encoded2);
//        }
//    }

  describe(".encodeSubDelta", function() {
    it("サブデルタID列をエンコードする", function() {
      assert.equal("2", encoder.encodeSubDelta([0, 0]));
      assert.equal("3", encoder.encodeSubDelta([0, 1]));
      assert.equal("4", encoder.encodeSubDelta([0, 2]));
      assert.equal("5", encoder.encodeSubDelta([0, 3]));
      assert.equal("6", encoder.encodeSubDelta([1, 0]));
      assert.equal("7", encoder.encodeSubDelta([1, 1]));
      assert.equal("8", encoder.encodeSubDelta([1, 2]));
      assert.equal("A", encoder.encodeSubDelta([1, 3]));
      assert.equal("B", encoder.encodeSubDelta([2, 0]));
      assert.equal("C", encoder.encodeSubDelta([2, 1]));
      assert.equal("D", encoder.encodeSubDelta([2, 2]));
      assert.equal("E", encoder.encodeSubDelta([2, 3]));
      assert.equal("F", encoder.encodeSubDelta([3, 0]));
      assert.equal("G", encoder.encodeSubDelta([3, 1]));
      assert.equal("H", encoder.encodeSubDelta([3, 2]));
      assert.equal("J", encoder.encodeSubDelta([3, 3]));
    });
    it("サブデルタID列をエンコードする", function() {
      assert.equal("K", encoder.encodeSubDelta([0]));
      assert.equal("M", encoder.encodeSubDelta([1]));
      assert.equal("N", encoder.encodeSubDelta([2]));
      assert.equal("P", encoder.encodeSubDelta([3]));
    });
    it("サブデルタID列をエンコードする", function() {
      assert.equal("2K", encoder.encodeSubDelta([0, 0, 0]));
      assert.equal("22", encoder.encodeSubDelta([0, 0, 0, 0]));
      assert.equal("3N", encoder.encodeSubDelta([0, 1, 2]));
      assert.equal("3E", encoder.encodeSubDelta([0, 1, 2, 3]));
    });
  });

//    @Test(expected = IllegalArgumentException.class)
//    public void encodeSubDelta__invalidArg1()
//    {
//        geodelta.encoder.encodeSubDelta(null);
//    }
//    @Test(expected = IllegalArgumentException.class)
//    public void encodeSubDelta__invalidArg2()
//    {
//        geodelta.encoder.encodeSubDelta(new byte[0]);
//    }
//    @Test(expected = IllegalArgumentException.class)
//    public void encodeSubDelta__invalidArg3()
//    {
//        geodelta.encoder.encodeSubDelta(new byte[] {-1});
//    }
//    @Test(expected = IllegalArgumentException.class)
//    public void encodeSubDelta__invalidArg4()
//    {
//        geodelta.encoder.encodeSubDelta(new byte[] {4});
//    }


  describe(".decodeSubDelta", function() {
    var assertArrayEquals = function(expected, actual) { expect(actual).to.eql(expected); };
    it("サブデルタコードをデコードする", function() {
      assertArrayEquals([0, 0], encoder.decodeSubDelta("2"));
      assertArrayEquals([0, 1], encoder.decodeSubDelta("3"));
      assertArrayEquals([0, 2], encoder.decodeSubDelta("4"));
      assertArrayEquals([0, 3], encoder.decodeSubDelta("5"));
      assertArrayEquals([1, 0], encoder.decodeSubDelta("6"));
      assertArrayEquals([1, 1], encoder.decodeSubDelta("7"));
      assertArrayEquals([1, 2], encoder.decodeSubDelta("8"));
      assertArrayEquals([1, 3], encoder.decodeSubDelta("A"));
      assertArrayEquals([2, 0], encoder.decodeSubDelta("B"));
      assertArrayEquals([2, 1], encoder.decodeSubDelta("C"));
      assertArrayEquals([2, 2], encoder.decodeSubDelta("D"));
      assertArrayEquals([2, 3], encoder.decodeSubDelta("E"));
      assertArrayEquals([3, 0], encoder.decodeSubDelta("F"));
      assertArrayEquals([3, 1], encoder.decodeSubDelta("G"));
      assertArrayEquals([3, 2], encoder.decodeSubDelta("H"));
      assertArrayEquals([3, 3], encoder.decodeSubDelta("J"));
    });
    it("サブデルタコードをデコードする", function() {
      assertArrayEquals([0], encoder.decodeSubDelta("K"));
      assertArrayEquals([1], encoder.decodeSubDelta("M"));
      assertArrayEquals([2], encoder.decodeSubDelta("N"));
      assertArrayEquals([3], encoder.decodeSubDelta("P"));
    });
    it("サブデルタコードをデコードする", function() {
      assertArrayEquals([0, 0, 0],    encoder.decodeSubDelta("2K"));
      assertArrayEquals([0, 0, 0, 0], encoder.decodeSubDelta("22"));
      assertArrayEquals([0, 1, 2],    encoder.decodeSubDelta("3N"));
      assertArrayEquals([0, 1, 2, 3], encoder.decodeSubDelta("3E"));
    });
  });


//    @Test(expected = IllegalArgumentException.class)
//    public void decodeSubDelta__invalidArg1()
//    {
//        geodelta.encoder.decodeSubDelta(null);
//    }
//    @Test(expected = IllegalArgumentException.class)
//    public void decodeSubDelta__invalidArg2()
//    {
//        geodelta.encoder.decodeSubDelta("");
//    }
//    @Test(expected = IllegalArgumentException.class)
//    public void decodeSubDelta__invalidArg3()
//    {
//        geodelta.encoder.decodeSubDelta("1");
//    }
//    @Test(expected = IllegalArgumentException.class)
//    public void decodeSubDelta__invalidArg4()
//    {
//        geodelta.encoder.decodeSubDelta("Z");
//    }
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


  describe(".encode", function() {
    it("デルタID列をエンコードする", function() {
      assert.equal("Z",   encoder.encode([0]));
      assert.equal("ZM",  encoder.encode([0, 1]));
      assert.equal("Z8",  encoder.encode([0, 1, 2]));
      assert.equal("Z8P", encoder.encode([0, 1, 2, 3]));
      assert.equal("R",   encoder.encode([7]));
      assert.equal("RP",  encoder.encode([7, 3]));
      assert.equal("RH",  encoder.encode([7, 3, 2]));
      assert.equal("RHM", encoder.encode([7, 3, 2, 1]));
    });
  });


//    @Test(expected = IllegalArgumentException.class)
//    public void encode__invalidArg1()
//    {
//        geodelta.encoder.encode(null);
//    }
//    @Test(expected = IllegalArgumentException.class)
//    public void encode__invalidArg2()
//    {
//        geodelta.encoder.encode(new byte[0]);
//    }


  describe(".decode", function() {
    var assertArrayEquals = function(expected, actual) { expect(actual).to.eql(expected); };
    it("GeoDeltaコードをデコードする", function() {
      assertArrayEquals([0],          encoder.decode("Z"));
      assertArrayEquals([0, 1],       encoder.decode("ZM"));
      assertArrayEquals([0, 1, 2],    encoder.decode("Z8"));
      assertArrayEquals([0, 1, 2, 3], encoder.decode("Z8P"));
      assertArrayEquals([7],          encoder.decode("R"));
      assertArrayEquals([7, 3],       encoder.decode("RP"));
      assertArrayEquals([7, 3, 2],    encoder.decode("RH"));
      assertArrayEquals([7, 3, 2, 1], encoder.decode("RHM"));
    });
  });


//    @Test(expected = IllegalArgumentException.class)
//    public void decode__invalidArg1()
//    {
//        geodelta.encoder.decode(null);
//    }
//    @Test(expected = IllegalArgumentException.class)
//    public void decode__invalidArg2()
//    {
//        geodelta.encoder.decode("");
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

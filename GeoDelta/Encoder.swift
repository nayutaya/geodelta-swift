
public class Encoder {
    static let WORLD_DELTA_TABLE = ["Z", "Y", "X", "W", "V", "T", "S", "R"]
    static let SUB_DELTA_TABLE1  = ["K", "M", "N", "P"]
    static let SUB_DELTA_TABLE2  = [["2", "3", "4", "5"], ["6", "7", "8", "A"], ["B", "C", "D", "E"], ["F", "G", "H", "J"]]

    // ワールドデルタIDをエンコードする
    public static func encodeWorldDelta(id: Int) -> String {
        // TODO:
        //    if ( id < 0 || id > 7 ) {
        //    throw "invalid argument (id)";
        //    }
        return WORLD_DELTA_TABLE[id]
    }
    
    // ワールドデルタコードをデコードする
    public static func decodeWorldDelta(code: String) -> Int? {
        if let index = WORLD_DELTA_TABLE.indexOf(code) {
            return index
        } else {
            return nil
        }
    }
    
    // サブデルタID列をエンコードする
    public static func encodeSubDelta(ids: [Int]) -> String {
        // TODO:
        //    if ( ids == null || ids.length == 0 ) {
        //    // TODO: throw new IllegalArgumentException();
        //    }
        var result = ""
        var i = 0
        let len = ids.count
        while ( i < len ) {
            let rest = len - i;
            if rest == 1 {
                result += SUB_DELTA_TABLE1[ids[i]]
            } else {
                result += SUB_DELTA_TABLE2[ids[i]][ids[i + 1]]
            }
            i += 2
        }
        return result
    }
}

/*
// サブデルタコードをデコードする
encoder.decodeSubDelta = function(code) {
  if ( code == null || code == "" ) {
    // TODO: throw new IllegalArgumentException();
    return null;
  }

  var ids = [];
  for ( var i = 0, len = code.length; i < len; i++ ) {
    var ch = code.charAt(i);

    switch ( ch )
    {
      case "2": ids.push(0); ids.push(0); break;
      case "3": ids.push(0); ids.push(1); break;
      case "4": ids.push(0); ids.push(2); break;
      case "5": ids.push(0); ids.push(3); break;
      case "6": ids.push(1); ids.push(0); break;
      case "7": ids.push(1); ids.push(1); break;
      case "8": ids.push(1); ids.push(2); break;
      case "A": ids.push(1); ids.push(3); break;
      case "B": ids.push(2); ids.push(0); break;
      case "C": ids.push(2); ids.push(1); break;
      case "D": ids.push(2); ids.push(2); break;
      case "E": ids.push(2); ids.push(3); break;
      case "F": ids.push(3); ids.push(0); break;
      case "G": ids.push(3); ids.push(1); break;
      case "H": ids.push(3); ids.push(2); break;
      case "J": ids.push(3); ids.push(3); break;
      case "K": ids.push(0); break;
      case "M": ids.push(1); break;
      case "N": ids.push(2); break;
      case "P": ids.push(3); break;
      default: return null; // TODO: throw new IllegalArgumentException();
    }
  }
  return ids;
};

// デルタID列をエンコードする
encoder.encode = function(ids) {
  if ( ids == null || ids.length == 0 ) {
    // TODO: throw new IllegalArgumentException();
    return null;
  }

  var code = "";
  code += encoder.encodeWorldDelta(ids[0]);
  code += _encodeSubDelta(ids, 1);
  return code;
};

// GeoDeltaコードをデコードする
encoder.decode = function(code) {
  if ( code == null || code.length == 0 ) {
    // TODO: throw new IllegalArgumentException();
    return null;
  } else if ( code.length == 1 ) {
    return [encoder.decodeWorldDelta(code.charAt(0))];
  } else {
    var worldId = encoder.decodeWorldDelta(code.charAt(0));
    var subIds  = encoder.decodeSubDelta(code.substring(1));
    return [worldId].concat(subIds);
  }
};

module.exports = encoder;
*/

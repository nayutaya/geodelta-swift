
public class Encoder {
    static let WORLD_DELTA_TABLE = ["Z", "Y", "X", "W", "V", "T", "S", "R"]

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
}

/*
var SUB_DELTA_TABLE1  = ["K", "M", "N", "P"];
var SUB_DELTA_TABLE2  = [["2", "3", "4", "5"], ["6", "7", "8", "A"], ["B", "C", "D", "E"], ["F", "G", "H", "J"]];

// サブデルタID列をエンコードする
var _encodeSubDelta = function(ids, start) {
  var result = "";
  for ( var i = start, len = ids.length; i < len; i += 2 ) {
    var rest = len - i;
    if ( rest == 1 ) {
      result += SUB_DELTA_TABLE1[ids[i]];
    } else {
      result += SUB_DELTA_TABLE2[ids[i]][ids[i + 1]];
    }
  }
  // TODO: throw new IllegalArgumentException();
  return result;
};

// サブデルタID列をエンコードする
encoder.encodeSubDelta = function(ids) {
  if ( ids == null || ids.length == 0 ) {
    // TODO: throw new IllegalArgumentException();
    return null;
  }
  return _encodeSubDelta(ids, 0);
};

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

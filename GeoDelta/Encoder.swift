
import Foundation

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

    // サブデルタコードをデコードする
    public static func decodeSubDelta(code: String) -> [Int] {
        // TODO:
        //    if ( code == null || code == "" ) {
        //    // TODO: throw new IllegalArgumentException();
        //    return null;
        //    }
        var ids:[Int] = []
        for ch in code.characters {
            switch ( ch ) {
            case "2": ids.append(0); ids.append(0)
            case "3": ids.append(0); ids.append(1)
            case "4": ids.append(0); ids.append(2)
            case "5": ids.append(0); ids.append(3)
            case "6": ids.append(1); ids.append(0)
            case "7": ids.append(1); ids.append(1)
            case "8": ids.append(1); ids.append(2)
            case "A": ids.append(1); ids.append(3)
            case "B": ids.append(2); ids.append(0)
            case "C": ids.append(2); ids.append(1)
            case "D": ids.append(2); ids.append(2)
            case "E": ids.append(2); ids.append(3)
            case "F": ids.append(3); ids.append(0)
            case "G": ids.append(3); ids.append(1)
            case "H": ids.append(3); ids.append(2)
            case "J": ids.append(3); ids.append(3)
            case "K": ids.append(0)
            case "M": ids.append(1)
            case "N": ids.append(2)
            case "P": ids.append(3)
            default:
                break;
                // TODO: throw new IllegalArgumentException();
            }
        }
        return ids
    }
}

/*
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

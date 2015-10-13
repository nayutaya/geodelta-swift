
import Foundation

public class Encoder {
    static let WORLD_DELTA_TABLE = ["Z", "Y", "X", "W", "V", "T", "S", "R"]
    static let SUB_DELTA_TABLE1  = ["K", "M", "N", "P"]
    static let SUB_DELTA_TABLE2  = [["2", "3", "4", "5"], ["6", "7", "8", "A"], ["B", "C", "D", "E"], ["F", "G", "H", "J"]]

    enum EncodeError : ErrorType {
        case InvalidId
        case InvalidCode
    }
    
    // ワールドデルタIDをエンコードする
    public static func encodeWorldDelta(id: Int) throws -> String {
        guard id >= 0 else { throw EncodeError.InvalidId }
        guard id <= 7 else { throw EncodeError.InvalidId }
        return WORLD_DELTA_TABLE[id]
    }

    // ワールドデルタコードをデコードする
    public static func decodeWorldDelta(code: String) throws -> Int {
        guard let id = WORLD_DELTA_TABLE.indexOf(code) else {
            throw EncodeError.InvalidCode
        }
        return id
    }

    // サブデルタID列をエンコードする
    public static func encodeSubDelta(ids: [Int]) throws -> String {
        guard ids.count >= 1 else { throw EncodeError.InvalidId }

        var result = ""
        var i = 0
        let len = ids.count
        while i < len {
            let rest = len - i
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
    public static func decodeSubDelta(code: String) throws -> [Int] {
        let chars = code.characters
        guard chars.count >= 1 else { throw EncodeError.InvalidCode }

        var ids:[Int] = []
        for ch in chars {
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
            default: throw EncodeError.InvalidCode
            }
        }
        return ids
    }

    // デルタID列をエンコードする
    public static func encode(ids: [Int]) throws -> String {
        guard ids.count >= 1 else { throw EncodeError.InvalidId }
        var code = ""
        code += try encodeWorldDelta(ids[0])
        if ids.count >= 2 {
            code += try encodeSubDelta(Array(ids.suffix(ids.count - 1)))
        }
        return code
    }
    
    // GeoDeltaコードをデコードする
    public static func decode(code: String) -> [Int]? {
        let chars = code.characters
        guard chars.count >= 1 else { return nil }
        //    if ( code == null || code.length == 0 ) {
        //    // TODO: throw new IllegalArgumentException();
        //    return null;
        if code.characters.count == 1 {
            let w = try! decodeWorldDelta((code as NSString).substringToIndex(1))
            return [w]
        } else {
            let w = try! decodeWorldDelta((code as NSString).substringToIndex(1))
            let s = try! decodeSubDelta((code as NSString).substringFromIndex(1))
            return [w] + s
        }
    }
}

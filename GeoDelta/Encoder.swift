
import Foundation

public class Encoder {
    private static let WORLD_DELTA_TABLE: [Character] = ["Z", "Y", "X", "W", "V", "T", "S", "R"]
    private static let SUB_DELTA_TABLE1: [Character]  = ["K", "M", "N", "P"]
    private static let SUB_DELTA_TABLE2: [[Character]]  = [["2", "3", "4", "5"], ["6", "7", "8", "A"], ["B", "C", "D", "E"], ["F", "G", "H", "J"]]
    
    private static let WORLD_DELTA_MAP = Encoder.createWorldDeltaMap()
    private static let SUB_DELTA_MAP = Encoder.createSubDeltaMap()
    
    private static func createWorldDeltaMap() -> [Character:UInt8] {
        var map = [Character:UInt8]()
        for var i = 0; i <= 7; i++ {
            map[WORLD_DELTA_TABLE[i]] = UInt8(i)
        }
        return map
    }
    
    private static func createSubDeltaMap() -> [Character:[UInt8]] {
        var map = [Character:[UInt8]]()
        for var i = 0; i <= 3; i++ {
            map[SUB_DELTA_TABLE1[i]] = [UInt8(i)]
        }
        for var i = 0; i <= 3; i++ {
            for var j = 0; j <= 3; j++ {
                map[SUB_DELTA_TABLE2[i][j]] = [UInt8(i), UInt8(j)]
            }
        }
        return map
    }
    
    public enum EncodeError : ErrorType {
        case InvalidArguments
    }

    // ワールドデルタIDをエンコードする
    public static func encodeWorldDelta(id: UInt8) throws -> Character {
        guard id <= 7 else { throw EncodeError.InvalidArguments }
        return WORLD_DELTA_TABLE[Int(id)]
    }

    // ワールドデルタコードをデコードする
    public static func decodeWorldDelta(code: Character) throws -> UInt8 {
        guard let id = WORLD_DELTA_MAP[code] else { throw EncodeError.InvalidArguments }
        return id
    }

    private static func encodeSubDelta1(id: UInt8) throws -> Character {
        guard id <= 3 else { throw EncodeError.InvalidArguments }
        return SUB_DELTA_TABLE1[Int(id)]
    }

    private static func encodeSubDelta2(id1: UInt8, _ id2: UInt8) throws -> Character {
        guard id1 <= 3 else { throw EncodeError.InvalidArguments }
        guard id2 <= 3 else { throw EncodeError.InvalidArguments }
        return SUB_DELTA_TABLE2[Int(id1)][Int(id2)]
    }

    // サブデルタID列をエンコードする
    public static func encodeSubDelta(ids: [UInt8]) throws -> String {
        let length = ids.count
        guard length >= 1 else { throw EncodeError.InvalidArguments }

        var result = ""
        for var i = 0; i < length; i += 2 {
            let rest = length - i
            if rest == 1 {
                result += String(try encodeSubDelta1(ids[i]))
            } else {
                result += String(try encodeSubDelta2(ids[i], ids[i + 1]))
            }
        }
        
        return result
    }

    // サブデルタコードをデコードする
    public static func decodeSubDelta(code: String) throws -> [UInt8] {
        let chars = code.characters
        guard chars.count >= 1 else { throw EncodeError.InvalidArguments }

        var ids: [UInt8] = []
        for ch in chars {
            guard let subIds = Encoder.SUB_DELTA_MAP[ch] else {
                throw EncodeError.InvalidArguments
            }
            ids += subIds
        }
        
        return ids
    }

    // デルタID列をエンコードする
    public static func encode(ids: [UInt8]) throws -> String {
        let length = ids.count
        guard length >= 1 else { throw EncodeError.InvalidArguments }
        var code = String(try encodeWorldDelta(ids[0]))
        if length >= 2 {
            code += try encodeSubDelta(Array(ids.suffix(length - 1)))
        }
        return code
    }

    // GeoDeltaコードをデコードする
    public static func decode(code: String) throws -> [UInt8] {
        let chars = code.characters
        guard chars.count >= 1 else { throw EncodeError.InvalidArguments }
        var ids = [try decodeWorldDelta((code as NSString).substringToIndex(1).characters.first!)]
        if chars.count >= 2 {
            ids += try decodeSubDelta((code as NSString).substringFromIndex(1))
        }
        return ids
    }
}


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

    private static func encodeSubDelta1(id: Int) throws -> String {
        guard id >= 0 else { throw EncodeError.InvalidId }
        guard id <= 3 else { throw EncodeError.InvalidId }
        return SUB_DELTA_TABLE1[id]
    }

    private static func encodeSubDelta2(id1: Int, _ id2: Int) throws -> String {
        guard id1 >= 0 else { throw EncodeError.InvalidId }
        guard id1 <= 3 else { throw EncodeError.InvalidId }
        guard id2 >= 0 else { throw EncodeError.InvalidId }
        guard id2 <= 3 else { throw EncodeError.InvalidId }
        return SUB_DELTA_TABLE2[id1][id2]
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
                result += try encodeSubDelta1(ids[i])
            } else {
                result += try encodeSubDelta2(ids[i], ids[i + 1])
            }
            i += 2
        }
        return result
    }

    // サブデルタコードをデコードする
    public static func decodeSubDelta(code: String) throws -> [Int] {
        let chars = code.characters
        guard chars.count >= 1 else { throw EncodeError.InvalidCode }

        var ids: [Int] = []
        for ch in chars {
            switch ( ch ) {
                case "2": ids += [0, 0]
                case "3": ids += [0, 1]
                case "4": ids += [0, 2]
                case "5": ids += [0, 3]
                case "6": ids += [1, 0]
                case "7": ids += [1, 1]
                case "8": ids += [1, 2]
                case "A": ids += [1, 3]
                case "B": ids += [2, 0]
                case "C": ids += [2, 1]
                case "D": ids += [2, 2]
                case "E": ids += [2, 3]
                case "F": ids += [3, 0]
                case "G": ids += [3, 1]
                case "H": ids += [3, 2]
                case "J": ids += [3, 3]
                case "K": ids += [0]
                case "M": ids += [1]
                case "N": ids += [2]
                case "P": ids += [3]
                default: throw EncodeError.InvalidCode
            }
        }
        return ids
    }

    // デルタID列をエンコードする
    public static func encode(ids: [Int]) throws -> String {
        guard ids.count >= 1 else { throw EncodeError.InvalidId }
        var code = try encodeWorldDelta(ids[0])
        if ids.count >= 2 {
            code += try encodeSubDelta(Array(ids.suffix(ids.count - 1)))
        }
        return code
    }

    // GeoDeltaコードをデコードする
    public static func decode(code: String) throws -> [Int] {
        let chars = code.characters
        guard chars.count >= 1 else { throw EncodeError.InvalidCode }
        var ids = [try decodeWorldDelta((code as NSString).substringToIndex(1))]
        if chars.count >= 2 {
            ids += try decodeSubDelta((code as NSString).substringFromIndex(1))
        }
        return ids
    }
}

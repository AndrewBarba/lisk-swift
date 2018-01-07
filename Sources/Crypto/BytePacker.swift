/*
 This file is part of ByteBackpacker Project. It is subject to the license terms in the LICENSE file found in the top-level directory of this distribution and at https://github.com/michaeldorner/ByteBackpacker/blob/master/LICENSE. No part of ByteBackpacker Project, including this file, may be copied, modified, propagated, or distributed except according to the terms contained in the LICENSE file.
 */

import Foundation

internal typealias Byte = UInt8

/// ByteOrder
///
/// Byte order can be either big or little endian.
internal enum ByteOrder {
    case bigEndian
    case littleEndian

    /// Machine specific byte order
    static let nativeByteOrder: ByteOrder = (Int(CFByteOrderGetCurrent()) == Int(CFByteOrderLittleEndian.rawValue)) ? .littleEndian : .bigEndian
}


internal struct BytePacker {

    private static let referenceTypeErrorString = "TypeError: Reference Types are not supported."

    /// Unpack a byte array into type `T`
    ///
    /// - Parameters:
    ///   - valueByteArray: Byte array to unpack
    ///   - byteOrder: Byte order (wither little or big endian)
    /// - Returns: Value type of type `T`
    static func unpack<T: Any>(_ valueByteArray: [Byte], byteOrder: ByteOrder = .nativeByteOrder) -> T {
        return unpack(valueByteArray, toType: T.self, byteOrder: byteOrder)
    }


    /// Unpack a byte array into type `T` for type inference
    ///
    /// - Parameters:
    ///   - valueByteArray: Byte array to unpack
    ///   - type: Origin type
    ///   - byteOrder: Byte order (wither little or big endian)
    /// - Returns: Value type of type `T`
    static func unpack<T: Any>(_ valueByteArray: [Byte], toType type: T.Type, byteOrder: ByteOrder = .nativeByteOrder) -> T {
        assert(!(T.self is AnyClass), referenceTypeErrorString)
        let bytes = (byteOrder == .littleEndian) ? valueByteArray : valueByteArray.reversed()
        return bytes.withUnsafeBufferPointer {
            return $0.baseAddress!.withMemoryRebound(to: T.self, capacity: 1) {
                $0.pointee
            }
        }
    }


    /// Pack method convinience method
    ///
    /// - Parameters:
    ///   - value: value to pack of type `T`
    ///   - byteOrder: Byte order (wither little or big endian)
    /// - Returns: Byte array
    static func pack<T: Any>( _ value: T, byteOrder: ByteOrder = .nativeByteOrder) -> [Byte] {
        assert(!(T.self is AnyClass), referenceTypeErrorString)
        var value = value // inout works only for var not let types
        let valueByteArray = withUnsafePointer(to: &value) {
            Array(UnsafeBufferPointer(start: $0.withMemoryRebound(to: Byte.self, capacity: 1){$0}, count: MemoryLayout<T>.size))
        }
        return (byteOrder == .littleEndian) ? valueByteArray : valueByteArray.reversed()
    }
}


extension Data {

    /// Extension for exporting Data (NSData) to byte array directly
    ///
    /// - Returns: Byte array
    func toByteArray() -> [Byte] {
        let count = self.count / MemoryLayout<Byte>.size
        var array = [Byte](repeating: 0, count: count)
        copyBytes(to: &array, count:count * MemoryLayout<Byte>.size)
        return array
    }
}

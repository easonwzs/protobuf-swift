// Protocol Buffers for Swift
//
// Copyright 2014 Alexey Khohklov(AlexeyXo).
// Copyright 2008 Google Inc.
//
// Licensed under the Apache License, Version 2.0 (the "License")
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//      http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

import Foundation

public func == (lhs: UnknownFieldSet, rhs: UnknownFieldSet) -> Bool {
    return lhs.fields == rhs.fields
}

public struct UnknownFieldSet:Hashable,Equatable {
    public var fields:Dictionary<Int32,Field> = Dictionary<Int32,Field>()

    public var hashValue:Int {
        get {
            var hashCode:Int = 0
            for value in fields.values {
                hashCode = (hashCode &* 31) &+ value.hashValue
            }
            return hashCode
        }
    }
    public func hasField(number:Int32) -> Bool {
        guard fields[number

            ] != nil else {
            return false
        }
        return true        
    }
    public func getField(number:Int32) -> Field {
        if let field = fields[number] {
            return field
        }
        return Field()
    }
    public func writeTo(codedOutputStream:CodedOutputStream) throws {
        var sortedKeys = Array(fields.keys)
        sortedKeys.sort(by: { $0 < $1 })
        for number in sortedKeys {
            let value:Field = fields[number]!
            try value.writeTo(fieldNumber: number, output: codedOutputStream)
        }
    }
    
    public func writeTo(outputStream:OutputStream) throws {
        let codedOutput:CodedOutputStream = CodedOutputStream(stream: outputStream)
        try writeTo(codedOutputStream: codedOutput)
        try codedOutput.flush()
    }
    
    public func getDescription(indent:String) -> String {
        var output = ""
        var sortedKeys = Array(fields.keys)
        sortedKeys.sort(by: { $0 < $1 })
        for number in sortedKeys {
            let value:Field = fields[number]!
            output += value.getDescription(fieldNumber: number, indent: indent)
        }
        return output
    }
    
    public static func builder() -> UnknownFieldSet.Builder {
        return UnknownFieldSet.Builder()
    }
    
    public static func parseFrom(codedInputStream:CodedInputStream) throws -> UnknownFieldSet {
        return try UnknownFieldSet.Builder().mergeFrom(codedInputStream: codedInputStream).build()
    }
    
    
    public static func parseFrom(data:Data) throws -> UnknownFieldSet {
        return try UnknownFieldSet.Builder().mergeFrom(data: data).build()
    }
    
    
    public static func parseFrom(inputStream:InputStream) throws -> UnknownFieldSet {
        return try UnknownFieldSet.Builder().mergeFrom(inputStream: inputStream).build()
    }

    public static func builderWithUnknownFields(copyFrom:UnknownFieldSet) throws -> UnknownFieldSet.Builder {
        return try UnknownFieldSet.Builder().merge(unknownFields: copyFrom)
    }
    
    public func serializedSize()->Int32 {
        var result:Int32 = 0
        for number in fields.keys {
            let field:Field = fields[number]!
            result += field.getSerializedSize(tag: number)
        }
        return result
    }
    
    public func writeAsMessageSetTo(codedOutputStream:CodedOutputStream) throws {
        for number in fields.keys {
            let field:Field = fields[number]!
            try field.writeAsMessageSetExtensionTo(fieldNumber: number, codedOutputStream:codedOutputStream)
        }
    }
    
    public func serializedSizeAsMessageSet() -> Int32 {
        var result:Int32 = 0
        for number in fields.keys {
            let field:Field = fields[number]!
            result += field.getSerializedSizeAsMessageSetExtension(tag: number)
        }
        return result
    }
    
    public func data() throws -> Data {
        let size = serializedSize()
        let data = Data(bytes: [0], count: Int(size))
        let stream:CodedOutputStream = CodedOutputStream(data: data)
        try writeTo(codedOutputStream: stream)
        return Data(bytes: stream.buffer.buffer, count: Int(size))
    }
    
    public struct Builder {
        private var fields:Dictionary<Int32,Field>
        private var lastFieldNumber:Int32
        private var lastField:Field?
        public init() {
            fields = Dictionary()
            lastFieldNumber = 0
        }
        @discardableResult
        public mutating func addField(field:Field, number:Int32) throws -> UnknownFieldSet.Builder {
            guard number != 0 else {
                throw ProtocolBuffersError.illegalArgument("Illegal Field Number")
            }
            if (lastField != nil && lastFieldNumber == number) {
                lastField = nil
                lastFieldNumber = 0
            }
            fields[number]=field
            return self
        }
        public mutating func getFieldBuilder(number:Int32) throws -> Field? {
            if lastField != nil {
                if (number == lastFieldNumber) {
                    return lastField
                }
                _ = try addField(field: lastField!, number:lastFieldNumber)
            }
            if number == 0 {
                return nil
            }
            else {
                let existing = fields[number]
                lastFieldNumber = number
                lastField = Field()
                if (existing != nil) {
                    _ = lastField?.mergeFromField(other: existing!)
                }
                return lastField
            }
        }
        
        public mutating func build() throws -> UnknownFieldSet {
            _ = try getFieldBuilder(number: 0)
            var result:UnknownFieldSet
            if fields.count == 0 {
                result = UnknownFieldSet(fields: Dictionary())
            } else {
                result = UnknownFieldSet(fields: fields)
            }
            fields.removeAll(keepingCapacity: false)
            return result
        }
        
        public func buildPartial() throws -> UnknownFieldSet? {
            throw ProtocolBuffersError.obvious("UnsupportedMethod")
        }
        
        public func clone() throws -> UnknownFieldSet? {
            throw ProtocolBuffersError.obvious("UnsupportedMethod")
        }
        
        public func isInitialized() -> Bool {
            return true
        }
        public mutating func unknownFields() throws -> UnknownFieldSet {
            return try build()
        }
        public func setUnknownFields(unknownFields:UnknownFieldSet) throws -> UnknownFieldSet.Builder? {
            throw ProtocolBuffersError.obvious("UnsupportedMethod")
        }
        public func hasField(number:Int32) throws -> Bool {
            guard number != 0 else {
                throw ProtocolBuffersError.illegalArgument("Illegal Field Number")
            }
            
            return number == lastFieldNumber || (fields[number] != nil)
        }
        @discardableResult
        public mutating func mergeField(field:Field, number:Int32) throws -> UnknownFieldSet.Builder {
            guard number != 0 else {
                throw ProtocolBuffersError.illegalArgument("Illegal Field Number")
            }
            if try hasField(number: number) {
                guard var field = try getFieldBuilder(number: number) else {
                    return self
                }
                field.mergeFromField(other: field)
            } else {
                _ = try addField(field: field, number:number)
            }
            return self
        }
        @discardableResult
        public mutating func merge(unknownFields:UnknownFieldSet) throws -> UnknownFieldSet.Builder {
            for number in unknownFields.fields.keys {
                let field:Field = unknownFields.fields[number]!
                _ = try mergeField(field: field ,number:number)
            }
            return self
        }
        
        @discardableResult
        public func mergeFrom(data:Data) throws -> UnknownFieldSet.Builder {
            let input:CodedInputStream = CodedInputStream(data: data)
            try mergeFrom(mergeFrom(codedInputStream: input)
            try input.checkLastTagWas(value: 0)
            return self
        }
        
        public func mergeFrom(inputStream:InputStream) throws -> UnknownFieldSet.Builder {
            throw ProtocolBuffersError.obvious("UnsupportedMethod")
        }
        public func mergeFrom(inputStream:InputStream, extensionRegistry:ExtensionRegistry) throws -> UnknownFieldSet.Builder {
            throw ProtocolBuffersError.obvious("UnsupportedMethod")
        }
        @discardableResult
        public mutating func mergeVarintField(fieldNumber:Int32, value:Int64) throws -> UnknownFieldSet.Builder {
            guard fieldNumber != 0 else {
                throw ProtocolBuffersError.illegalArgument("Illegal Field Number: Zero is not a valid field number.")
            }
            guard var field = try getFieldBuilder(number: fieldNumber) else {
                return self
            }
            field.variantArray.append(value)
            return self
        }
        @discardableResult
        public mutating func mergeFieldFrom(tag:Int32, input:CodedInputStream) throws -> Bool {
            
            let number = WireFormat.getTagFieldNumber(tag: tag)
            let tags = WireFormat.getTagWireType(tag: tag)
            var input = input
            
            guard let format = WireFormat(rawValue: tags) else {
                 throw ProtocolBuffersError.invalidProtocolBuffer("Invalid Wire Type")
            }
            guard var field = try getFieldBuilder(number: number) else {
                return false
            }

            switch format {
            case .varint:
                try field.variantArray.append(input.readInt64())
                return true
            case .fixed32:
                let value = try input.readFixed32()
                field.fixed32Array.append(value)
                return true
            case .fixed64:
                let value = try input.readFixed64()
                field.fixed64Array.append(value)
                return true
            case .lengthDelimited:
                field.lengthDelimited.append(try input.readData())
                return true
            case .startGroup:
                var subBuilder:UnknownFieldSet.Builder = UnknownFieldSet.Builder()
                try input.readUnknownGroup(fieldNumber: number, builder:subBuilder)
                try field.groupArray.append(subBuilder.build())
                return true
            case .endGroup:
                return false
            default:
                throw ProtocolBuffersError.invalidProtocolBuffer("Invalid Wire Type")
            }
        }
        
        @discardableResult
        public mutating func mergeFrom(codedInputStream:CodedInputStream) throws -> UnknownFieldSet.Builder {
            var codedInputStream = codedInputStream
            while (true) {
                let tag:Int32 = try codedInputStream.readTag()
                let mergeField = try mergeFieldFrom(tag: tag, input:codedInputStream)
                if tag == 0 || !(mergeField) {
                    break
                }
            }
            return self
        }
        
        public func mergeFrom(codedInputStream:CodedInputStream, extensionRegistry:ExtensionRegistry) throws -> UnknownFieldSet.Builder {
            throw ProtocolBuffersError.obvious("UnsupportedMethod")
        }
        @discardableResult
        public func mergeFrom(data:Data, extensionRegistry:ExtensionRegistry) throws -> UnknownFieldSet.Builder {
            let input = CodedInputStream(data: data)
            _ = try mergeFrom(codedInputStream:input, extensionRegistry:extensionRegistry)
            try input.checkLastTagWas(value: 0)
            return self
        }
        @discardableResult
        public mutating func clear() ->UnknownFieldSet.Builder {
            fields = Dictionary()
            lastFieldNumber = 0
            lastField = nil
            return self
        }
    }
}

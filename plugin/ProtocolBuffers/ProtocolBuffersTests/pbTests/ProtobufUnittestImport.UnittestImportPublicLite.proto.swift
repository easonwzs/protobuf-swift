// Generated by the Protocol Buffers 3.0 compiler.  DO NOT EDIT!
// Source file "unittest_import_public_lite.proto"
// Syntax "Proto2"

import Foundation
import ProtocolBuffers


public extension ProtobufUnittestImport{}

public extension ProtobufUnittestImport {
  public struct UnittestImportPublicLiteRoot {
    public static let `default` = UnittestImportPublicLiteRoot()
    public var extensionRegistry:ExtensionRegistry

    init() {
      extensionRegistry = ExtensionRegistry()
      registerAllExtensions(registry: extensionRegistry)
    }
    public func registerAllExtensions(registry: ExtensionRegistry) {
    }
  }

  final public class PublicImportMessageLite  {
    public var unknownFields = UnknownFieldSet(fields: [:])
    fileprivate var memoizedSerializedSize:Int32 = -1

    public static func == (lhs: ProtobufUnittestImport.PublicImportMessageLite, rhs: ProtobufUnittestImport.PublicImportMessageLite) -> Bool {
      if (lhs === rhs) {
        return true
      }
      var fieldCheck:Bool = (lhs.hashValue == rhs.hashValue)
      fieldCheck = fieldCheck && (lhs.hasE == rhs.hasE) && (!lhs.hasE || lhs.e == rhs.e)
      fieldCheck = (fieldCheck && (lhs.unknownFields == rhs.unknownFields))
      return fieldCheck
    }

    public fileprivate(set) var e:Int32 = Int32(0)
    public fileprivate(set) var hasE:Bool = false

    required public init() {
    }
    public func isInitialized() -> Bool {
     return true
    }
    public func writeTo(codedOutputStream: CodedOutputStream) throws {
      if hasE {
        try codedOutputStream.write.int32(fieldNumber: 1, value:e)
      }
      try unknownFields.writeTo(codedOutputStream: codedOutputStream)
    }
    public func serializedSize() throws -> Int32 {
      var serialize_size:Int32 = memoizedSerializedSize
      if serialize_size != -1 {
       return serialize_size
      }

      serialize_size = 0
      if hasE {
        serialize_size += ProtobufWire.int32().computeSizeWith(tag: 1, value: e)
      }
      serialize_size += unknownFields.serializedSize()
      memoizedSerializedSize = serialize_size
      return serialize_size
    }
    public func toBuilder() throws -> ProtobufUnittestImport.PublicImportMessageLite.Builder {
      return try ProtobufUnittestImport.PublicImportMessageLite.builderWithPrototype(prototype:self)
    }
    public class func builderWithPrototype(prototype:ProtobufUnittestImport.PublicImportMessageLite) throws -> ProtobufUnittestImport.PublicImportMessageLite.Builder {
      return try ProtobufUnittestImport.PublicImportMessageLite.Builder().mergeFrom(other:prototype)
    }
    public func encode() throws -> Dictionary<String,Any> {
      guard isInitialized() else {
        throw ProtocolBuffersError.invalidProtocolBuffer("Uninitialized Message")
      }

      var jsonMap:Dictionary<String,Any> = Dictionary<String,Any>()
      if hasE {
        jsonMap["e"] = Int(e)
      }
      return jsonMap
    }
    class public func decode(jsonMap:Dictionary<String,Any>) throws -> ProtobufUnittestImport.PublicImportMessageLite {
      return try ProtobufUnittestImport.PublicImportMessageLite.Builder.decodeToBuilder(jsonMap:jsonMap).build()
    }
    class public func fromJSON(data:Data) throws -> ProtobufUnittestImport.PublicImportMessageLite {
      return try ProtobufUnittestImport.PublicImportMessageLite.Builder.fromJSONToBuilder(data:data).build()
    }
    public func getDescription(indent:String) throws -> String {
      var output = ""
      if hasE {
        output += "\(indent) e: \(e) \n"
      }
      output += unknownFields.getDescription(indent: indent)
      return output
    }
    public var hashValue:Int {
        get {
            var hashCode:Int = 7
            if hasE {
               hashCode = (hashCode &* 31) &+ e.hashValue
            }
            hashCode = (hashCode &* 31) &+  unknownFields.hashValue
            return hashCode
        }
    }


    //Meta information declaration start

    public class func className() -> String {
        return "ProtobufUnittestImport.PublicImportMessageLite"
    }
    public func className() -> String {
        return "ProtobufUnittestImport.PublicImportMessageLite"
    }
    //Meta information declaration end

    final public class Builder : GeneratedMessageBuilderProtocol {
      public typealias GeneratedMessageType = ProtobufUnittestImport.PublicImportMessageLite
      fileprivate var builderResult:ProtobufUnittestImport.PublicImportMessageLite = ProtobufUnittestImport.PublicImportMessageLite()
      public func getMessage() -> ProtobufUnittestImport.PublicImportMessageLite {
          return builderResult
      }

      required public init () {
      }
      public var hasE:Bool {
           get {
                return builderResult.hasE
           }
      }
      public var e:Int32 {
           get {
                return builderResult.e
           }
           set (value) {
               builderResult.hasE = true
               builderResult.e = value
           }
      }
      @discardableResult
      public func setE(_ value:Int32) -> ProtobufUnittestImport.PublicImportMessageLite.Builder {
        self.e = value
        return self
      }
      @discardableResult
      public func clearE() -> ProtobufUnittestImport.PublicImportMessageLite.Builder{
           builderResult.hasE = false
           builderResult.e = Int32(0)
           return self
      }
      public var internalGetResult:ProtobufUnittestImport.PublicImportMessageLite {
           get {
              return builderResult
           }
          set{}
      }
      @discardableResult
      public func clear() -> ProtobufUnittestImport.PublicImportMessageLite.Builder {
        builderResult = ProtobufUnittestImport.PublicImportMessageLite()
        return self
      }
      public func clone() throws -> ProtobufUnittestImport.PublicImportMessageLite.Builder {
        return try ProtobufUnittestImport.PublicImportMessageLite.builderWithPrototype(prototype:builderResult)
      }
      public func build() throws -> ProtobufUnittestImport.PublicImportMessageLite {
           try checkInitialized()
           return buildPartial()
      }
      public func buildPartial() -> ProtobufUnittestImport.PublicImportMessageLite {
        let returnMe:ProtobufUnittestImport.PublicImportMessageLite = builderResult
        return returnMe
      }
      @discardableResult
      public func mergeFrom(other:ProtobufUnittestImport.PublicImportMessageLite) throws -> ProtobufUnittestImport.PublicImportMessageLite.Builder {
        if other == ProtobufUnittestImport.PublicImportMessageLite() {
         return self
        }
        if other.hasE {
             e = other.e
        }
        try merge(unknownField: other.unknownFields)
        return self
      }
      @discardableResult
      public func mergeFrom(codedInputStream: CodedInputStream) throws -> ProtobufUnittestImport.PublicImportMessageLite.Builder {
           return try mergeFrom(codedInputStream: codedInputStream, extensionRegistry:ExtensionRegistry())
      }
      @discardableResult
      public func mergeFrom(codedInputStream: CodedInputStream, extensionRegistry:ExtensionRegistry) throws -> ProtobufUnittestImport.PublicImportMessageLite.Builder {
        let unknownFieldsBuilder:UnknownFieldSet.Builder = try UnknownFieldSet.builderWithUnknownFields(copyFrom:self.unknownFields)
        while (true) {
          let protobufTag = try codedInputStream.readTag()
          switch protobufTag {
          case 0: 
            self.unknownFields = try unknownFieldsBuilder.build()
            return self

          case 8:
            e = try codedInputStream.read.int32()

          default:
            if (!(try parse(codedInputStream:codedInputStream, unknownFields:unknownFieldsBuilder, extensionRegistry:extensionRegistry, tag:protobufTag))) {
               unknownFields = try unknownFieldsBuilder.build()
               return self
            }
          }
        }
      }
      class public func decodeToBuilder(jsonMap:Dictionary<String,Any>) throws -> ProtobufUnittestImport.PublicImportMessageLite.Builder {
        let resultDecodedBuilder = ProtobufUnittestImport.PublicImportMessageLite.Builder()
        if let jsonValueE = jsonMap["e"] as? Int {
          resultDecodedBuilder.e = Int32(jsonValueE)
        }
        return resultDecodedBuilder
      }
      class public func fromJSONToBuilder(data:Data) throws -> ProtobufUnittestImport.PublicImportMessageLite.Builder {
        let jsonData = try JSONSerialization.jsonObject(with:data, options: JSONSerialization.ReadingOptions(rawValue: 0))
        guard let jsDataCast = jsonData as? Dictionary<String,Any> else {
          throw ProtocolBuffersError.invalidProtocolBuffer("Invalid JSON data")
        }
        return try ProtobufUnittestImport.PublicImportMessageLite.Builder.decodeToBuilder(jsonMap:jsDataCast)
      }
    }

  }

}
extension ProtobufUnittestImport.PublicImportMessageLite: GeneratedMessageProtocol {
  public static func getBuilder() -> GeneratedMessageBuilderProtocol {
    return ProtobufUnittestImport.PublicImportMessageLite.Builder() as! T
  }
  public func getBuilder() -> GeneratedMessageBuilderProtocol {
    return getBuilder()
  }
  public class func parseArrayDelimitedFrom(inputStream: InputStream) throws -> Array<ProtobufUnittestImport.PublicImportMessageLite> {
    var mergedArray = Array<ProtobufUnittestImport.PublicImportMessageLite>()
    while let value = try parseDelimitedFrom(inputStream: inputStream) {
      mergedArray.append(value)
    }
    return mergedArray
  }
  public class func parseDelimitedFrom(inputStream: InputStream) throws -> ProtobufUnittestImport.PublicImportMessageLite? {
    return try ProtobufUnittestImport.PublicImportMessageLite.Builder().mergeDelimitedFrom(inputStream: inputStream)?.build()
  }
  public class func parseFrom(data: Data) throws -> ProtobufUnittestImport.PublicImportMessageLite {
    return try ProtobufUnittestImport.PublicImportMessageLite.Builder().mergeFrom(data: data, extensionRegistry:ProtobufUnittestImport.UnittestImportPublicLiteRoot.default.extensionRegistry).build()
  }
  public class func parseFrom(data: Data, extensionRegistry:ExtensionRegistry) throws -> ProtobufUnittestImport.PublicImportMessageLite {
    return try ProtobufUnittestImport.PublicImportMessageLite.Builder().mergeFrom(data: data, extensionRegistry:extensionRegistry).build()
  }
  public class func parseFrom(inputStream: InputStream) throws -> ProtobufUnittestImport.PublicImportMessageLite {
    return try ProtobufUnittestImport.PublicImportMessageLite.Builder().mergeFrom(inputStream: inputStream).build()
  }
  public class func parseFrom(inputStream: InputStream, extensionRegistry:ExtensionRegistry) throws -> ProtobufUnittestImport.PublicImportMessageLite {
    return try ProtobufUnittestImport.PublicImportMessageLite.Builder().mergeFrom(inputStream: inputStream, extensionRegistry:extensionRegistry).build()
  }
  public class func parseFrom(codedInputStream: CodedInputStream) throws -> ProtobufUnittestImport.PublicImportMessageLite {
    return try ProtobufUnittestImport.PublicImportMessageLite.Builder().mergeFrom(codedInputStream: codedInputStream).build()
  }
  public class func parseFrom(codedInputStream: CodedInputStream, extensionRegistry:ExtensionRegistry) throws -> ProtobufUnittestImport.PublicImportMessageLite {
    return try ProtobufUnittestImport.PublicImportMessageLite.Builder().mergeFrom(codedInputStream: codedInputStream, extensionRegistry:extensionRegistry).build()
  }
}

// @@protoc_insertion_point(global_scope)

import Foundation

struct JSONWebToken {
    // MARK: - Enums

    enum Error: Swift.Error {
        case invalidToken
        case invalidPayloadData
        case invalidPayloadJSON
    }

    // MARK: - Properties

    let id: String?
    let role: String?
    let issuer: String?
    let audience: String?
    let expirationDate: Date?
    let issuedAt: Date?
    let subject: String?

    var isExpired: Bool {
        guard let expirationDate else {
            return true
        }
        return expirationDate < Date()
    }

    // MARK: - Object life cycle

    init(_ token: String) throws {
        let tokenParts = token.components(separatedBy: ".")

        guard tokenParts.count == 3 else {
            throw Error.invalidToken
        }

        guard let payloadData = Data(base64Encoded: tokenParts[1] + "==") else {
            throw Error.invalidPayloadData
        }


        guard let payloadJson = try JSONSerialization.jsonObject(with: payloadData, options: []) as? [String:Any] else {
            throw Error.invalidPayloadJSON
        }

        id = payloadJson["id"] as? String
        role = payloadJson["role"] as? String
        issuer = payloadJson["iss"] as? String
        audience = payloadJson["aud"] as? String

        if let expTime = payloadJson["exp"] as? Double {
            expirationDate = Date(timeIntervalSince1970: expTime)
        } else {
            expirationDate = nil
        }

        if let iatTime = payloadJson["iat"] as? Double {
            issuedAt = Date(timeIntervalSince1970: iatTime)
        } else {
            issuedAt = nil
        }

        subject = payloadJson["sub"] as? String
    }
}

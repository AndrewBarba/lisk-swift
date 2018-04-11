//
//  Signatures.swift
//  Lisk
//
//  Created by Andrew Barba on 1/10/18.
//

import Foundation

/// Signatures - https://docs.lisk.io/docs/lisk-api-080-signatures
public struct Signatures: APIService {

    /// Client used to send requests
    public let client: APIClient

    /// Init
    public init(client: APIClient = .shared) {
        self.client = client
    }
}

// MARK: - Submit

extension Signatures {

    /// Submits a sognature to the network
    public func submit(signature: SignatureModel, completionHandler: @escaping (Response<SignatureBroadcastResponse>) -> Void) {
        let options: RequestOptions = [
            "signature": [
                "transactionId": signature.transactionId,
                "publicKey": signature.publicKey,
                "signature": signature.signature
            ]
        ]

        client.post(path: "signatures", options: options, completionHandler: completionHandler)
    }
}

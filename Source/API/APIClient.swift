//
//  APIClient.swift
//  Lisk
//
//  Created by Andrew Barba on 12/26/17.
//  Copyright © 2017 Andrew Barba. All rights reserved.
//

import Foundation

/// Represents an HTTP response
public enum Response {
    case success(data: Data, json: [String: Any])
    case error(error: Error, response: HTTPURLResponse?)
}

/// Type to handle network request completion
public typealias RequestCompletionHandler = (Response) -> Void

/// Type to represent request body/url options
public typealias RequestOptions = [String: Any]

/// HTTP methods we use
public enum HTTPMethod: String {
    case get = "GET"
    case post = "POST"
    case put = "PUT"
    case delete = "DELETE"
}

public class APIClient {

    // MARK: - Static

    public static let mainnet = APIClient()

    public static let testnet = APIClient(options: .init(testnet: true))

    // MARK: - Init

    public init(options: APIOptions = .init()) {
        let port: String = {
            if options.ssl { return Constants.Port.ssl }
            return options.testnet ? Constants.Port.test : Constants.Port.live
        }()

        let hostname: String = {
            if let node = options.node { return node.hostname }
            let nodes = options.testnet ? APINode.testnet : APINode.mainnet
            let node = options.randomNode ? APINode.random(from: nodes) : nodes[0]
            return node.hostname
        }()

        let nethash = options.testnet ? APINethash.testnet(port: port, nethash: options.nethash) : APINethash.mainnet(port: port, nethash: options.nethash)

        let scheme = options.ssl ? "https" : "http"

        let urlPath = "\(scheme)://\(hostname):\(port)/api"

        self.baseURL = URL(string: urlPath)!

        self.headers = [
            "Content-Type": nethash.contentType,
            "os": nethash.os,
            "version": nethash.version,
            "minVersion": nethash.minVersion,
            "port": nethash.port,
            "nethash": nethash.nethash,
            "broadhash": nethash.broadhash
        ]
    }

    // MARK: - Public

    /// Perform GET request to Fritz API
    @discardableResult
    public func get(path: String, options: RequestOptions? = nil, completionHandler: RequestCompletionHandler? = nil) -> (URLRequest, URLSessionDataTask) {
        return request(.get, path: path, options: options)
    }

    /// Perform GET request to Fritz API
    @discardableResult
    public func post(path: String, options: RequestOptions? = nil, completionHandler: RequestCompletionHandler? = nil) -> (URLRequest, URLSessionDataTask) {
        return request(.post, path: path, options: options)
    }

    /// Perform POST request to Fritz API
    @discardableResult
    public func request(_ httpMethod: HTTPMethod, path: String, options: RequestOptions? = nil, completionHandler: RequestCompletionHandler? = nil) -> (URLRequest, URLSessionDataTask) {
        let request = urlRequest(httpMethod, path: path, options: options)
        let task = dataTask(request, completionHandler: completionHandler)
        return (request, task)
    }

    // MARK: - Private

    /// Base url of all requests
    private let baseURL: URL

    /// Headers to send on every request
    private let headers: [String: String]

    /// Session to send http requests
    private let urlSession = URLSession(configuration: .ephemeral)

    /// Create a json data task
    private func dataTask(_ request: URLRequest, completionHandler: RequestCompletionHandler? = nil) -> URLSessionDataTask {
        let task = urlSession.dataTask(with: request) { data, response, error in
            guard let completionHandler = completionHandler else { return }
            let response = self.processRequestCompletion(data, response: response, error: error)
            completionHandler(response)
        }
        task.resume()
        return task
    }

    /// Builds a URL request based on a given HTTP method and options
    private func urlRequest(_ httpMethod: HTTPMethod, path: String, options: RequestOptions? = nil) -> URLRequest {
        // Build api url
        let url = baseURL.appendingPathComponent(path)

        // Build request object
        var request = URLRequest(url: url, cachePolicy: .reloadIgnoringLocalCacheData)

        // Apply request headers
        for (header, value) in headers {
            request.addValue(value, forHTTPHeaderField: header)
        }

        // Method
        request.httpMethod = httpMethod.rawValue

        // Parse options, apply to body or url based on method
        if let options = options {
            switch httpMethod {
            case .get, .delete:
                request.url = URL(string: url.absoluteString + "?" + urlEncodedQueryString(options))
            case .post, .put:
                request.httpBody = try? JSONSerialization.data(withJSONObject: options, options: [])
            }
        }

        return request
    }

    /// Converts a dict to url encoded query string
    private func urlEncodedQueryString(_ options: RequestOptions) -> String {
        let queryParts = options.flatMap { key, value in
            guard
                let safeKey = key.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed),
                let safeValue = "\(value)".addingPercentEncoding(withAllowedCharacters: .urlHostAllowed)
                else { return nil }
            return "\(safeKey)=\(safeValue)"
        }
        return queryParts.joined(separator: "&")
    }

    /// Process a response
    private func processRequestCompletion(_ data: Data?, response: URLResponse?, error: Swift.Error?) -> Response {
        if let error = error {
            return .error(error: error, response: response as? HTTPURLResponse)
        }

        guard
            let data = data,
            let object = try? JSONSerialization.jsonObject(with: data, options: []),
            let json = object as? [String: Any]
            else {
                let userInfo = ["message": "Unknown error"]
                let error = NSError(domain: NSURLErrorDomain, code: NSURLErrorBadServerResponse, userInfo: userInfo)
                return .error(error: error, response: response as? HTTPURLResponse)
            }

        guard let success = json["success"] as? Bool, success else {
            let error = NSError(domain: NSURLErrorDomain, code: NSURLErrorBadServerResponse, userInfo: json)
            return .error(error: error, response: response as? HTTPURLResponse)
        }

        return .success(data: data, json: json)
    }
}

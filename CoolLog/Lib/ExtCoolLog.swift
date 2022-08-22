//
//  Copyright © 2022 Apple Inc. All rights reserved.
//

import Alamofire
import Foundation

extension CoolLog {
    
    class func logAlamofire(_ response: DefaultDataResponse, filename: String = #file, line: Int = #line, column: Int = #column, funcName: String = #function) {
        if let data = response.data, let responseText = String(data: data, encoding: .utf8), let request = response.request, let response = response.response {
            var message = "\(request.httpMethod ?? "") \(response.statusCode) \(request.url?.description ?? "")\n"

            if let headers = request.allHTTPHeaderFields, !headers.isEmpty {
                message += processHeaders(headers: headers)
            }

            if request.httpMethod != HTTPMethod.get.rawValue, let httpBody = request.httpBody, let parameters = String(data: httpBody, encoding: .utf8) {
                message += "Parameters: \(parameters)\n"
            }

            message += responseText

            v(
                message,
                filename: filename,
                line: line,
                column: column,
                funcName: funcName
            )
        }

        func processHeaders(headers: [AnyHashable: Any]?) -> String {
            guard let headers = headers else {
                return ""
            }

            var message = "Headers: [\n"
            for (key, value) in headers {
                message += "    \(key): \(value)\n"
            }
            message += "]\n"
            return message
        }
    }
}

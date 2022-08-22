//
//  ExtCoolLog.swift
//  CoolLog
//
//  Created by Md. Mahmudul Hasan Shohag on 22/8/22.
//

import Alamofire
import Foundation

extension CoolLog {
    class func logAlamofire(_ response: DefaultDataResponse, filename: String = #file, line: Int = #line, column: Int = #column, funcName: String = #function) {
        processAndLogAlamofire(
            data: response.data,
            request: response.request,
            response: response.response,
            filename: filename,
            line: line,
            column: column,
            funcName: funcName
        )
    }

    class func logAlamofire(_ response: DataResponse<Any>, filename: String = #file, line: Int = #line, column: Int = #column, funcName: String = #function) {
        processAndLogAlamofire(
            data: response.data,
            request: response.request,
            response: response.response,
            filename: filename,
            line: line,
            column: column,
            funcName: funcName
        )
    }

    private class func processAndLogAlamofire(
        data: Data?,
        request: URLRequest?,
        response: HTTPURLResponse?,
        filename: String = #file,
        line: Int = #line,
        column: Int = #column,
        funcName: String = #function
    ) {
        if let data = data, let responseText = String(data: data, encoding: .utf8), let request = request, let response = response {
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

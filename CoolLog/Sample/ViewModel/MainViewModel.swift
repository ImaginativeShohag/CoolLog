//
//  MainViewModel.swift
//  CoolLog
//
//  Created by Md. Mahmudul Hasan Shohag on 22/8/22.
//

import Alamofire
import Foundation

class MainViewModel: ObservableObject {
    let session = Session(eventMonitors: [AlamofireLogger()])
    
    func callApis() {
        logExamples()
        
        getRequest()
        
        postRequest()
        
        jsonRequest()
    }
    
    private func logExamples() {
        CoolLog.v("Verbose log")
        CoolLog.d("Debug log")
        CoolLog.i("Info log")
        CoolLog.e("Error log")
        CoolLog.w("Warning log")
        CoolLog.c("Critical log")
    }
    
    private func getRequest() {
        let headers: HTTPHeaders = [
            .authorization(bearerToken: "32374139667788b279feb06c447dfcc2e6a01a2484b1b3608ea12af2334088a6"),
            .accept("application/json")
        ]
        
        let parameters = [
            "page": 2
        ]
        
        session.request(
            "https://gorest.co.in/public/v2/users",
            method: .get,
            parameters: parameters,
            headers: headers
        )
        .resume()
    }
    
    private func postRequest() {
        let headers: HTTPHeaders = [
            .authorization(bearerToken: "32374139667788b279feb06c447dfcc2e6a01a2484b1b3608ea12af2334088a6"),
            .accept("application/json")
        ]
        
        let parameters = [
            "name": "John Doe",
            "email": "jhon.doe\(Int.random(in: 1 ... 999999))@example.com",
            "gender": "male",
            "status": "active"
        ]
        
        session.request(
            "https://gorest.co.in/public/v2/users",
            method: .post,
            parameters: parameters,
            headers: headers
        )
        .resume()
    }
    
    private func jsonRequest() {
        let headers: HTTPHeaders = [
            .authorization(bearerToken: "32374139667788b279feb06c447dfcc2e6a01a2484b1b3608ea12af2334088a6"),
            .accept("application/json")
        ]
        
        let parameters = [
            "name": "John Doe",
            "email": "jhon.doe\(Int.random(in: 1 ... 999999))@example.com",
            "gender": "male",
            "status": "active"
        ]
        
        session.request(
            "https://gorest.co.in/public/v2/users",
            method: .post,
            parameters: parameters,
            encoding: JSONEncoding.default,
            headers: headers
        )
        .resume()
    }
}

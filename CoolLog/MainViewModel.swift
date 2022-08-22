//
//  MainViewModel.swift
//  CoolLog
//
//  Created by Md. Mahmudul Hasan Shohag on 22/8/22.
//

import Alamofire
import Foundation

class MainViewModel: ObservableObject {
    func callApis() {
        getRequest()
        
        postRequest()
    }
    
    private func getRequest() {
        let headers = [
            "Accept": "application/json",
            "Authorization": "Bearer 32374139667788b279feb06c447dfcc2e6a01a2484b1b3608ea12af2334088a6"
        ]
        
        let parameters = [
            "page": 2
        ]
        
        Alamofire.request(
            URL(string: "https://gorest.co.in/public/v2/users")!,
            method: .get,
            parameters: parameters,
            headers: headers
        )
        .response { response in
            CoolLog.logAlamofire(response)
        }
    }
    
    private func postRequest() {
        let headers = [
            "Accept": "application/json",
            "Authorization": "Bearer 32374139667788b279feb06c447dfcc2e6a01a2484b1b3608ea12af2334088a6"
        ]
        
        let parameters = [
            "name": "John Doe",
            "email": "jhon.doe\(Int.random(in: 1 ... 999999))@example.com",
            "gender": "male",
            "status": "active"
        ]
        
        Alamofire.request(
            URL(string: "https://gorest.co.in/public/v2/users")!,
            method: .post,
            parameters: parameters,
            headers: headers
        )
        .response { response in
            CoolLog.logAlamofire(response)
        }
    }
    
    private func jsonRequest() {
        
        let headers = [
            "Accept": "application/json",
            "Authorization": "Bearer 32374139667788b279feb06c447dfcc2e6a01a2484b1b3608ea12af2334088a6"
        ]
        
        let parameters = [
            "name": "John Doe",
            "email": "jhon.doe\(Int.random(in: 1 ... 999999))@example.com",
            "gender": "male",
            "status": "active"
        ]
        
        let resultData = try! JSONSerialization.data(withJSONObject: parameters)
        let paramJson = String(data: resultData, encoding: .utf8)!
        
        var request = URLRequest(url: URL(string: "https://gorest.co.in/public/v2/users")!, timeoutInterval: .infinity)
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        request.addValue("Bearer 32374139667788b279feb06c447dfcc2e6a01a2484b1b3608ea12af2334088a6", forHTTPHeaderField: "Authorization")
        
        request.httpMethod = HTTPMethod.post.rawValue
        request.httpBody = paramJson.data(using: .utf8)
        
        Alamofire.request(request)
            .responseJSON { response in
                CoolLog.logAlamofire(response)
            }
    }
}

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
}

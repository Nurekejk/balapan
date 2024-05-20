//
//  SignInService.swift
//  balapan
//
//  Created by Nurbol on 18.05.2024.
//


import Foundation
import Alamofire

final class SignInService {

    // MARK: - Network

    func fetchUser (with user: User, completion: @escaping (Result<SignUpResponse, AFError>) -> Void) {
        let urlComponent = URL(string: "https://balapan.onrender.com/api/auth/login")

        guard let url = urlComponent else {
            return
        }

        let parameters: [String: Any] = [ "email": user.email,
                                          "password": user.password]

        AF.request(url, method: .post, parameters: parameters, encoding: JSONEncoding.default)
            .validate()
            .responseDecodable(of: SignUpResponse.self) { response in
                completion(response.result)
            }
    }
}

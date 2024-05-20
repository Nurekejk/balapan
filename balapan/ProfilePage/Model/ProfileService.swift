//
//  ProfileService.swift
//  balapan
//
//  Created by Nurbol on 18.05.2024.
//


import Foundation
import Alamofire

final class ProfileService {

    // MARK: - Network

    func logout (with user: User, completion: @escaping (Result<SignUpResponse, AFError>) -> Void) {
        let urlComponent = URL(string: "https://balapan.onrender.com/api/auth/logout")

        guard let url = urlComponent else {
            return
        }


        AF.request(url, method: .get, encoding: JSONEncoding.default)
            .validate()
            .responseDecodable(of: SignUpResponse.self) { response in
                completion(response.result)
            }
    }
}

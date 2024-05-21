//
//  CreateUserService.swift
//  balapan
//
//  Created by Nurbol on 18.05.2024.
//

import Foundation
import Alamofire

final class CreateUserService {

    // MARK: - Network

    func signUp(requestBody: SignUpRequest, completion: @escaping (Result<SignUpResponse, SignUpErrorResponse>) -> Void) {
        let url = "https://balapan.onrender.com/api/auth/signup"
        let parameters: [String: Any] = [
            "email": requestBody.email,
            "password": requestBody.password
        ]

        AF.request(url, method: .post, parameters: parameters, encoding: JSONEncoding.default).responseData { response in
            switch response.result {
            case .success(let data):
                do {
                    let signUpResponse = try JSONDecoder().decode(SignUpResponse.self, from: data)
                    // Save the token to UserDefaults
                    UserDefaults.standard.set(signUpResponse.token, forKey: "userToken")
                    // Print the saved token to verify
                    if let savedToken = UserDefaults.standard.string(forKey: "userToken") {
                        print("Token saved in UserDefaults: \(savedToken)")
                    } else {
                        print("Failed to save the token in UserDefaults.")
                    }
                    completion(.success(signUpResponse))
                } catch {
                    completion(.failure(.invalidResponse))
                }
            case .failure(let error):
                completion(.failure(.serverError(error.localizedDescription)))
            }
        }
    }
}

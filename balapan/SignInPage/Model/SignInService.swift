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
    func login(
        requestBody: LoginRequest,
        completion: @escaping (Result<LoginResponse, LoginErrorResponse>) -> Void
    ) {
        let url = "https://balapan.onrender.com/api/auth/login"
        let parameters: [String: Any] = [
            "email": requestBody.email,
            "password": requestBody.password
        ]

        AF.request(url, method: .post, parameters: parameters, encoding: JSONEncoding.default).responseData { response in
            switch response.result {
            case .success(let data):
                do {
                    let loginResponse = try JSONDecoder().decode(LoginResponse.self, from: data)
                    // Save the token to UserDefaults
                    UserDefaults.standard.set(loginResponse.token, forKey: "userToken")
                    // Print the saved token to verify
                    if let savedToken = UserDefaults.standard.string(forKey: "userToken") {
                        print("Token saved in UserDefaults: \(savedToken)")
                    } else {
                        print("Failed to save the token in UserDefaults.")
                    }
                    completion(.success(loginResponse))
                } catch {
                    completion(.failure(.invalidResponse))
                }
            case .failure(let error):
                completion(.failure(.serverError(error.localizedDescription)))
            }
        }
    }
}

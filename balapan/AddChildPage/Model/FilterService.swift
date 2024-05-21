//
//  FilterService.swift
//  balapan
//
//  Created by Nurbol on 20.05.2024.
//

import Foundation
import Alamofire

final class FilterService {

    // MARK: - Network
    func updateUserFilter(
        requestBody: UpdateUserFilterRequest,
        completion: @escaping (Result<UpdateUserFilterResponse, FilterErrorResponse>) -> Void
    ) {
        let url = "https://balapan.onrender.com/api/user/filter"

        // Создание параметров запроса
        let parameters: [String: Any] = [
            "categories": requestBody.categories,
            "types": requestBody.types,
            "gender": requestBody.gender,
            "age": requestBody.age
        ]

        // Извлечение токена из UserDefaults
        let defaults = UserDefaults.standard
        guard let token = defaults.string(forKey: "userToken") else {
            completion(.failure(FilterErrorResponse(error: "Token not found")))
            return
        }

        // Установка заголовков запроса
        let headers: HTTPHeaders = [
            "Content-Type": "application/json",
            "token": "\(token)"
        ]

        // Выполнение запроса с использованием Alamofire
        AF.request(url, method: .put, parameters: parameters, encoding: JSONEncoding.default, headers: headers)
            .validate()
            .responseDecodable(of: UpdateUserFilterResponse.self) { response in
                switch response.result {
                case .success(let updateResponse):
                    completion(.success(updateResponse))
                case .failure(let error):
                    if let data = response.data {
                        do {
                            let errorResponse = try JSONDecoder().decode(FilterErrorResponse.self, from: data)
                            completion(.failure(errorResponse))
                        } catch {
                            completion(.failure(FilterErrorResponse(error: error.localizedDescription)))
                        }
                    } else {
                        completion(.failure(FilterErrorResponse(error: error.localizedDescription)))
                    }
                }
            }
    }

}


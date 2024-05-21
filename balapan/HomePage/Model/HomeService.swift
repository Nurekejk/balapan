//
//  HomeService.swift
//  balapan
//
//  Created by Nurbol on 19.05.2024.
//

import Foundation
import Alamofire

final class HomeService {

    // MARK: - Network

    func getAllPlaylists(completion: @escaping (Result<[Playlist], ErrorResponse>) -> Void) {
        let url = "https://balapan.onrender.com/api/playlists"


        // Извлечение данных токена из UserDefaults
        let defaults = UserDefaults.standard
        guard let token = defaults.string(forKey: "userToken") else {
            completion(.failure(ErrorResponse(message: "Token not found")))
            return
        }

        // Установка заголовков запроса
        let headers: HTTPHeaders = [
            "Content-Type": "application/json",
            "token": "\(token)"
        ]

        AF.request(url, method: .get, headers: headers).responseDecodable(of: [Playlist].self) { response in
            switch response.result {
            case .success(let playlists):
                completion(.success(playlists))
            case .failure(let error):
                if let data = response.data {
                    do {
                        let errorResponse = try JSONDecoder().decode(ErrorResponse.self, from: data)
                        completion(.failure(errorResponse))
                    } catch {
                        completion(.failure(ErrorResponse(message: "Не удалось декодировать ошибку: \(error.localizedDescription)")))
                    }
                } else {
                    completion(.failure(ErrorResponse(message: "Неизвестная ошибка: \(error.localizedDescription)")))
                }
            }
        }
    }
}

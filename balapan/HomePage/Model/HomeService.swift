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

        let defaults = UserDefaults.standard

        // Извлечение данных токена из UserDefaults
        guard let data = defaults.data(forKey: SignUpViewController.defaultsTokensKey),
              let tokenData = try? JSONDecoder().decode(SignUpResponse.self, from: data) else {
            completion(.failure(ErrorResponse(message: "Токен не найден или не может быть декодирован")))
            return
        }

        // Настройка заголовков с токеном
        let headers: HTTPHeaders = [
            "Authorization": "Bearer \(tokenData.access_token)",
            "Accept": "application/json"
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

//
//  VideoPlayerViewController.swift
//  balapan
//
//  Created by Nurbol on 21.05.2024.
//

import UIKit
import youtube_ios_player_helper

class VideoPlayerViewController: UIViewController, YTPlayerViewDelegate {

    private let playerView: YTPlayerView = {
        let playerView = YTPlayerView()
        return playerView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        setupConstraints()
//        playerView.loadVideo(byURL: <#T##String#>, startSeconds: <#T##Float#>)

    }
    private func setupViews(){
        view.addSubview(playerView)
    }
    private func setupConstraints(){
        playerView.snp.makeConstraints { make in
            make.top.leading.trailing.bottom.equalToSuperview()
        }
    }


}

//
//  SnackBarController.swift
//  balapan
//
//  Created by Nurbol on 18.05.2024.
//

import UIKit
import SnackBar_swift

final class SnackBarController: SnackBar {

    override var style: SnackBarStyle {
        var style = SnackBarStyle()
        style.background = .lightGray
        style.textColor = .gray
        return style
    }

    static func showSnackBar(in view: UIView, message: String, duration: Duration) {
        let snackBar = SnackBarController.make(in: view, message: message, duration: duration)
        snackBar.show()
    }

}

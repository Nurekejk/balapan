//
//  AuthTextField.swift
//  balapan
//
//  Created by Nurbol on 11.04.2024.
//

import UIKit

class AuthTextField: UITextField {

    let leftViewWidth: CGFloat = 16.0
    let leftViewHeight: CGFloat = 15.0
    let rightViewWidth: CGFloat = 20.0
    let rightViewHeight: CGFloat = 18.0

    let padding: CGFloat = 16.0

    override func leftViewRect(forBounds bounds: CGRect) -> CGRect {
        let middlePointAdjuster = (bounds.height - leftViewHeight) / 2.0
        let leftBounds = CGRect(x: padding,
                                 y: middlePointAdjuster,
                                 width: leftViewWidth,
                                 height: leftViewHeight)
            return leftBounds
    }
    override func rightViewRect(forBounds bounds: CGRect) -> CGRect {
        let middlePointAdjuster = (bounds.height - rightViewHeight) / 2.0
        let rightBounds = CGRect(x: bounds.width - rightViewWidth - padding,
                                  y: middlePointAdjuster,
                                 width: rightViewWidth,
                                 height: rightViewHeight)
            return rightBounds
    }


    override open func textRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: UIEdgeInsets(top: 0, left: padding + leftViewWidth + 10, bottom: 0, right: 10))
    }

    override open func placeholderRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: UIEdgeInsets(top: 0, left: padding + leftViewWidth + 10, bottom: 0, right: 10))
    }

    override open func editingRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: UIEdgeInsets(top: 0, left: padding + leftViewWidth + 10, bottom: 0, right: 10))
    }

}

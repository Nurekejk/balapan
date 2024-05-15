//
//  DefaultTextField.swift
//  balapan
//
//  Created by Nurbol on 14.05.2024.
//

import UIKit

class DefaultTextField: UITextField {

    let padding: CGFloat = 16.0

    override open func textRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: UIEdgeInsets(top: 0, left: padding , bottom: 0, right: 10))
    }

    override open func placeholderRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: UIEdgeInsets(top: 0, left: padding, bottom: 0, right: 10))
    }

    override open func editingRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: UIEdgeInsets(top: 0, left: padding, bottom: 0, right: 10))
    }

}

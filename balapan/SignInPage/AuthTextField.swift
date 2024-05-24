////
////  AuthTextField.swift
////  balapan
////
////  Created by Nurbol on 11.04.2024.
////
//
import UIKit

class AuthTextField: UITextField, UITextFieldDelegate {

    let leftViewWidth: CGFloat = 16.0
    let leftViewHeight: CGFloat = 15.0
    let rightViewWidth: CGFloat = 20.0
    let rightViewHeight: CGFloat = 18.0

    let padding: CGFloat = 16.0

    // Initializer
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }

    private func commonInit() {
        // Add target for text change
        layer.borderWidth = 1.0 // Initial border width
        layer.borderColor = UIColor.lightGray.cgColor // Initial border color
        delegate = self // Set the delegate
    }

    // UITextFieldDelegate method to handle when editing begins
    func textFieldDidBeginEditing(_ textField: UITextField) {
        layer.borderColor = AppColor.red300.cgColor // Change to desired color when editing begins
    }

    // UITextFieldDelegate method to handle when editing ends
    func textFieldDidEndEditing(_ textField: UITextField) {
        layer.borderColor = UIColor.lightGray.cgColor // Change to initial color when editing ends
    }

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

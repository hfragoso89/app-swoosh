//
//  BorderButton.swift
//  app-swoosh
//
//  Created by Fragoso, Hector on 1/15/20.
//  Copyright © 2020 Fragoso, Hector. All rights reserved.
//

import UIKit

class BorderButton: UIButton {

    override class func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func selectButton(){
        self.titleLabel?.font = UIFont.systemFont(ofSize: 19, weight: .heavy)
        self.borderWidth = 4.0
        self.tintColor = UIColor.systemGray2
    }
    
    func deselectButton(){
        self.titleLabel?.font = UIFont.systemFont(ofSize: 19, weight: .medium)
        self.borderWidth = 2.0
        self.tintColor = UIColor.systemFill
    }
    
}

@IBDesignable extension UIButton {

    @IBInspectable var borderWidth: CGFloat {
        set {
            layer.borderWidth = newValue
        }
        get {
            return layer.borderWidth
        }
    }

    @IBInspectable var cornerRadius: CGFloat {
        set {
            layer.cornerRadius = newValue
        }
        get {
            return layer.cornerRadius
        }
    }

    @IBInspectable var borderColor: UIColor? {
        set {
            guard let uiColor = newValue else { return }
            layer.borderColor = uiColor.cgColor
        }
        get {
            guard let color = layer.borderColor else { return nil }
            return UIColor(cgColor: color)
        }
    }
}

//
//  FoodButton.swift
//  TamagotchiProject
//
//  Created by Jae Oh on 2023/08/21.
//

import UIKit

@IBDesignable
class FoodButton: UIButton {
    
    @IBInspectable var cornerRadius: CGFloat {
        get { return layer.cornerRadius }
        set { layer.cornerRadius = newValue }
    }
    
    @IBInspectable var borderWidth: CGFloat {
        get {return layer.borderWidth }
        set { layer.borderWidth = newValue }
    }
    @IBInspectable var boderColor: UIColor {
        get { return UIColor(cgColor: layer.borderColor!)}
        set { layer.borderColor = newValue.cgColor}
    }

}

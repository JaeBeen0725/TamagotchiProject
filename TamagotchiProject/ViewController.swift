//
//  ViewController.swift
//  TamagotchiProject
//
//  Created by Jae Oh on 2023/08/04.
//

import UIKit

enum Feed: Int {
    case food
    case water
}


class ViewController: UIViewController {
    
    
    @IBOutlet var mainTamaImageView: UIImageView!
    @IBOutlet var mainTamaLebel: UILabel!
    
    @IBOutlet var level: UILabel!
    @IBOutlet var foodCount: UILabel!
    @IBOutlet var waterCount: UILabel!
    @IBOutlet var mentTextView: UITextView!
    
    
    @IBOutlet var fooood: UITextField!
    @IBOutlet var waaater: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    @IBAction func foodAndWater(_ sender: UIButton) {
        
        guard let food = Feed(rawValue: sender.tag) else {
            print("오류")
            return
        }
        switch food {
        case .food :
            if fooood.text == "" {
                let count = UserDefaults.standard.integer(forKey: "ff")
                let num = count + 1
                UserDefaults.standard.set(num, forKey: "ff")
                foodCount.text = "밥알\(UserDefaults.standard.integer(forKey: "ff"))개"
            } else {
                let count = UserDefaults.standard.integer(forKey: "ff")
                let num = count + Int(fooood.text!)!
                UserDefaults.standard.set(num, forKey: "ff")
                foodCount.text = "밥알\(UserDefaults.standard.integer(forKey: "ff"))개"
            }
            
        case .water :
            if waaater.text == "" {
                let countt = UserDefaults.standard.integer(forKey: "ww")
                let numt = countt + 1
                UserDefaults.standard.set(numt, forKey: "ww")
                waterCount.text = "물방울 \(UserDefaults.standard.integer(forKey: "ww"))개"
            } else {
                let countt = UserDefaults.standard.integer(forKey: "ww")
                let numt = countt + Int(waaater.text!)!
                UserDefaults.standard.set(numt, forKey: "ww")
                waterCount.text = "물방울\(UserDefaults.standard.integer(forKey: "ww"))개"
            }
            
        }
        let a: Double = UserDefaults.standard.double(forKey: "ff")
        let b: Double = UserDefaults.standard.double(forKey: "ww")
        print("f: \(a)")
        print("w: \(b)")
        var levell = Int(a / 5 + b / 2)
        print(levell)
        
        switch levell {
        case 0 ..< 20 :
           return level.text = "LV1"
        case 20 ..< 30:
            return level.text = "LV2"
        case 30 ..< 40:
            return level.text = "LV3"
        case 40 ..< 50:
            return level.text = "LV4"
        case 50 ..< 60:
            return level.text = "LV5"
        case 60 ..< 70:
            return level.text = "LV6"
        case 70 ..< 80:
            return level.text = "LV7"
        case 80 ..< 90:
            return level.text = "Lv8"
        case 90 ..< 100:
            return level.text = "LV9"
        case 100... :
            return level.text = "LV10"
        default:
            return level.text = "노노(얼럿예정)"
        }
        
    }
    
}

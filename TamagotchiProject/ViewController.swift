//
//  ViewController.swift
//  TamagotchiProject
//
//  Created by Jae Oh on 2023/08/04.
//

import UIKit

enum Feed: Int {
    case food, water
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
                print(num)
            } else {
                let count = UserDefaults.standard.integer(forKey: "ff")
                let num = count + Int(fooood.text!)!
                UserDefaults.standard.set(num, forKey: "ff")
                print(num)
            }
            let a = UserDefaults.standard.integer(forKey: "ff")
            print(a)
        case .water :
            let count = UserDefaults.standard.integer(forKey: "ww")
            let num = count + 1
            UserDefaults.standard.set(num, forKey: "ww")
        }
        
        
        
    }
    
}


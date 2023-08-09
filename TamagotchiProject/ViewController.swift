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
    let tamaArray = TamaCellArray()
    
    @IBOutlet var mainTamaImageView: UIImageView!
    @IBOutlet var mainTamaLebel: UILabel!
    
    @IBOutlet var mentView: UIView!
    @IBOutlet var level: UILabel!
    @IBOutlet var foodCount: UILabel!
    @IBOutlet var waterCount: UILabel!
    @IBOutlet var mentTextView: UITextView!
    
    
    @IBOutlet var fooood: UITextField!
    @IBOutlet var waaater: UITextField!
    
    @IBOutlet var foooodButton: UIButton!
    @IBOutlet var waaaaterButton: UIButton!
    var number = 0
    let bossname = UserDefaults.standard.string(forKey: "bossName")
    override func viewDidLoad() {
        super.viewDidLoad()
        
        fooood.keyboardType = .numberPad
        waaater.keyboardType = .numberPad
        if bossname == "" || bossname == nil {
            navigationItem.title = "대장님의 다마고치"
        } else {
            navigationItem.title = bossname
        }
        view.backgroundColor = UIColor(red: 245/255, green: 252/255, blue: 252/255, alpha: 1)
        mainTamaLebel.backgroundColor = UIColor(red: 245/255, green: 252/255, blue: 252/255, alpha: 1)
        mainTamaImageView.backgroundColor = UIColor(red: 245/255, green: 252/255, blue: 252/255, alpha: 1)
        mentView.backgroundColor = UIColor(red: 245/255, green: 252/255, blue: 252/255, alpha: 1)
        mentTextView.backgroundColor = UIColor(red: 245/255, green: 252/255, blue: 252/255, alpha: 1)
        fooood.borderStyle = .none
        fooood.placeholder = "밥주세요"
        fooood.textAlignment = .center
        waaater.borderStyle = .none
        waaater.placeholder = "물주세요"
        waaater.textAlignment = .center
        foooodButton.titleLabel?.font = UIFont.systemFont(ofSize: 2)
        foooodButton.layer.cornerRadius = 5
        foooodButton.setTitle("밥먹기", for: .normal)
        foooodButton.setImage(UIImage(systemName: "leaf.circle"), for: .normal)
        foooodButton.layer.borderWidth = 2
        waaaaterButton.titleLabel?.font = UIFont.systemFont(ofSize: 1)
        waaaaterButton.layer.cornerRadius = 5
        waaaaterButton.setTitle("물먹기", for: .normal)
        waaaaterButton.setImage(UIImage(systemName: "drop.circle"), for: .normal)
        waaaaterButton.layer.borderWidth = 2
        mainTamaLebel.textAlignment = .center
        
        mainTamaLebel.layer.borderWidth = 2
        mainTamaLebel.layer.cornerRadius = 5
        level.textAlignment = .center
        level.sizeToFit()
        foodCount.textAlignment = .center
        foodCount.sizeToFit()
        waterCount.textAlignment = .center
        waterCount.sizeToFit()
        waterCount.adjustsFontSizeToFitWidth = true
        
        egqwg()
        
        foodCount.text = "밥알\(UserDefaults.standard.integer(forKey: "ff"))개"
        waterCount.text = "물방울\(UserDefaults.standard.integer(forKey: "ww"))개"
        mentTextView.textAlignment = .center
        //        mentTextView.adjustsFontForContentSizeCategory = true
        mentTextView.sizeToFit()
        
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "person.circle"), style: .plain, target: self, action: #selector(buttonClicked))
        
    }
    
    @objc
    func buttonClicked() {
        
        let targetStoryBoard = UIStoryboard(name: "SetUp", bundle: nil)
        let selectVC = targetStoryBoard.instantiateViewController(identifier: "SetUpViewController") as! SetUpViewController
        
        navigationController?.pushViewController(selectVC, animated: true)
        //      let navigation = UINavigationController(rootViewController: selectVC)
        //      navigation.modalPresentationStyle = .overCurrentContext
        
        
        //      present(navigation, animated: true)
        
    }
    
    
    @IBAction func foodAndWater(_ sender: UIButton) {
        
        guard let food = Feed(rawValue: sender.tag) else {
            print("오류")
            return
        }
        switch food {
        case .food:
            
            if let f = fooood.text{
                if f.isEmpty{
                    let count = UserDefaults.standard.integer(forKey: "ff")
                    let num = count + 1
                    UserDefaults.standard.set(num, forKey: "ff")
                    foodCount.text = "밥알 \(UserDefaults.standard.integer(forKey: "ff"))개"
                } else {
                    guard let ff = Int(f) else{ return wrongWordShowAlert()}
                    if ff > 0 && ff < 100 {
                        let count = UserDefaults.standard.integer(forKey: "ff")
                        let num = count + ff
                        UserDefaults.standard.set(num, forKey: "ff")
                        foodCount.text = "밥알 \(UserDefaults.standard.integer(forKey: "ff"))개"
                    }else {
                        wrongWordShowAlert()
                    }
                }
            }
            
            
        case .water:
            if let w = waaater.text{
                if w.isEmpty{
                    let countt = UserDefaults.standard.integer(forKey: "ww")
                    let num1 = countt + 1
                    UserDefaults.standard.set(num1, forKey: "ww")
                    waterCount.text = "물 \(UserDefaults.standard.integer(forKey: "ww"))개"
                } else {
                    guard let ww = Int(w) else{ return wrongWordShowAlert() }
                    if ww > 0 && ww < 100 {
                        let countt = UserDefaults.standard.integer(forKey: "ww")
                        let num1 = countt + ww
                        UserDefaults.standard.set(num1, forKey: "ww")
                        waterCount.text = "물 \(UserDefaults.standard.integer(forKey: "ww"))개"
                    }else {
                        wrongWordShowAlert()
                    }
                }
            }
        }
        egqwg()
        
        
        
        /*
         switch food {
         case .food :
         
         if a == "" && a == nil {
         let count = UserDefaults.standard.integer(forKey: "ff")
         let num = count + 1
         UserDefaults.standard.set(num, forKey: "ff")
         foodCount.text = "밥알 \(UserDefaults.standard.integer(forKey: "ff"))개"
         } else if Int(a!)! > 0 && Int(a!)! < 100{
         let count = UserDefaults.standard.integer(forKey: "ff")
         let num = count + Int(a!)!
         UserDefaults.standard.set(num, forKey: "ff")
         foodCount.text = "밥알 \(UserDefaults.standard.integer(forKey: "ff"))개"
         } else {
         fullshowAlert()
         }
         
         case .water :
         if b == "" {
         let countt = UserDefaults.standard.integer(forKey: "ww")
         let numt = countt + 1
         UserDefaults.standard.set(numt, forKey: "ww")
         waterCount.text = "물방울 \(UserDefaults.standard.integer(forKey: "ww"))개"
         } else {
         let countt = UserDefaults.standard.integer(forKey: "ww")
         let numt = countt + Int(b!)!
         UserDefaults.standard.set(numt, forKey: "ww")
         waterCount.text = "물방울 \(UserDefaults.standard.integer(forKey: "ww"))개"
         
         }
         
         }
         */
        
    }
    
    func egqwg() {
        let a: Double = UserDefaults.standard.double(forKey: "ff")
        let b: Double = UserDefaults.standard.double(forKey: "ww")
        print("f: \(a)")
        print("w: \(b)")
        let levell = Int(a / 5 + b / 2)
        print(levell)
        
        switch levell {
        case 0 ..< 20 :
            level.text = "LV\(levell / 10)"
            mainTamaImageView.image = tamaArray.growtama[number][0]
            mainTamaLebel.text = tamaArray.tamaName[number]
            mentTextView.text = tamaArray.tamaMent.randomElement()!
        case 20 ..< 30:
            level.text = "LV\(levell / 10)"
            mainTamaImageView.image = tamaArray.growtama[number][1]
            mainTamaLebel.text = tamaArray.tamaName[number]
            mentTextView.text = tamaArray.tamaMent.randomElement()!
        case 30 ..< 40:
            level.text = "LV3"
            mainTamaImageView.image = tamaArray.growtama[number][2]
            mainTamaLebel.text = tamaArray.tamaName[number]
            mentTextView.text = tamaArray.tamaMent.randomElement()!
        case 40 ..< 50:
            level.text = "LV4"
            mainTamaImageView.image = tamaArray.growtama[number][3]
            mainTamaLebel.text = tamaArray.tamaName[number]
            mentTextView.text = tamaArray.tamaMent.randomElement()!
        case 50 ..< 60:
            level.text = "LV5"
            mainTamaImageView.image = tamaArray.growtama[number][4]
            mainTamaLebel.text = tamaArray.tamaName[number]
            mentTextView.text = tamaArray.tamaMent.randomElement()!
        case 60 ..< 70:
            level.text = "LV6"
            mainTamaImageView.image = tamaArray.growtama[number][5]
            mainTamaLebel.text = tamaArray.tamaName[number]
            mentTextView.text = tamaArray.tamaMent.randomElement()!
        case 70 ..< 80:
            level.text = "LV7"
            mainTamaImageView.image = tamaArray.growtama[number][6]
            mainTamaLebel.text = tamaArray.tamaName[number]
            mentTextView.text = tamaArray.tamaMent.randomElement()!
        case 80 ..< 90:
            level.text = "Lv8"
            mainTamaImageView.image = tamaArray.growtama[number][7]
            mainTamaLebel.text = tamaArray.tamaName[number]
            mentTextView.text = tamaArray.tamaMent.randomElement()!
        case 90 ..< 100:
            level.text = "LV9"
            mainTamaImageView.image = tamaArray.growtama[number][8]
            mainTamaLebel.text = tamaArray.tamaName[number]
            mentTextView.text = tamaArray.tamaMent.randomElement()!
        case 100... :
            level.text = "LV10"
            mainTamaImageView.image = tamaArray.growtama[number][8]
            mainTamaLebel.text = tamaArray.tamaName[number]
            mentTextView.text = tamaArray.fulltamaMent.randomElement()!
        default:
            level.text = "노노"
        }
    }
    
}



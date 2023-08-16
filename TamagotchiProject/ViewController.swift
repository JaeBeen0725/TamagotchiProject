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
enum ValidationError: Error {
    case emptyString
    case isNotInt
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
    
    
    @IBOutlet var foodTextField: UITextField!
    @IBOutlet var waterTextField: UITextField!
    
    @IBOutlet var foooodButton: UIButton!
    @IBOutlet var waaaaterButton: UIButton!
    var number = 0
    
    var bossname = UserDefaults.standard.string(forKey: "bossName")
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //        fooood.keyboardType = .numberPad
        //        waaater.keyboardType = .numberPad
        print("====\(number)")
        
        
        
        
        view.backgroundColor = UIColor(red: 245/255, green: 252/255, blue: 252/255, alpha: 1)
        mainTamaLebel.backgroundColor = UIColor(red: 245/255, green: 252/255, blue: 252/255, alpha: 1)
        mainTamaImageView.backgroundColor = UIColor(red: 245/255, green: 252/255, blue: 252/255, alpha: 1)
        mentView.backgroundColor = UIColor(red: 245/255, green: 252/255, blue: 252/255, alpha: 1)
        mentTextView.backgroundColor = UIColor(red: 245/255, green: 252/255, blue: 252/255, alpha: 1)
        foodTextField.borderStyle = .none
        foodTextField.placeholder = "밥주세요"
        foodTextField.textAlignment = .center
        waterTextField.borderStyle = .none
        waterTextField.placeholder = "물주세요"
        waterTextField.textAlignment = .center
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
        
        tamaBriefing()
        
        
        mentTextView.textAlignment = .center
        //        mentTextView.adjustsFontForContentSizeCategory = true
        mentTextView.sizeToFit()
        
        //  navigationController?.navigationBar.topItem?.backButtonTitle = "뒤로"
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "person.circle"), style: .plain, target: self, action: #selector(buttonClicked))
        
    }
    
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        foodCount.text = "밥알\(UserDefaults.standard.integer(forKey: "ff"))개"
        waterCount.text = "물방울\(UserDefaults.standard.integer(forKey: "ww"))개"
        tamaBriefing()
        bossname = UserDefaults.standard.string(forKey: "bossName")
        
        if bossname == "  " || bossname == nil {
            
            navigationItem.title = "대장님의 다마고치"
            
        } else {
            
            navigationItem.title = bossname
            
        }
        print("MLifeCycleViewController", #function)
    }
    
    @IBAction func keyboard(_ sender: UITapGestureRecognizer) {
        view.endEditing(true)
    }
    
    
    
    @objc
    func buttonClicked() {
        
        let targetStoryBoard = UIStoryboard(name: "SetUp", bundle: nil)
        let selectVC = targetStoryBoard.instantiateViewController(identifier: "SetUpViewController") as! SetUpViewController
        
        navigationController?.pushViewController(selectVC, animated: true)
        
        
    }
    
    @discardableResult
    func validateUserImputError(text: String) throws -> Bool {
        
        guard !(text.isEmpty) else {
            print("빈값")
            throw ValidationError.emptyString
        }
        
        guard Int(text) != nil else {
            print("숫자 아님")
            throw ValidationError.isNotInt
        }
        return true
    }
    
    
    @IBAction func foodAndWater(_ sender: UIButton) {
        
        guard let feed = Feed(rawValue: sender.tag) else {
            print("오류")
            return
        }
        switch feed {
            
        case .food:
            
            guard let foodText =  foodTextField.text else {
                showAlert()
                return
            }
            
            do {
                try validateUserImputError(text: foodText)
                
                guard let intFood = Int(foodText) else {
                    showAlert()
                    return
                }
                if intFood > 0 && intFood < 100 {
                    let count = UserDefaults.standard.integer(forKey: "food")
                    let num = count + intFood
                    UserDefaults.standard.set(num, forKey: "food")
                    foodCount.text = "밥알 \(UserDefaults.standard.integer(forKey: "food"))개"
                    foodTextField.text = ""
                } else {
                    numShowAlert()
                }
            }
            catch ValidationError.emptyString {
                
                let count = UserDefaults.standard.integer(forKey: "food")
                let num = count + 1
                UserDefaults.standard.set(num, forKey: "food")
                foodCount.text = "밥알 \(UserDefaults.standard.integer(forKey: "food"))개"
                
            } catch ValidationError.isNotInt {
                numShowAlert()
            } catch {
                showAlert()
            }
            
            
           /*
            if let foodText = foodTextField.text{ // 옵셔널 바인딩
                if foodText.isEmpty{ // isEmpty
                    let count = UserDefaults.standard.integer(forKey: "food")
                    let num = count + 1
                    UserDefaults.standard.set(num, forKey: "food")
                    foodCount.text = "밥알 \(UserDefaults.standard.integer(forKey: "food"))개"
                    
                } else {
                    guard let intFood = Int(foodText) else{ return wrongWordShowAlert()} // 숫자
                    if intFood > 0 && intFood < 100 {
                        let count = UserDefaults.standard.integer(forKey: "food")
                        let num = count + intFood
                        UserDefaults.standard.set(num, forKey: "food")
                        foodCount.text = "밥알 \(UserDefaults.standard.integer(forKey: "food"))개"
                        foodTextField.text = ""
                    }else {
                        wrongWordShowAlert()
                    }
                }
            }
            */
            
            
        case .water:
            
            guard let waterText =  waterTextField.text
                  else {
                showAlert()
                return
            }
            
            do {
                 try validateUserImputError(text: waterText)
                
                if Int(waterText)! > 0 && Int(waterText)! < 50 {
                    let watercount = UserDefaults.standard.integer(forKey: "water")
                    let waternum = watercount + Int(waterText)!
                    UserDefaults.standard.set(waternum, forKey: "water")
                    waterCount.text = "물방울 \(UserDefaults.standard.integer(forKey: "water"))개"
                    waterTextField.text = ""
                } else {
                        numShowAlert()
                    }
            }
            catch ValidationError.emptyString {
                
                let watercount = UserDefaults.standard.integer(forKey: "water")
                let waternum = watercount + 1
                UserDefaults.standard.set(waternum, forKey: "water")
                waterCount.text = "물방울 \(UserDefaults.standard.integer(forKey: "water"))개"
                
            } catch ValidationError.isNotInt {
                numShowAlert()
            } catch {
                showAlert()
            }
            
            /*
            if let waterText = waterTextField.text{
                if waterText.isEmpty{
                    let countt = UserDefaults.standard.integer(forKey: "water")
                    let num1 = countt + 1
                    UserDefaults.standard.set(num1, forKey: "water")
                    waterCount.text = "물방울 \(UserDefaults.standard.integer(forKey: "water"))개"
                } else {
                    guard let intWater = Int(waterText) else{ return wrongWordShowAlert() }
                    if intWater > 0 && intWater < 100 {
                        let countt = UserDefaults.standard.integer(forKey: "water")
                        let num1 = countt + intWater
                        UserDefaults.standard.set(num1, forKey: "water")
                        waterCount.text = "물방울 \(UserDefaults.standard.integer(forKey: "water"))개"
                        waterTextField.text = ""
                    }else {
                        wrongWordShowAlert()
                    }
                }
            }
             */
        }
             
        tamaBriefing()
        
    }
    
    func tamaBriefing() {
        let foodcount: Double = UserDefaults.standard.double(forKey: "food")
        let watercount: Double = UserDefaults.standard.double(forKey: "water")
     
        let levell = Int(foodcount / 5 + watercount / 2)

            
            switch levell {
            case 0 ..< 20 :
                level.text = "LV1"
                mainTamaImageView.image = tamaArray.growtama[number][0]
                mainTamaLebel.text = tamaArray.tamaName[number]
                mentTextView.text = tamaArray.tamaMent.randomElement()!
            case 20 ..< 30:
                level.text = "LV2"
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





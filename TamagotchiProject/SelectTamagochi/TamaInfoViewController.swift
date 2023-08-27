//
//  TamaInfoViewController.swift
//  TamagotchiProject
//
//  Created by Jae Oh on 2023/08/05.
//
import UIKit

class TamaInfoViewController: UIViewController, UIWindowSceneDelegate{
    let tamacellArray = TamaCellArray()
    
    @IBOutlet var viewview: UIView!
    @IBOutlet var tamaSelectImage: UIImageView!
    @IBOutlet var tamaSelectLabel: UILabel!
    @IBOutlet var tamaSelectMentTextView: UITextView!
    @IBOutlet var cancleButton: UIButton!
    @IBOutlet var selectButton: UIButton!
    
//    var tamaSelectImage1: UIImage = UIImage(named: "1-2")!
//    var tamaSelectLabel1: String = "w"
//    var tamaSelectMentTextView1: String = "q"
    let selectNum = UserDefaults.standard.integer(forKey: "num")
    override func viewDidLoad() {
        super.viewDidLoad()
        cancleButton.titleLabel?.text = "취소"
        selectButton.titleLabel?.text = "변경하기"
        view.backgroundColor = UIColor.init(_colorLiteralRed: 0, green: 0, blue: 0, alpha: 0.5)
        view.isOpaque = false
        viewview.backgroundColor = UIColor(red: 245/255, green: 252/255, blue: 252/255, alpha: 1)
        tamaSelectLabel.layer.cornerRadius = 5
        
        tamaSelectImage.image = tamacellArray.tamaImage[selectNum]
        tamaSelectLabel.sizeToFit()
        tamaSelectLabel.adjustsFontSizeToFitWidth = true
        tamaSelectLabel.text = tamacellArray.tamaName[selectNum]
        tamaSelectLabel.layer.cornerRadius =  5
        tamaSelectLabel.layer.borderWidth = 1
        tamaSelectLabel.textAlignment = .center
        tamaSelectMentTextView.text = tamacellArray.tamament[selectNum]
        tamaSelectMentTextView.backgroundColor = UIColor(red: 245/255, green: 252/255, blue: 252/255, alpha: 1)
        tamaSelectMentTextView.textAlignment = .center
        
        
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        cancleButton.titleLabel?.text = "취소"
        selectButton.titleLabel?.text = "변경하기"
        
    }
    
   
    @IBAction func cancleButton(_ sender: UIButton) {
        
      dismiss(animated: true, completion: nil)
    }
    
    
    @IBAction func selectTama(_ sender: UIButton) {
        
        UserDefaults.standard.set(true, forKey: "isLaunched")
        
        let mainsb = UIStoryboard(name: "Main", bundle: nil)
        
        guard let mainvc = mainsb.instantiateViewController(identifier: "ViewController") as? ViewController else { return }
        let nv = UINavigationController(rootViewController: mainvc)
       
        present(nv, animated: false)
      
        
            mainvc.number = UserDefaults.standard.integer(forKey: "num")
     
        
        
    }
    
    
    
    
    
}








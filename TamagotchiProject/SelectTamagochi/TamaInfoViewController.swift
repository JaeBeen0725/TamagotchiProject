//
//  TamaInfoViewController.swift
//  TamagotchiProject
//
//  Created by Jae Oh on 2023/08/05.
//
import UIKit

class TamaInfoViewController: UIViewController, UIWindowSceneDelegate{
    

    @IBOutlet var viewview: UIView!
    @IBOutlet var tamaSelectImage: UIImageView!
    @IBOutlet var tamaSelectLabel: UILabel!
    @IBOutlet var tamaSelectMentTextView: UITextView!
    @IBOutlet var cancleButton: UIButton!
    @IBOutlet var selectButton: UIButton!
    
    var tamaSelectImage1: UIImage = UIImage(named: "1-2")!
    var tamaSelectLabel1: String = "w"
    var tamaSelectMentTextView1: String = "q"
    override func viewDidLoad() {
        super.viewDidLoad()
       view.backgroundColor = UIColor.init(_colorLiteralRed: 0, green: 0, blue: 0, alpha: 0.5)
      view.isOpaque = false
        viewview.backgroundColor = UIColor(red: 245/255, green: 252/255, blue: 252/255, alpha: 1)
        tamaSelectLabel.layer.cornerRadius = 5
        tamaSelectImage.image = tamaSelectImage1
        tamaSelectLabel.text = tamaSelectLabel1
        tamaSelectLabel.textAlignment = .center
       tamaSelectMentTextView.text = tamaSelectMentTextView1
        tamaSelectMentTextView.backgroundColor = UIColor(red: 245/255, green: 252/255, blue: 252/255, alpha: 1)
        tamaSelectMentTextView.textAlignment = .center
        cancleButton.titleLabel?.text = "취소"
        selectButton.titleLabel?.text = "변경하기"
    }
    
    @IBAction func cancleButtonClicked(_ sender: UIButton) {
       dismiss(animated: true, completion: nil)
    }
  

    @IBAction func selectTama(_ sender: UIButton) {
       
       
       let mainsb = UIStoryboard(name: "Main", bundle: nil)
        let mainvc = mainsb.instantiateViewController(identifier: "ViewController") as! ViewController
        let nv = UINavigationController(rootViewController: mainvc)

        mainvc.number = UserDefaults.standard.integer(forKey: "num")
        nv.modalPresentationStyle = .fullScreen
        present(nv, animated: false)
            }
    
   

}
    
    
        
        
        
    
    
    
  
    
    
     
      
    
    
    
   
    
    


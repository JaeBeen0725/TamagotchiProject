//
//  ChangeNameViewController.swift
//  TamagotchiProject
//
//  Created by Jae Oh on 2023/08/06.
//

import UIKit

class ChangeNameViewController: UIViewController {
let vc = ViewController()
    @IBOutlet var bossNameChangeTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bossNameChangeTextField.placeholder = "대장님의 이름을 정해주세요."
        bossNameChangeTextField.borderStyle = .none
       
        navigationItem.title = "대장님 이름 정하기"
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "저장", style: .plain, target: self, action: #selector(changeButtonClicked))
        
        
    }
    @objc
    func changeButtonClicked() {
      
        if bossNameChangeTextField.text!.count >= 2 && bossNameChangeTextField.text!.count <= 6 {
            
            UserDefaults.standard.set(bossNameChangeTextField.text, forKey: "bossName")
            navigationController?.popViewController(animated: true)
        } else {
            showAlert()
            bossNameChangeTextField.text = ""
        }
    }
    
   


}

//
//  Alert.swift
//  TamagotchiProject
//
//  Created by Jae Oh on 2023/08/04.
//

import UIKit


extension SelectTamagochiViewController {
    
    func showAlert() {
        
        let alert = UIAlertController(title: "오류", message: "관리자에게 문의하세요", preferredStyle: .actionSheet)
        let ok = UIAlertAction(title: "확인", style: .default)
        alert.addAction(ok)
        present(alert, animated: true)
    }
    
    
}

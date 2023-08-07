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
    
    


func showAlert1() {
    
    let alert = UIAlertController(title: "타마가 없어요", message: "빠른시일 내에 업데이트 하겠습니다.", preferredStyle: .actionSheet)
    let ok = UIAlertAction(title: "확인", style: .default)
    alert.addAction(ok)
    present(alert, animated: true)
}


}


extension ChangeNameViewController {
    func showAlert() {
        
        let alert = UIAlertController(title: "다시 작성하세요", message: "두글자 이상 여섯글자 이하입니다.", preferredStyle: .actionSheet)
        let ok = UIAlertAction(title: "확인", style: .default)
        alert.addAction(ok)
        present(alert, animated: true)
    }
}


extension SetUpViewController {
    func showAlert() {

let alert = UIAlertController(title: "데이터 초기화", message: "처음부터 다시 키우시겠습니까?", preferredStyle: .alert)

let cancel = UIAlertAction(title: "아니오!", style: .cancel)
let ok = UIAlertAction(title: "예!", style: .default , handler: { _ in for key in
                                                                            
    UserDefaults.standard.dictionaryRepresentation().keys {
    UserDefaults.standard.removeObject(forKey: key.description)
}
})
   
    
    alert.addAction(cancel)
    alert.addAction(ok)
    
        present(alert, animated: true)
     
    }
}

extension ViewController {
    func showAlert() {
        
        let alert = UIAlertController(title: "어허", message: "너무많이 먹였어요", preferredStyle: .actionSheet)
        let ok = UIAlertAction(title: "확인", style: .default)
        alert.addAction(ok)
        present(alert, animated: true)
    }
}


//
//  Alert.swift
//  TamagotchiProject
//
//  Created by Jae Oh on 2023/08/04.
//

import UIKit


extension UIViewController {
    
    func totalAlert<T: UIViewController >(view: T, alertTitle: String, alertMessage: String) {
        
        let alert = UIAlertController(title: alertTitle, message: alertMessage, preferredStyle: .actionSheet)
        let ok = UIAlertAction(title: "확인", style: .default)
        alert.addAction(ok)
        present(alert, animated: true)
        
        
    }
    
}
    
    
//
//    func showAlert() {
//
//        let alert = UIAlertController(title: "오류", message: "관리자에게 문의하세요", preferredStyle: .actionSheet)
//        let ok = UIAlertAction(title: "확인", style: .default)
//        alert.addAction(ok)
//        present(alert, animated: true)
//    }
//
//
//
//
//func showAlert1() {
//
//    let alert = UIAlertController(title: "타마가 없어요", message: "빠른시일 내에 업데이트 하겠습니다.", preferredStyle: .actionSheet)
//    let ok = UIAlertAction(title: "확인", style: .default)
//    alert.addAction(ok)
//    present(alert, animated: true)
//}
//
//
//}
//
//
//extension ChangeNameViewController {
//    func showAlert() {
//
//        let alert = UIAlertController(title: "다시 작성하세요", message: "두글자 이상 여섯글자 이하입니다.", preferredStyle: .actionSheet)
//        let ok = UIAlertAction(title: "확인", style: .default)
//        alert.addAction(ok)
//        present(alert, animated: true)
//    }
//}
//
//
//
//
//extension ViewController {
//    func numShowAlert() {
//
//        let alert = UIAlertController(title: "다시 입력하세요", message: "1~99개의 양의 정수만 입력해 주세요", preferredStyle: .actionSheet)
//        let ok = UIAlertAction(title: "확인", style: .default)
//        alert.addAction(ok)
//        present(alert, animated: true)
//    }
//
//    func wrongWordshowAlert() {
//
//        let alert = UIAlertController(title: "숫자만!", message: "숫자만 입력하세요", preferredStyle: .actionSheet)
//        let ok = UIAlertAction(title: "확인", style: .default)
//        alert.addAction(ok)
//        present(alert, animated: true)
//    }
//
//    func showAlert() {
//
//        let alert = UIAlertController(title: "오류", message: "관리자에게 문의하세요", preferredStyle: .actionSheet)
//        let ok = UIAlertAction(title: "확인", style: .default)
//        alert.addAction(ok)
//        present(alert, animated: true)
//    }
//}
//

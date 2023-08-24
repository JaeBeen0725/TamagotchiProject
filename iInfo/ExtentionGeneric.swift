//
//  ExtentionGeneric.swift
//  TamagotchiProject
//
//  Created by Jae Oh on 2023/08/24.
//

import UIKit

extension UIViewController {
    
    enum TransitionStyle {
        case presentNavigation
        case push
        
    }
 
    
    
    func transition<T:UIViewController >( viewController: T.Type, storyboard: String, style: TransitionStyle) {
        
        let sb = UIStoryboard(name: storyboard, bundle: nil)
        guard let vc = sb.instantiateViewController(withIdentifier: String(describing: viewController)) as? T else {return}
  
        switch style {
          
        case .presentNavigation:
            let nav = UINavigationController(rootViewController: vc)
            
            nav.modalPresentationStyle = .overCurrentContext
            present(nav, animated: true)
            
        case .push:
            navigationController?.pushViewController(vc, animated: true)
            
   
        }
    
    }
 
}







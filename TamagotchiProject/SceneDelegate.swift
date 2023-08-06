//
//  SceneDelegate.swift
//  TamagotchiProject
//
//  Created by Jae Oh on 2023/08/04.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let _ = (scene as? UIWindowScene) else { return }
        
//        
//        //Debug 작엄임 앱삭제 했다 설치한 너낌
//        UserDefaults.standard.set(false, forKey: "isLaunched")
//
//        //1. 만약 유저가 처음 앱을 실행했다면
//        //UserDefaults false default
//        let isLaunched = UserDefaults.standard.bool(forKey: "isLaunched")
//        print(isLaunched)
//
//        //2. FirstViewController를 첫 화면으로
//        if isLaunched == false {
//            let sb = UIStoryboard(name: "Select", bundle: nil)
//            let vc = sb.instantiateViewController(identifier: "SelectTamagochiViewController") as! SelectTamagochiViewController
//
//            window?.rootViewController = vc //윈도우가 있다면 코드를 실행해! 같은느낌
//        } else {
//            //3. 그게 아니라면 Libray~를 첫 화면으로
//                let sb = UIStoryboard(name: "Main", bundle: nil)
//                let vc = sb.instantiateViewController(identifier: "ViewController") as! ViewController
//            let nav = UINavigationController(rootViewController:  vc)
//
//            window?.rootViewController = nav
//        }
//
//        window?.makeKeyAndVisible()

    }

    func sceneDidDisconnect(_ scene: UIScene) {
        // Called as the scene is being released by the system.
        // This occurs shortly after the scene enters the background, or when its session is discarded.
        // Release any resources associated with this scene that can be re-created the next time the scene connects.
        // The scene may re-connect later, as its session was not necessarily discarded (see `application:didDiscardSceneSessions` instead).
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
        // Called when the scene has moved from an inactive state to an active state.
        // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
    }

    func sceneWillResignActive(_ scene: UIScene) {
        // Called when the scene will move from an active state to an inactive state.
        // This may occur due to temporary interruptions (ex. an incoming phone call).
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
        // Called as the scene transitions from the background to the foreground.
        // Use this method to undo the changes made on entering the background.
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
        // Called as the scene transitions from the foreground to the background.
        // Use this method to save data, release shared resources, and store enough scene-specific state information
        // to restore the scene back to its current state.
    }


}


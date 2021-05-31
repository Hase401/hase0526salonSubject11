//
//  SceneDelegate.swift
//  subject_CodeOnly11
//
//  Created by 長谷川孝太 on 2021/05/30.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?
    
    // rootViewControllerにnavigationControllerを入れてみたら背景画面はどうなるか
    var myNavigationController: UINavigationController?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        //　【疑問①】画面の背景が真っ黒になる
//        if let windowScene = scene as? UIWindowScene {
//            let window = UIWindow(windowScene: windowScene)
//            window.rootViewController = ViewController.init()
//            self.window = window
//            window.makeKeyAndVisible()
//        }
        //　【疑問①】同様に画面が真っ暗になる
        guard let windowSence = (scene as? UIWindowScene) else { return }
        window = UIWindow(windowScene: windowSence)
        window?.rootViewController = ViewController.init()
        window?.makeKeyAndVisible()
        
        //　【メモ】上の部分にnavigation bar が追加されただけだった
//        guard let windowSence = (scene as? UIWindowScene) else { return }
//        let first: ViewController = ViewController()
//        myNavigationController = UINavigationController(rootViewController: first)
//        self.window = UIWindow(windowScene: windowSence)
//        self.window?.rootViewController = myNavigationController
//        self.window?.makeKeyAndVisible()
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


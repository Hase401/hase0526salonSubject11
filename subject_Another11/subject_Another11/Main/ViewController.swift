//
//  ViewController.swift
//  subject_Another11
//
//  Created by 長谷川孝太 on 2021/05/28.
//

import UIKit

class ViewController: UIViewController {
    
    private var label1: UILabel!
    private var label2: UILabel!
    private var button: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        label1 = UILabel()
        label1.text = "都道府県"
        label1.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(label1)
        
        label2 = UILabel()
        label2.text = "未選択"
        label2.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(label2)
        
        button = UIButton()
        button.setTitle("変更", for: .normal)
        button.setTitleColor(.blue, for: .normal)
        button.setTitleColor(UIColor.blue.withAlphaComponent(0.30), for: .highlighted)
        
        // 【疑問imageViewがないと変わらないのか】
//        print(button.tintColor)
//        button.tintColor = .blue
//        print(button.tintColor)
        
        button.addTarget(self, action: #selector(didTapButton(_:)), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(button)
        
        // 【疑問】view と button でtintColorをする理由は？
//        print(view.tintColor)
//        view.tintColor = .blue
//        print(view.tintColor)
        
        
        NSLayoutConstraint.activate([
            label1.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 50),
            label1.topAnchor.constraint(equalTo: view.topAnchor, constant: 90),
            
            // xは中央にする
            label2.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0),
            label2.topAnchor.constraint(equalTo: view.topAnchor, constant: 90),
            
            button.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -50),
            button.topAnchor.constraint(equalTo: view.topAnchor, constant: 85)
        ])
    }

    // 【パターン①】クロージャの引数をname
//    @objc func didTapButton(_ sender: UIButton) {
//        let secondVC = SecondViewController.instantiate(
//            didSelectPrefecture: { [weak self] name in
//                self?.label2.text = name
//                self?.dismiss(animated: true, completion: nil)
//            },
//            didCancel: { [weak self] in
//                self?.dismiss(animated: true, completion: nil)
//            })
//        let navigationController = UINavigationController(
//            rootViewController: secondVC
//        )
//        present(navigationController, animated: true, completion: nil)
//    }
    
    
    //　【パターン②】クロージャの引数を$0
    @objc func didTapButton(_ sender: UIButton) {
        let secondVC = SecondViewController.instantiate(
            didSelectPrefecture: { [weak self] in
                self?.label2.text = $0
                self?.dismiss(animated: true, completion: nil)
            },
            didCancel: { [weak self] in
                self?.dismiss(animated: true, completion: nil)
            })
        let navigationController = UINavigationController(
            rootViewController: secondVC
        )
        present(navigationController, animated: true, completion: nil)
    }

}


//
//  ViewController.swift
//  subject_CodeOnly11
//
//  Created by 長谷川孝太 on 2021/05/30.
//

import UIKit

class ViewController: UIViewController {
    
    //UI部品を作る
    private let label: UILabel = {
        let label = UILabel()
        label.text = "都道府県"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    private let prefectureLabel: UILabel = {
        let label = UILabel()
        label.text = "未選択"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    private let button: UIButton = {
        let button = UIButton()
        button.setTitle("変更", for: .normal)
        button.setTitleColor(.blue, for: .normal)
        button.setTitleColor(UIColor.blue.withAlphaComponent(0.30), for: .highlighted)
        button.addTarget(self, action: #selector(didTapButton(_:)), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        // なぜ、ここで呼ぶ必要があるのか？インスタンスを作るときの処理に書いたらエラーが出る
        // Instance member 'view' cannot be used on type 'ViewController'; did you mean to use a value of this type instead?
        view.addSubview(label)
        view.addSubview(prefectureLabel)
        view.addSubview(button)
        
        NSLayoutConstraint.activate([
            label.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 50),
            label.topAnchor.constraint(equalTo: view.topAnchor, constant: 90),
            
            prefectureLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0),
            prefectureLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 90),
            
            button.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -50),
            button.topAnchor.constraint(equalTo: view.topAnchor, constant: 85)
        ])
    }

    @objc func didTapButton(_ sender: UIButton) {
        let secondVC = SecondViewController.instantiate(
            didSelectPrefecture: { [weak self] in
                self?.prefectureLabel.text = $0
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


//
//  ViewController.swift
//  subject_MVC11
//
//  Created by 長谷川孝太 on 2021/06/02.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var prefectureLabel: UILabel!
    
    @IBAction func didTapSelectPrefectureButton(_ sender: UIButton) {
        let nextVC = NextViewController.instantiate(
            didSelectPrefecture: { [weak self]  in
                self?.prefectureLabel.text = $0
                self?.dismiss(animated: true, completion: nil)
            },
            didCancel: { [weak self] in
                self?.dismiss(animated: true, completion: nil)
            }
        )
        let navigationController = UINavigationController(
            rootViewController: nextVC
        )
        present(navigationController, animated: true)
    }
}


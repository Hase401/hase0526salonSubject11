//
//  FirstViewController.swift
//  subject_11
//
//  Created by 長谷川孝太 on 2021/05/26.
//

import UIKit

final class FirstViewController: UIViewController {
    @IBOutlet private weak var prefectureLabel: UILabel!
    
    // nameにprefecture[indexPath.row]をいきなり入れたらエラーが出る　 →　引数を $0 にすると解決
    @IBAction func didTapSelectPrefectureButton(_ sender: UIButton) {
        let secondVC = SecondViewController.instantiate(
            didSelectPrefecture: { [weak self] name in
                self?.prefectureLabel.text = name
                self?.dismiss(animated: true, completion: nil)
            },
            didCancel: { [weak self] in
                self?.dismiss(animated: true, completion: nil)
            }
        )
        let navigationController = UINavigationController(
            rootViewController: secondVC
        )
        present(navigationController, animated: true)
    }
}

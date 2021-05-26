//
//  FirstViewController.swift
//  subject_11
//
//  Created by 長谷川孝太 on 2021/05/26.
//

import UIKit

final class FirstViewController: UIViewController {
    @IBOutlet private weak var prefectureLabel: UILabel!
    
    // nameにprefecture[indexPath.row]をいきなり入れたらエラーが出る
    @IBAction func didTapSelectPrefectureButton(_ sender: UIButton) {
        let secondVC = SecondViewController.instantiate(
            didSelectPrefecture: { [weak self] name in
                self?.prefectureLabel.text = name
            }
        )
        let navigationController = UINavigationController(
            rootViewController: secondVC
        )
        present(navigationController, animated: true)
    }
}

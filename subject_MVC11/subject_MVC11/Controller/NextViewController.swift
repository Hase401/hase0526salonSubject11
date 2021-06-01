//
//  NextViewController.swift
//  subject_MVC11
//
//  Created by 長谷川孝太 on 2021/06/02.
//

import Foundation
import UIKit

class NextViewController: UIViewController {
    
    var prefectureData = PrefectureData()
    

    // 【パターン①】新しく別のstoryboardを作って nameとinstantiateInitialViewController
    // let sVC = UIStoryboard(name: "Second", bundle: nil).instantiateInitialViewController() as! SecondViewController
    // 【パターン②】storyboard上でUINavigationControllerを作ってpresent Modallty、その代わりviewController.swiftではコードをかかない??
    // 【パターン③】storyboard上でUINavigationControllerを作り、その前のViewControllerとの接続はコードでpresent
        // これはやるメリットなくない？？　他の人から見てもわかりづらい気がする　でもやってみたい
    // 今回【パターン④】　同じstoryboard上でnavigationControllerも作らず、コードのみ　instantiateViewControllerを使う
    // storyboard IDを用いる
    static func instantiate(didSelectPrefecture: @escaping (String) -> Void, didCancel: @escaping () -> Void ) -> NextViewController {
        let nVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "NextViewController") as! NextViewController
        nVC.didSelectPrefectureHandler = didSelectPrefecture
        nVC.didCancelHandler = didCancel
        return nVC
    }
    
    private var didSelectPrefectureHandler: (String) -> Void = { _ in }
    private var didCancelHandler: () -> Void = {}
    
    @IBOutlet  weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
    }
    @IBAction func didCancelButtonTapped(_ sender: UIBarButtonItem) {
        didCancelHandler()
    }
    
}

extension NextViewController: UITableViewDelegate {

}


extension NextViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        didSelectPrefectureHandler(prefectureData.prefectures[indexPath.row])
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        prefectureData.prefectures.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = prefectureData.prefectures[indexPath.row]
        return cell
    }
    
}

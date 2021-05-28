//
//  SecondViewController.swift
//  subject_Another11
//
//  Created by 長谷川孝太 on 2021/05/28.
//

import UIKit

class SecondViewController: UIViewController {
    @IBOutlet private weak var tableView: UITableView!
    
    private let prefectures = [
        "北海道", "青森県", "岩手県", "宮城県", "秋田県", "山形県",
        "福島県", "茨城県", "栃木県", "群馬県", "埼玉県", "千葉県",
        "東京都", "神奈川県", "新潟県", "富山県", "石川県", "福井県",
        "山梨県", "長野県", "岐阜県", "静岡県", "愛知県", "三重県",
        "滋賀県", "京都府", "大阪府", "兵庫県", "奈良県", "和歌山県",
        "鳥取県", "島根県", "岡山県", "広島県", "山口県", "徳島県",
        "香川県", "愛媛県", "高知県", "福岡県", "佐賀県", "長崎県",
        "熊本県", "大分県", "宮崎県", "鹿児島県", "沖縄県"
    ]
    
    private var didSelectPrefectureHandler: (String) -> Void = { _ in }
    private var didCancelHandler: () -> Void = {}
    
    static func instantiate(didSelectPrefecture: @escaping (String) -> Void, didCancel: @escaping () -> Void) -> SecondViewController {
        let sVC = UIStoryboard(name: "Second", bundle: nil).instantiateInitialViewController() as! SecondViewController
        sVC.didSelectPrefectureHandler = didSelectPrefecture
        sVC.didCancelHandler = didCancel
        return sVC
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
    }
    @IBAction func didTapCancelButton(_ sender: UIBarButtonItem) {
        didCancelHandler()
    }
}

extension SecondViewController: UITableViewDelegate {
}


extension SecondViewController: UITableViewDataSource {
    
    // 【パターン①】クロージャの引数をname
//    func didSelect(_ name: String){
//        didSelectPrefectureHandler(name)
//    }
//
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        didSelect(prefectures[indexPath.row])
//    }
    
    // 【パターン②】クロージャの引数を$0　→　エラー
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        didSelectPrefectureHandler(prefectures[indexPath.row])
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return prefectures.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = prefectures[indexPath.row]
        return cell
    }
    
}



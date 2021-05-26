//
//  SecondViewController.swift
//  subject_11
//
//  Created by 長谷川孝太 on 2021/05/26.
//

import UIKit

final class SecondViewController: UIViewController {
    
    private let prefectures = ["北海道", "青森県", "岩手県", "宮城県", "秋田県", "山形県", "福島県", "茨城県", "栃木県", "群馬県", "埼玉県", "千葉県", "東京都", "神奈川県", "新潟県", "富山県", "石川県", "福井県", "山梨県", "長野県", "岐阜県", "静岡県", "愛知県", "三重県", "滋賀県", "京都府", "大阪府", "兵庫県", "奈良県", "和歌山県", "鳥取県", "島根県", "岡山県", "広島県", "山口県", "徳島県", "香川県", "愛媛県", "高知県", "福岡県", "佐賀県", "長崎県", "熊本県", "大分県", "宮崎県", "鹿児島県", "沖縄県"]
    
    // SecondViewControllerのインスタンスを作るときに、非同期処理で実行するクロージャを引数として渡してスコープ外で保持しておく
    // クロージャはスコープ外でdidSelectPrefectureHandlerとして保持して、他の関数内で実行されるため、キャプチャが必要　→　@escaping
    static func instantiate(didSelectPrefecture: @escaping (String) -> Void ) -> SecondViewController {
        let sVC = UIStoryboard(name: "Second", bundle: nil).instantiateInitialViewController() as! SecondViewController
        sVC.didSelectPrefectureHandler = didSelectPrefecture
        return sVC
    }
    
    private var didSelectPrefectureHandler: (String) -> Void = { _ in }
    
    @IBOutlet private weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    @IBAction func didTapCancelButton(_ sender: UIBarButtonItem) {
        dismiss(animated: true, completion: nil)
    }
}

extension SecondViewController: UITableViewDelegate {
}


extension SecondViewController: UITableViewDataSource {

    //prefectures[indexPath.row]を引数nameに代入して渡すための関数
    func selectPrefecture(_ name: String) {
        //ここで保持していたクロージャを実行している
        didSelectPrefectureHandler(name)
        dismiss(animated: true, completion: nil)
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectPrefecture(prefectures[indexPath.row])
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

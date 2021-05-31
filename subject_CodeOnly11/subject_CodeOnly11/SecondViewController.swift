//
//  SecondViewController.swift
//  subject_CodeOnly11
//
//  Created by 長谷川孝太 on 2021/05/30.
//

import Foundation
import UIKit

class SecondViewController: UIViewController {
    //UI部品を作る
    private let button: UIButton = {
        let button = UIButton()
        button.setTitle("戻る", for: .normal)
        button.setTitleColor(.blue, for: .normal)
        button.setTitleColor(UIColor.blue.withAlphaComponent(0.30), for: .highlighted)
        button.addTarget(self, action: #selector(didTapCancelButton(_:)), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    private let tableView: UITableView = {
        let table: UITableView = UITableView()
        table.register(CustomTableViewCell.self, forCellReuseIdentifier: CustomTableViewCell.identifier)
        return table
    }()
    
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
        let sVC = SecondViewController()    // .init()でも良い理由は？
        sVC.didSelectPrefectureHandler = didSelectPrefecture
        sVC.didCancelHandler = didCancel
        return sVC
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // 【疑問】navigation bar の上にbutton を配置したいけれどどうしたらいいかわからない
        self.view.addSubview(tableView)
        self.view.addSubview(button)
        tableView.dataSource = self
        tableView.delegate = self
        
        //　navigationのbuttonはどこに書けばいい？
        // view階層を見てみる
        NSLayoutConstraint.activate([
            button.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -50),
            button.topAnchor.constraint(equalTo: view.topAnchor, constant: 5)
        ])
    }
    // frrameか成約を書かないとtableViewが透明なまま
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        // 画面一杯にframeを広げる
        tableView.frame = view.bounds
    }
    
    @objc func didTapCancelButton(_ sender: UIButton) {
        didCancelHandler()
    }
}

extension SecondViewController: UITableViewDelegate {
}


extension SecondViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        didSelectPrefectureHandler(prefectures[indexPath.row])
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return prefectures.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CustomTableViewCell.identifier, for: indexPath)
        cell.textLabel?.text = prefectures[indexPath.row]
        return cell
    }
    
}

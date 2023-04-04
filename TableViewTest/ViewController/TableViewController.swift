//
//  TableViewController.swift
//  TableViewTest
//
//  Created by koala panda on 2023/04/04.
//

import UIKit

class TableViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {


    private let cellClassName = "TableViewCell"
    private let reuseId = "TableViewCell"
    private let api = SampleAPI()
    private var users: [UserModel] = []

    @IBOutlet var indicator: UIActivityIndicatorView!
    @IBOutlet var tableView: UITableView! {
        didSet {
            let cellNib = UINib(nibName: cellClassName, bundle: nil)
            tableView.register(cellNib, forCellReuseIdentifier: reuseId)

            tableView.dataSource = self
            tableView.delegate = self
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        api.getHome { users, error in
            if let _error = error {
                debugPrint(_error)
                return
            }
            guard let _users = users else {
                return
            }
            self.users = _users
            self.tableView.isHidden = false
            self.indicator.isHidden = true
            self.tableView.reloadData()
        }


    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return users.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: reuseId, for: indexPath) as? TableViewCell else {
            return UITableViewCell()
        }
        let user = users[indexPath.row]
        cell.configure(user: user)
        return cell

    }






}

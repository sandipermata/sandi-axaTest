//
//  DashboardViewController.swift
//  Sandi-axaTest
//
//  Created by SANDI on 28/08/20.
//  Copyright © 2020 sample. All rights reserved.
//

import UIKit
import Alamofire

class DashboardViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var dataArray = [DasboardData]()
   
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchData()
        setupView()
        title = "Dashboard"
    }
    
    func setupView() {
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.register(DashboardTableViewCell.self, forCellReuseIdentifier: "DashboardTableViewCell")
        self.tableView.register(UINib(nibName: "DashboardTableViewCell", bundle: nil), forCellReuseIdentifier: "DashboardTableViewCell")
        self.tableView.tableFooterView = UIView(frame: CGRect.zero)
        self.tableView.separatorInset = .init(top: 0, left: 24, bottom: 0, right: 24)
        self.tableView.separatorStyle = .singleLine
        self.tableView.showsVerticalScrollIndicator = false
        self.tableView.showsHorizontalScrollIndicator = false
    }
    
    func fetchData() {
        apiResult(url: "https://jsonplaceholder.typicode.com/posts",param: nil, method: .get, callback: { (success, response, statusCode) in
            if success {
                guard let data = response else { return }
                do{
                    let decodeData = try JSONDecoder().decode([DasboardData].self, from: data as! Data)
                    
                    print(decodeData)
                    self.dataArray = decodeData
                    self.tableView.reloadData()
                }
                catch let jsonErr{
                    print(jsonErr)
                }
            }
            else{
                print("Cek Post False")
            }
        })
    }

}

extension DashboardViewController : UITableViewDelegate {
    
}

extension DashboardViewController: UITableViewDataSource {
    
   
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "DashboardTableViewCell", for: indexPath) as! DashboardTableViewCell
        cell.selectionStyle = .none
        
        cell.titleLabel.text = dataArray[indexPath.row].title
        cell.bodyLabel.text = dataArray[indexPath.row].body!
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = DetailViewController()
        vc.titleTemp = dataArray[indexPath.row].title!
        vc.bodyTemp = dataArray[indexPath.row].body!
        navigationController?.pushViewController(vc, animated: true)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
}


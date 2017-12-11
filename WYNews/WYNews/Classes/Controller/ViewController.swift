//
//  ViewController.swift
//  WYNews
//
//  Created by Pisces on 2017/12/11.
//  Copyright © 2017年 Pisces. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let url : String = "http://c.m.163.com/nc/article/list/T1348649079062/0-20.html"
    
    lazy var dataArray : [NewsModel] = [NewsModel]()
    
    lazy var tableView: UITableView = {
        let table = UITableView(frame: self.view.bounds, style: .plain)
        table.dataSource = self
        table.rowHeight = 90
        table.register(UINib.init(nibName: "NewsViewCell", bundle: nil), forCellReuseIdentifier: "cell")
        return table
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupNavigation()
        
        view.addSubview(tableView)
        
        loadData()
        
    }

}

//MARK: - setup navigation
extension ViewController {
    private func setupNavigation() {
       
        //background
        navigationController?.navigationBar.setBackgroundImage(UIImage.init(named: "mine_background"), for: .default)
        
        //titleView
        navigationItem.titleView = UIImageView(image: UIImage.init(named: "网易网"))
        navigationItem.titleView?.sizeToFit()
        
        //rightItem
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage.init(named: "search-2"), style: .plain, target: self, action: #selector(didClickSearchBtn))
        
        //tinColor
        navigationController?.navigationBar.tintColor = UIColor.white
    }
}

//MARK: - clickMethod
extension ViewController {
    @objc fileprivate func didClickSearchBtn() {
        print("did click to search")
    }
}

//MARK: - tableViewDataSource
extension ViewController : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! NewsViewCell
        
        cell.model = dataArray[indexPath.row]
        
        return cell
    }
}

//MARK: - The request data
extension ViewController {
    private func loadData() {
        NetwordTool.requestData(URLString: url, parameter: nil, method: .get) { (dataResponse) in
            
            guard let response = dataResponse as? [String : Any] else {return}
            
            guard let data = response["T1348649079062"] as? [[String : Any]] else {return}
            
            for dict in data {
                
                self.dataArray.append(NewsModel(dict: dict))
                
            }
            
            self.tableView.reloadData()
        }
    }
}

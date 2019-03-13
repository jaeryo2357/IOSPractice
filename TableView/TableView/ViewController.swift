//
//  ViewController.swift
//  TableView
//
//  Created by YangMinUk on 13/03/2019.
//  Copyright © 2019 YangMinUk. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return korean.count
        case 1:
            return english.count
        default:
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cel:UITableViewCell = tableView.dequeueReusableCell(withIdentifier: self.cellIndetifier, for: indexPath)
        let text:String = indexPath.section == 0 ?korean[indexPath.row] : english[indexPath.row]
        cel.textLabel?.text=text
        
        
        return cel
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
        //2개의 section이 있다는 뜻
    }

    let cellIndetifier:String = "cell"
    let korean:[String] = ["가","나","다"]
    let english:[String] = ["A","B","C"]
    
    @IBOutlet var tableview:UITableView?
    
    func tableView(_ tableView: UITableView, titleForFooterInSection section: Int) -> String? {
        return section == 0 ? "한글" : "영어"
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    

}


//
//  ViewController.swift
//  TableView
//
//  Created by YangMinUk on 13/03/2019.
//  Copyright © 2019 YangMinUk. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource{
    
    let dateFormatter:DateFormatter = {
        let format:DateFormatter=DateFormatter()
        format.timeStyle = .medium
        format.dateStyle = .medium
        return format
    }()
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return korean.count
        case 1:
            return english.count
        case 2:
            return Dates.count
        default:
            return 0
        }
    }
    @IBAction func addDate(_ sender: UIButton)
    {
        Dates.append(Date())
        tableview?.reloadSections(IndexSet(2...2), with: UITableView.RowAnimation.automatic)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cel:UITableViewCell = tableView.dequeueReusableCell(withIdentifier: self.cellIndetifier, for: indexPath)
        let text:String?
        if(indexPath.section<2){
         text = indexPath.section == 0 ?korean[indexPath.row] : english[indexPath.row]
        }else
        {
            text = self.dateFormatter.string(from: self.Dates[indexPath.row])
        }
         cel.textLabel?.text=text
        
        return cel
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
        //2개의 section이 있다는 뜻
    }

    let cellIndetifier:String = "cell"
    let korean:[String] = ["가","나","다"]
    let english:[String] = ["A","B","C"]
    
    var Dates:[Date]=[]
    
    @IBOutlet var tableview:UITableView?
    
    func tableView(_ tableView: UITableView, titleForFooterInSection section: Int) -> String? {
        if(section<2){
        return section == 0 ? "한글" : "영어"
        }
        return nil
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    

}


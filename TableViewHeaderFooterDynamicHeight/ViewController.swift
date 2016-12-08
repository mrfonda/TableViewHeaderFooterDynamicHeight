//
//  ViewController.swift
//  TableViewHeaderFooterDynamicHeight
//
//  Created by 张尉 on 2016/12/8.
//  Copyright © 2016年 wayne. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    
    private var sections: [(Void) -> Header] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.register(Header.self, forHeaderFooterViewReuseIdentifier: "header")
        
        sections = getTableViewSections()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    func numberOfSections(in tableView: UITableView) -> Int {
        return sections.count
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")!
        cell.selectionStyle = .none
        return cell
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let sectioninfo = sections[section]
        return sectioninfo()
    }

    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        let section = sections[section]()
        return section.systemLayoutSizeFitting(UILayoutFittingCompressedSize).height + 1;
    }
    
    func tableView(_ tableView: UITableView, titleForFooterInSection section: Int) -> String? {
        return "SECTION \(section) FOOTER"
    }
    
    
    
    private func getTableViewSections() -> [(Void) -> Header] {
        var datas = [(Void) -> Header]()
        
        let titles = ["「太阳照耀着」\n顾远",
                      "太阳照耀着冰雪，",
                      "冰雪在流着眼泪。",
                      "它们流到了地上，变成了一汪汪积水。",
                      "太阳照耀着积水，",
                      "积水在逐渐干枯。",
                      "他们飞到了天上，\n变成了一团团云雾。",
                      "云雾在四方飘荡，它们飘到了火道，变成一个个空想。","1970年春\n（火道村）"];
        
        titles.forEach { [unowned self] (title) in
            datas.append({
                let header = self.tableView.dequeueReusableHeaderFooterView(withIdentifier: "header") as! Header
                header.titleLabel.text = title
                header.frame = UIScreen.main.bounds
                header.layoutIfNeeded()
                
                return header
            })
        }
        
        return datas
    }
}


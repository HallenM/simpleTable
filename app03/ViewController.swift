//
//  ViewController.swift
//  app03
//
//  Created by developer on 12.02.2021.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet private weak var tableView: UITableView!
    private var listOfString = [String]()
    // cell reuse id (cells that scroll out of view can be reused)
    let cellReuseIdentifier = "TableViewCell"

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        genDataForTable()
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellReuseIdentifier)
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    private func genDataForTable() {
        for i in 0..<100 {
            listOfString.append("cell number \(i+1)")
        }
    }
}

extension ViewController: UITableViewDelegate {
    // method to run when table view cell is tapped
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let cell = tableView.cellForRow(at: indexPath), indexPath.row % 5 == 4 {
            cell.textLabel?.isHidden = !(cell.textLabel?.isHidden ?? false)
        }
    }
}

extension ViewController: UITableViewDataSource {
    // number of rows in table view
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.listOfString.count
    }
    
    // create a cell for each table view row
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellReuseIdentifier) else {
            return UITableViewCell()
        }
        cell.textLabel?.text = listOfString[indexPath.row]
        
        cell.textLabel?.textColor = (indexPath.row % 2 == 1) ? .red : .black
        cell.textLabel?.isHidden = (indexPath.row % 5 == 4)
        
        return cell
    }
}


//
//  Investors_ViewController.swift
//  Invester_Group
//
//  Created by Gokul Gopalakrishnan on 30/01/22.
//

import UIKit

class Investors_ViewController: UIViewController {
    
    var Target_id = 0
    var Target_name = ""
    
    var investor_data = [investment_data]()

    override func viewDidLoad() {
        super.viewDidLoad()

        title = Target_name + "'s Investors"
        
        investor_data.removeAll()
        
        for i in 0...apicaller.edges.count - 1
        {
            if(apicaller.edges[i].target == Target_id)
            {
                for j in 0...apicaller.nodes.count - 1
                {
                    if (apicaller.nodes[j].id == apicaller.edges[i].source )
                    {
                investor_data.append(investment_data.init(id: apicaller.nodes[j].id, name: apicaller.nodes[j].data.properties.name, date: apicaller.edges[i].data.properties?.funded_at ?? apicaller.edges[i].data.properties?.acquisition_date ?? "", type: apicaller.edges[i].data.type , amount: apicaller.edges[i].data.properties?.raised_amount_usd ?? apicaller.edges[i].data.properties?.price_amount ?? 0)
                            
                            )
                    }
                }
            }
        }
        
        let logoutBarButtonItem = UIBarButtonItem(title: "< HOME", style: .done, target: self, action: #selector(logoutUser))
            self.navigationItem.leftBarButtonItem = logoutBarButtonItem
      
    }
    
    func pushtoselectedviewcontroller(Source_id: Int, Source_name: String)
    {
        guard let vc = storyboard?.instantiateViewController(identifier: "Investment_ViewController") as? Investment_ViewController
        else
        {
            return
        }
        
        vc.source_id = Source_id
        vc.source_name = Source_name
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc func logoutUser(){
         navigationController?.popToRootViewController(animated: true)
     }
}

extension Investors_ViewController: UITableViewDelegate, UITableViewDataSource
{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        pushtoselectedviewcontroller(Source_id: investor_data[indexPath.row].id, Source_name: investor_data[indexPath.row].name)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return investor_data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Custom_Cell", for: indexPath) as! Custom_TableViewCell
        
        if ( investor_data[indexPath.row].type == "HAS_MARKET")
        {
            
            let x = investor_data[indexPath.row].name + " has " +  investor_data[indexPath.row].type + " of " + Target_name
            
            cell.Label_view.text = x
        } else
        {
            
            let x = investor_data[indexPath.row].name + " has " +  investor_data[indexPath.row].type + " " + Target_name + " on " + investor_data[indexPath.row].date + " with the amount of " +  String(investor_data[indexPath.row].amount) + "$"
            
            cell.Label_view.text = x
        }

        
       
        
        return cell
    }
    
    
}

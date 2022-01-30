//
//  Investment_ViewController.swift
//  Invester_Group
//
//  Created by Gokul Gopalakrishnan on 29/01/22.
//

import UIKit

class Investment_ViewController: UIViewController {

    var source_id = 0
    var source_name = ""
   
    var inv_data = [investment_data]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = source_name + "'s investment"
        
        inv_data.removeAll()
        
        for i in 0...apicaller.edges.count - 1
        {
            if(apicaller.edges[i].source == source_id)
            {
                for j in 0...apicaller.nodes.count - 1
                {
                    if (apicaller.nodes[j].id == apicaller.edges[i].target )
                    {
                        inv_data.append(investment_data.init(id: apicaller.nodes[j].id, name: apicaller.nodes[j].data.properties.name, date: apicaller.edges[i].data.properties?.funded_at ?? apicaller.edges[i].data.properties?.acquisition_date ?? "", type: apicaller.edges[i].data.type , amount: apicaller.edges[i].data.properties?.raised_amount_usd ?? apicaller.edges[i].data.properties?.price_amount ?? 0)
                            
                            )
                    }
                }
            }
        }
        
        let logoutBarButtonItem = UIBarButtonItem(title: "< HOME", style: .done, target: self, action: #selector(logoutUser))
            self.navigationItem.leftBarButtonItem = logoutBarButtonItem
    }

   
    @objc func logoutUser(){
         navigationController?.popToRootViewController(animated: true)
     }
     
    
    func pushtoselectedviewcontroller(Target_id: Int, Target_name: String)
    {
        guard let vc = storyboard?.instantiateViewController(identifier: "Investors_ViewController") as? Investors_ViewController
        else
        {
            return
        }
        
        vc.Target_id = Target_id
        vc.Target_name = Target_name
       
        navigationController?.pushViewController(vc, animated: true)
    }
    

}




extension Investment_ViewController: UITableViewDelegate, UITableViewDataSource
{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        pushtoselectedviewcontroller(Target_id: inv_data[indexPath.row].id, Target_name: inv_data[indexPath.row].name)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return inv_data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Custom_Cell", for: indexPath) as! Custom_TableViewCell
        
         
        let x = inv_data[indexPath.row].name + " has been " + inv_data[indexPath.row].type + " by the " + source_name + " about " + String(inv_data[indexPath.row].amount) + "$" + " on the day of " + inv_data[indexPath.row].date
        
        cell.Label_view.text = x
        
        return cell
    }
    
    
}

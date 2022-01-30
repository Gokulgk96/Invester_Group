//
//  Second_ViewController.swift
//  Invester_Group
//
//  Created by Gokul Gopalakrishnan on 29/01/22.
//

import UIKit

var person = [nodes]()


class Second_ViewController: UIViewController {

    @IBOutlet weak var Table_views: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        title = "INVESTORS"
        
        JsonDownloader
        {
            for i in 0...apicaller.nodes.count - 1
            {
                guard let node1 = apicaller.nodes[i].data.categories
                else{
                    apicaller.nodes[i].data.categories?.append("INVESTOR")
                    person.append(apicaller.nodes[i])
                    continue
                }
                if(node1.contains("INVESTOR"))
                        {
                    person.append(apicaller.nodes[i])
                  
                        }
       
            }
           
            self.Table_views.reloadData()
        }
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
    
    
}

extension Second_ViewController: UITableViewDelegate, UITableViewDataSource
{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        pushtoselectedviewcontroller(Source_id: person[indexPath.row].id,Source_name: person[indexPath.row].data.properties.name )
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return person.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Custom_Cell", for: indexPath) as! Custom_TableViewCell
        
       
        cell.Label_view.text = person[indexPath.row].data.properties.name
        
        return cell
    }
    
    
}

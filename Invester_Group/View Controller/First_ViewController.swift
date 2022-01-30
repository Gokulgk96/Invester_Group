//
//  First_ViewController.swift
//  Invester_Group
//
//  Created by Gokul Gopalakrishnan on 29/01/22.
//

import UIKit

var apicaller: datas = datas(nodes: [],edges: [])


var organization = [nodes]()


class First_ViewController: UIViewController {

    @IBOutlet weak var Table_View: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()

        title = "ORGANIZATION"
        
        JsonDownloader
        {
            for i in 0...apicaller.nodes.count - 1
            {
                guard let node2 = apicaller.nodes[i].data.categories
                else{
                   
                    continue
                }
                if(node2.contains("COMPANY") && node2.count == 1 || node2.contains("MARKET") && node2.count == 1)
                        {
                    organization.append(apicaller.nodes[i])
                    
                        }
                self.Table_View.reloadData()
            }
            
        }
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

extension First_ViewController: UITableViewDelegate, UITableViewDataSource
{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        pushtoselectedviewcontroller(Target_id: organization[indexPath.row].id, Target_name: organization[indexPath.row].data.properties.name)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return organization.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Custom_Cell", for: indexPath) as! Custom_TableViewCell
        
        cell.Label_view.text = organization[indexPath.row].data.properties.name
        
        return cell
    }
    
    
}

func JsonDownloader(completed: @escaping () -> ())
{
        
let url = URL(string: "https://doc.linkurio.us/ogma/latest/resources/files/solarCity.json")!


  let task = URLSession.shared.dataTask(with: url)
            {
                data, response, error in
                
                if let data = data
                {
                    do
                    {
                        apicaller = try JSONDecoder().decode(datas.self, from: data)
                      
                        DispatchQueue.main.async {
                            completed()
                        }
                    }catch
                    {
                        print("Error")
                        print(error.localizedDescription)
                    }
                }
            }
            task.resume()
     
}

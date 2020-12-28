//
//  ViewController.swift
//  swiftyJSON
//
//  Created by MAC on 19/12/20.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var arrData = [JsonData]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        jsonPasrsing()
        tableViewSetup()
    }
    
    func tableViewSetup(){
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "TableViewCell", bundle: nil), forCellReuseIdentifier: "TableViewCell")
    }

    func jsonPasrsing(){
        let url = URL(string: "https://itunes.apple.com/search?media=music&term=bollywood")
        URLSession.shared.dataTask(with: url!) { (data, response, error) in
            
            guard let data = data else{ return }
            
            do{
                let json = try JSON(data:data)
                let results = json["results"]
                print(results)
                for arr in results.array!{
                    self.arrData.append(JsonData(json: arr))
                    print(self.arrData[0].artistID)
                }
//                print(self.arrData)
                
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            }catch{
                print(error.localizedDescription)
            }
        }.resume()
    }

}

extension ViewController:UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell", for: indexPath) as! TableViewCell
        cell.trackName.text = arrData[indexPath.row].trackName
        cell.artistName.text = arrData[indexPath.row].artistName
        cell.trackCensoredName.text = arrData[indexPath.row].trackCensoredName
        
        let id = String(arrData[indexPath.row].artistID!)
//        print(arrData[indexPath.row].artistID)
        cell.artistId.text = id
       
        
        let url = URL(string: arrData[indexPath.row].artworkUrl100)
        if let data = try? Data(contentsOf: url!) {
            cell.albumImg.image = UIImage(data: data)
        }
        
       /* Using third party..
          cell.albumImg.kf.setImage(with: url) */
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    
}

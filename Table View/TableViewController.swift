//
//  TableViewController.swift
//  Table View
//
//  Created by Abdirizak Hassan on 10/2/21.
//

import UIKit
import Alamofire
import Kingfisher

class TableViewController: UITableViewController, UISearchBarDelegate {

    @IBOutlet var searchBar: UISearchBar!
    
    var articls = [Article]()
    
    var filteredData = [Any]()
    
    /*
     https://newsapi.org/v2/top-headlines
     sources= bbc-news
     apiKey=3f67f8a4b26740e3aa2f06d3364945c1
     */
    
    override func viewDidLoad() {
        super.viewDidLoad()
        searchBar.delegate = self
        navigationItem.title = "News App"
        filteredData = articls
        getArticles()
    }
    
    func getArticles(){
        let prameter: Parameters = ["country":"us",
                                    "apiKey":"3f67f8a4b26740e3aa2f06d3364945c1"]
        AF.request("https://newsapi.org/v2/top-headlines", parameters: prameter).response { response in
            guard let data = response.data else { return }
            
            do{
//                let res = try JSONSerialization.jsonObject(with: data, options: [])
//                print(res)
                let res = try JSONDecoder().decode(TopHeadlinesResponse.self, from: data)
//                print(res)
                self.articls = res.articles
                self.tableView.reloadData()
            } catch {
                print(error)
            }
            
        }
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filteredData.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ArticleCellTableViewCell.identifier, for: indexPath) as! ArticleCellTableViewCell
        let allarticles = filteredData[indexPath.row]
        cell.populate(with: allarticles as! Article)
        return cell
    }

    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 82
    }
    
    // MARK: searchBar Item
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        filteredData = []

        if searchText == "" {
            filteredData = articls
        } else {
            for items in articls {
                if items.headline.lowercased().contains(searchText.lowercased()) {
                    filteredData.append(items)
                }
            }
        }
        
        
        
        self.tableView.reloadData()
    }

}


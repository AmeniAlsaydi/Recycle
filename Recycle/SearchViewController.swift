//
//  SearchViewController.swift
//  Recycle
//
//  Created by Amy Alsaydi on 11/24/19.
//  Copyright © 2019 Amy Alsaydi. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    
    var isSearching = false
    var filteredData = [CommonItem]()
    var arrayOfItems = CommonItem.itemList
    
    var itemTypes = [[CommonItem]]() {
         didSet {
                   tableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        searchBar.delegate = self
        searchBar.returnKeyType = UIReturnKeyType.done
        tableView.dataSource = self
        loadData()

    }
    func loadData() {
        itemTypes = CommonItem.getSections()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
         guard let detailViewController = segue.destination as? DetailViewController, let indexPath = tableView.indexPathForSelectedRow else {
                   fatalError("failed to get indexPath and detailViewController")
               }
        let item = itemTypes[indexPath.section][indexPath.row]
        detailViewController.item = item 
    }
    

}

extension SearchViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if isSearching {
            return filteredData.count
        }
        return itemTypes[section].count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCell", for: indexPath)
        
        let item: CommonItem!
        
        if isSearching {
            item = filteredData[indexPath.row]
        } else {
            item = itemTypes[indexPath.section][indexPath.row]
        }
        
        cell.textLabel?.text = item.itemName
        
        return cell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        if isSearching {
            return 1
        } else {
            return itemTypes.count }
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if isSearching {
            return nil
        } else {
            return itemTypes[section].first?.itemType.rawValue.capitalized
        }
    }
    
}

extension SearchViewController: UISearchBarDelegate {
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        if searchBar.text == nil || searchBar.text == "" {
            isSearching = false
            view.endEditing(true)
            tableView.reloadData()
        } else {
            isSearching = true
            filteredData = arrayOfItems.filter { $0.itemName.lowercased().contains(searchText.lowercased()) }
            tableView.reloadData()
        }
    }
}


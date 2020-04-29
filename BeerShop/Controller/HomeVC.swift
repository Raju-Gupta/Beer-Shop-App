//
//  ViewController.swift
//  BeerShop
//
//  Created by Raju Gupta on 04/02/20.
//  Copyright © 2020 Raju Gupta. All rights reserved.
//

import UIKit

class HomeVC: UIViewController, DataPass
{
    @IBOutlet weak var barBtnAscDsc: UIBarButtonItem!
    @IBOutlet weak var barBtnFilter: UIBarButtonItem!
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var homeTableView: UITableView!
    
    var spinner = UIActivityIndicatorView(style: .large)
    
    var allBeerData = [DataStore]()
    var beerSort : Bool = false
    var beerArrSearch = [DataStore]()
    let search = UISearchController(searchResultsController: nil)
    var indicator = UIActivityIndicatorView()
    
    var filterBeer = [String]()
    var isFilterActive = false
    
    var allFilterBeer = [DataStore]()
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        activityIndicator()
        indicator.startAnimating()
        
        let nib = UINib(nibName: "HomeTableCell", bundle: nil)
        homeTableView.register(nib, forCellReuseIdentifier: "HomeTableCell")
        
        searchBarSetUp()
        
        DataManager.getAllData(url: ServerManager.baseUrlString) { (data) in
            self.allBeerData = data
            self.beerArrSearch = data
            DispatchQueue.main.async {
                self.homeTableView.reloadData()
                self.indicator.stopAnimating()
                self.indicator.hidesWhenStopped = true
            }
        }
    }
    
    override func viewWillAppear(_ animated: Bool)
    {
        allBeerData = beerArrSearch
        if filterBeer.isEmpty == false && isFilterActive == true
        {
            barBtnFilter.image = UIImage(named: "ClearFilter")
            allFilterBeer = allBeerData.filter { filterBeer.contains($0.style!) }
            allBeerData = allFilterBeer
            
        }
        else
        {
            barBtnFilter.image = UIImage(named: "FilterBtn")
            allBeerData = beerArrSearch
        }
        homeTableView.reloadData()
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    func activityIndicator() {
        indicator = UIActivityIndicatorView(frame: CGRect(x: 0, y: 0, width: 40, height: 40))
        indicator.color = UIColor(red: 234/255, green: 173/255, blue: 63/255, alpha: 1)
        indicator.style = UIActivityIndicatorView.Style.large
        indicator.center = self.view.center
        self.view.addSubview(indicator)
    }
    
    func searchBarSetUp()
    {
        self.extendedLayoutIncludesOpaqueBars = true
        search.searchResultsUpdater = self
        definesPresentationContext = true
        search.searchBar.tintColor = .white
        search.searchBar.placeholder = "Search by beer name"
        search.searchBar.searchTextField.backgroundColor = .white
        navigationItem.searchController = search
        navigationItem.hidesSearchBarWhenScrolling = false
        search.obscuresBackgroundDuringPresentation = false
    }
    
    @IBAction func onClickAscDsc(_ sender: Any)
    {
        beerSort = !beerSort
        if beerSort
        {
            allBeerData = allBeerData.sorted(by: {Double($0.abv!) ?? 0 < Double($1.abv!) ?? 0})
            barBtnAscDsc.image = UIImage(named: "Ascending")
        }
        else
        {
            allBeerData = allBeerData.sorted(by: {Double($0.abv!) ?? 0 > Double($1.abv!) ?? 0})
            barBtnAscDsc.image = UIImage(named: "Descending")
        }
        homeTableView.reloadData()
    }
    
    @IBAction func onClickFilter(_ sender: Any)
    {
        
        if filterBeer.isEmpty == false && isFilterActive == true
        {
            filterBeer.removeAll()
            isFilterActive = false
            
        }
        
        let vc = storyboard?.instantiateViewController(identifier: "FilterVC") as! FilterVC
        let beerStyle = beerArrSearch.map{$0.style!}
        vc.beerType = Array(Set(beerStyle))
        vc.delegate = self
        navigationController?.pushViewController(vc, animated: true)
    }
    
    func filterBeer(filter: [String], isfilterActive: Bool) {
        filterBeer = filter
        isFilterActive = isfilterActive
    }
    
}

extension HomeVC : UITableViewDelegate, UITableViewDataSource
{
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return allBeerData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "HomeTableCell", for: indexPath) as! HomeTableCell
        cell.imgBeerImage.image = allBeerData[indexPath.row].beerImg
        cell.lblBeerName.text = allBeerData[indexPath.row].name
        cell.lblBeerStyle.text = allBeerData[indexPath.row].style
        cell.lblPrice.text = "$ \(allBeerData[indexPath.row].price)"
        cell.lblABV.text = "ABV : \(allBeerData[indexPath.row].abv!)"
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = storyboard?.instantiateViewController(identifier: "BeerDetailVC") as! BeerDetailVC
        vc.beerDetails = [allBeerData[indexPath.row]]
        navigationController?.pushViewController(vc, animated: true)
        
    }
}

extension HomeVC : UISearchBarDelegate, UISearchControllerDelegate, UISearchResultsUpdating
{
    func updateSearchResults(for searchController: UISearchController)
    {
        guard let searchText = searchController.searchBar.text else {return}
        
        if filterBeer.isEmpty == false && isFilterActive == true
        {
            if searchText == ""
            {
                allBeerData = allFilterBeer
            }
            else
            {
                allBeerData = allFilterBeer
                allBeerData = allFilterBeer.filter{($0.name?.contains(searchText))!}
            }
            homeTableView.reloadData()
        }
        else
        {
            if searchText == ""
            {
                allBeerData = beerArrSearch
            }
            else
            {
                allBeerData = beerArrSearch
                allBeerData = allBeerData.filter{($0.name?.contains(searchText))!}
            }
            homeTableView.reloadData()
        }
    }
}


//
//  ViewController.swift
//  youtube-dayonebuild
//
//  Created by ASHIQUR RAHMAN on 11/5/21.
//

import UIKit


class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, ModelDelegate  {
    
    
    @IBOutlet weak var tableView: UITableView!
    
    
    var model = Model()
    var videos = [Video]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Set itself as the datasource and the delegate
        tableView.dataSource = self
        tableView.delegate = self
        
        //set itself as the delegate of he model
        model.delegate = self
        
        model.getVideos()
    }
    
    //Mark: - MOdel Delegate Methods
    
    func VideosFetched(_ videos: [Video]) {
        
        //set the returned videos to our video property
        self.videos = videos
        
        //refresh the tableview
        tableView.reloadData()
        
        
    }
    
    // MARK: - TableView Methods

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return videos.count
        
        
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.VIDEOCELL_ID, for: indexPath)
        
        // configur the cell with the data
        // get the title for the video in question
        let title = self.videos[indexPath.row].title
        
        cell.textLabel?.text = title
        
        
        // returnthecell
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        
    }
}


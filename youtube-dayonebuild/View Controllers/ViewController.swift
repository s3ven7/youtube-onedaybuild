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
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        // confirm that a Video Was Selected
        
        guard tableView.indexPathForSelectedRow != nil else {
           return
            
        }
        
        
        // get a reference to the video tthat was tapped on
        
        let selectedVideo = videos[tableView.indexPathForSelectedRow!.row]
        
        
        // get a reference to the detail view controller
        
        let detailVC = segue.destination as! DetailViewController
        
        
        // set a video property of the detail view controller
        
        detailVC.video = selectedVideo
        
        
        
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
        
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.VIDEOCELL_ID, for: indexPath) as! VideoTableViewCell
        
        // configur the cell with the data
        let video = self.videos[indexPath.row]
        
        cell.setCell(video)
         
        
        
        // returnthecell
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        
    }
}


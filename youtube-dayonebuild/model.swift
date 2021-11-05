//
//  model.swift
//  youtube-dayonebuild
//
//  Created by ASHIQUR RAHMAN on 11/5/21.
//

import Foundation

class Model {
    
    func getVideos() {
        
        //creat a url object
        let url = URL(string: Constants.API_URL)
        
        guard url != nil else{
            return
        }
        
        //Get a URLSession object
        let session = URLSession.shared
        
        //get a data task from the URLSession object
        let dataTask = session.dataTask(with: url!) { Data, response, Error in
            
            //check if there were any errors
            if Error != nil || Data == nil {
                return
            }
            
            // Parsing the data into video objects
            
        }
        //kick off the task
        dataTask.resume()
    }
}

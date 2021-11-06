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
        let dataTask = session.dataTask(with: url!) { data, response, Error in
            
            //check if there were any errors
            if Error != nil || data == nil {
                return
            }
            
            do {
                // Parsing the data into video objects
                
                let decoder = JSONDecoder()
                decoder.dateDecodingStrategy = .iso8601
                
                
                
                let response = try decoder.decode(Response.self, from: data!)
                
                
                
                dump(response)
        
                
                
                
            }
            catch {
                
                
            }
            
    
            
            
            
            
        }
        //kick off the task
        dataTask.resume()
    }
}

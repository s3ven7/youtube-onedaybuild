//
//  DetailViewController.swift
//  youtube-dayonebuild
//
//  Created by ASHIQUR RAHMAN on 11/9/21.
//

import UIKit
import WebKit

class DetailViewController: UIViewController {
    
    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var dateLabel: UILabel!
    
    @IBOutlet weak var webView: WKWebView!
    
    @IBOutlet weak var textView: UITextView!
    
    var video:Video?
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        
        // clear the fields
        
        titleLabel.text = ""
        dateLabel.text = ""
        textView.text = ""
        
        
        
        // chech if there's a video
        guard video != nil else {
            return
            
        }
    
        // create the embade url
        
        let embedUrlString = Constants.YT_EMBED_URL + video!.videoId
        
        // load it into the webview
        
        let url = URL(string: embedUrlString)
        let request = URLRequest(url: url!)
        webView.load(request)
         
        // set the title
        
        titleLabel.text = video!.title
        
        // set the date
        
        let df = DateFormatter()
        df.dateFormat = "EEEE, MMM d, yyyy"
        dateLabel.text = df.string(from: video!.published)
        
        
        // set the description
        
        textView.text = video!.description
        
        
    }
    

}

//
//  TweetViewController.swift
//  Twitter
//
//  Created by Wei Nie on 2/16/20.
//  Copyright © 2020 Dan. All rights reserved.
//

import UIKit

class TweetViewController: UIViewController {

    @IBOutlet weak var tweetContent: UITextView!
    
    @IBAction func cancelButton(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func tweetSend(_ sender: Any) {
        if(!tweetContent.text.isEmpty){
            TwitterAPICaller.client!.postTweet(tweetString: tweetContent.text, success:{ self.dismiss(animated: true, completion: nil)
            }, failure: {(Error) in
                print("Send twitter failure!")
                self.dismiss(animated: true, completion: nil)
            })
        }
            else{
                self.dismiss(animated: true, completion: nil)
            }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

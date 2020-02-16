//
//  TweetCellTableViewCell.swift
//  Twitter
//
//  Created by Wei Nie on 2/9/20.
//  Copyright © 2020 Dan. All rights reserved.
//

import UIKit
import Alamofire

class TweetCellTableViewCell: UITableViewCell {
    
    var tweetId:Int = -1
    var favorited:Bool = false
    var retweeted:Bool = false
    
    @IBOutlet weak var favButton: UIButton!
    
    @IBOutlet weak var retweetButton: UIButton!
    
    @IBAction func favorite(_ sender: Any) {
        let tobeFavorited = !favorited
        if(tobeFavorited){
            TwitterAPICaller.client?.favoriteTweet(tweetId: tweetId, success:{ self.setFavorite(true)}
                , failure: {
                (Error) in
                print("failure favorite")
            })
        }
        else{
            TwitterAPICaller.client?.unfavoriteTweet(tweetId: tweetId, success:{ self.setFavorite(false)}
                , failure: {
                (Error) in
                print("failure unfavorite")
            })
        }
    }
    
    @IBAction func retweet(_ sender: Any) {
        TwitterAPICaller.client?.reTweet(tweetId: tweetId, success:{ self.setRetweeted(true)}
                       , failure: {
                       (Error) in
                       print("failure retweet")
                   })
    }
    
    func setFavorite(_ isFavorite:Bool){
        favorited = isFavorite
        if(favorited){
            favButton.setImage(UIImage(named:"favor-icon-red"), for: UIControl.State.normal)
        }
        else{
            favButton.setImage(UIImage(named:"favor-icon"), for: UIControl.State.normal)
        }
    }
    
    func setRetweeted(_ isRetweeted:Bool){
        if(isRetweeted){
            retweetButton.setImage(UIImage(named:"retweet-icon-green"), for: UIControl.State.normal)
            retweetButton.isEnabled = false
        }
        else{
            retweetButton.setImage(UIImage(named:"retweet-icon"), for: UIControl.State.normal)
            retweetButton.isEnabled = true
        }
    }
    
    @IBOutlet weak var userNameLabel: UILabel!
    
    @IBOutlet weak var tweetContent: UILabel!
    
    
    @IBOutlet weak var tweetImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

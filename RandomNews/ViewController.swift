//
//  ViewController.swift
//  RandomNews
//
//  Created by Jesther Silvestre on 4/27/21.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var titleArea: UILabel!
    @IBOutlet weak var descriptionArea: UILabel!
    @IBOutlet weak var contentArea: UILabel!
    var titleArray = [Int:String]()
    var descriptionArray = [Int:String]()
    var contentArray = [Int:String]()
    override func viewWillAppear(_ animated: Bool) {
        print(titleArray.isEmpty)
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        fetchPostData { Post in
            for x in 0...Post.articles!.count-1{
                self.titleArray[x] = Post.articles![x].title!
                self.descriptionArray[x] = Post.articles![x].description!
                self.contentArray[x] = Post.articles![x].content!
            }
        }
       
        
    }
    var position:Int = 0
    @IBAction func nextPressed(_ sender: UIButton) {
        print(titleArray.isEmpty)
        
    }
        
}
    
    
    
    func fetchPostData(completionHandler:@escaping (Post)->Void) {
        let url = URL(string: "https://newsapi.org/v2/everything?q=tesla&from=2021-03-28&sortBy=publishedAt&apiKey=33237530c5124ed29346be7e5efcbd57")!
        //creating a task
        URLSession.shared.dataTask(with: url) { Data, URLResponse, Error in
            guard let data = Data else{return}
            
            do{
                let postData = try JSONDecoder().decode(Post.self, from: data)
                completionHandler(postData)
            }
            catch{
                let error = error.localizedDescription
                print(error)
            }
        }.resume()
}

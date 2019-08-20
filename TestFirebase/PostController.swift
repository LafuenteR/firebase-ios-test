//
//  PostController.swift
//  TestFirebase
//
//  Created by Ruel Lafuente on 20/08/2019.
//  Copyright © 2019 LafuenteR. All rights reserved.
//

import UIKit
import FirebaseDatabase

class PostController: UIViewController, UITextViewDelegate {

    @IBOutlet weak var myTextView: UITextView!
    //    @IBOutlet weak var textView: UITextView!
    @IBOutlet weak var textCount: UILabel!
    let ref = Database.database().reference()
    override func viewDidLoad() {
        super.viewDidLoad()
        textCount.text = "100"
        myTextView.delegate = self
        // Do any additional setup after loading the view.
        
    }
    
    @IBAction func post(_ sender: Any) {
        ref.child("Posts").childByAutoId().setValue(["post":myTextView.text,"timestamp":[".sv":"timestamp"]])
        myTextView.text = ""
        textCount.text = "100"
    }
    //    func textView(textView: UITextView, shouldChangeTextInRange range: NSRange, replacementText text: String) -> Bool {
//        let newText = (textView.text as NSString).stringByReplacingCharactersInRange(range, withString: text)
//        let numberOfChars = newText.characters.count // for Swift use count(newText)
//        return numberOfChars < 10;
//    }
    
    
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        let newText = (myTextView.text as NSString).replacingCharacters(in: range, with: text)
                let numberOfChars = newText.count // for Swift use count(newText)
                textCount.text = String(100 - numberOfChars)
                return numberOfChars <= 100;

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

//
//  SecondVC.swift
//  quizappnew
//
//  Created by Zakkariya K.A on 30/09/22.
//

import UIKit



class SecondVC: UIViewController {
    
    @IBOutlet weak var lbltitle: UILabel!
    @IBOutlet weak var lblresult: UILabel!
    
    var noCorrect = 0
      var total = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
       

              
               lblresult.text = "You got \(noCorrect) out of \(total) correct"
              
               var percentRight = Double(noCorrect) / Double(total)
               percentRight *= 100
            
               var title = ""
               if(percentRight < 40) {
                   title = "Not Good"
               } else if(percentRight < 70) {
                   title = "Almost"
               } else {
                   title = "Good Job"
               }
               lbltitle.text = title

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

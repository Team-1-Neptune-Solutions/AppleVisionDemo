/*
Created 17/nov/23

Abstract:
View controller for unstructured text.
*/

import UIKit
import Vision

class OtherContentsViewController: UIViewController {
    
    @IBOutlet weak var textView: UITextView?
    let labels = [
        "High Temperature Generator",
        "Low Temperature Generator",
        "Spray Solution Concentration",
        "Spray Solution Temperature",
        "U-tube Temperature",
        "HTG Vapour Temperature"
    ]
    var transcript = ""

    override func viewDidLoad() {
        super.viewDidLoad()
        textView?.text = transcript
    }
}
// MARK: RecognizedTextDataSource
extension OtherContentsViewController: RecognizedTextDataSource {
    func addRecognizedText(recognizedText: [VNRecognizedTextObservation]) {
        // Create a full transcript to run analysis on.
        let maximumCandidates = 1
        var readings = [Double]()
        
        for observation in recognizedText {
            guard let candidate = observation.topCandidates(maximumCandidates).first else { continue }
            
            if let reading = Double(candidate.string) {
                readings.append(reading)
            }
        }
        
        for (index, reading) in readings.enumerated() {
            let suffix = index != 2 ? "°F" : "%"
            transcript += "\(labels[index]): \(reading) \(suffix)\n"
        }
        
        textView?.text = transcript
    }
}

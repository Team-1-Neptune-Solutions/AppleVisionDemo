/*
Created 17/nov/23

Abstract:
View controller for unstructured text.
*/

import UIKit
import Vision

class OtherContentsViewController: UIViewController {
    
    @IBOutlet weak var textView: UITextView?
    var transcript = ""

    override func viewDidLoad() {
        super.viewDidLoad()
        textView?.text = transcript
    }
}

  
extension OtherContentsViewController: RecognizedTextDataSource {
    func addRecognizedText(recognizedText: [VNRecognizedTextObservation]) {
        // Create a full transcript to run analysis on.
        let maximumCandidates = 1
        var readings = [String]()
//        print(recognizedText[2].topCandidates(1).first?.string ?? "nada")
        for observation in recognizedText {
            guard let candidate = observation.topCandidates(maximumCandidates).first else { continue }
//            transcript += candidate.string
            print(candidate.string)
            
            var cameraString = candidate.string

            if cameraString.contains("°F") {
                let splitStrings = cameraString.split(separator: " ")
              cameraString = String(splitStrings[0])
                readings.append(cameraString)
            }


//            print(candidate)
//            print(VNRecognizedText())
//            transcript += "\n"

            // Always when Saved and Render Data Collected Run this function
            print("---------- TAG's --------------------------------")
        }
        print(readings)
//        textView?.text = transcript
    }
}





// This should all be numbers



// Hygor Notes --> Data from OCR
// Added Tag's + \n

//Active Chilled Water
//------------------------------------------
//<VNRecognizedText: 0x2801c0c20>
//Setpoint
//------------------------------------------
//<VNRecognizedText: 0x2801c0d80>
//44.3 °F
//------------------------------------------
//<VNRecognizedText: 0x2801c0ee0>
//Evaporator Leaving Water
//------------------------------------------
//<VNRecognizedText: 0x2801c1040>
//Temperature
//------------------------------------------
//<VNRecognizedText: 0x2801c11a0>
//44.7 °F
//------------------------------------------
//<VNRecognizedText: 0x2801c1300>
//Evap Sat Rfgt Temp
//------------------------------------------
//<VNRecognizedText: 0x2801c1460>
//44.2 °F
//------------------------------------------
//<VNRecognizedText: 0x2801c15c0>
//Evaporator Pump Override
//------------------------------------------
//<VNRecognizedText: 0x2801c1720>
//Auto
//------------------------------------------
//<VNRecognizedText: 0x2801c1880>
//Evap Water Flow Status
//------------------------------------------
//<VNRecognizedText: 0x2801c19e0>
//Flow
//------------------------------------------
//<VNRecognizedText: 0x2801c1b40>
//Evaporator Entering Water
//------------------------------------------
//<VNRecognizedText: 0x2801c1ca0>
//Temperature
//------------------------------------------
//<VNRecognizedText: 0x2801c1e00>
//46.0 °F
//------------------------------------------
//<VNRecognizedText: 0x2801c1f60>
//Evap Rfat Pressure
//------------------------------------------
//<VNRecognizedText: 0x2801c20c0>
//-8.3 PSIG
//------------------------------------------
//<VNRecognizedText: 0x2801c2220>
//Evap Approach Temp
//------------------------------------------
//<VNRecognizedText: 0x2801c2380>
//0.6 °F
//------------------------------------------
//<VNRecognizedText: 0x2801c24e0>

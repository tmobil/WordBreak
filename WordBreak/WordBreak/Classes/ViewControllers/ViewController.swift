//
//  ViewController.swift
//  WordBreak
//
//  Created by Mac on 10/3/18.
//  Copyright © 2018 Ratnesh. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var inputStringTextField: UITextField!
    @IBOutlet var submitButton: DesignableButton!
    
    @IBOutlet var inputLabel: UILabel!
    @IBOutlet var outputLabel: UILabel!
    @IBOutlet var resultDetailsLabel: UILabel!
    
    @IBOutlet var resultView: UIView!
    @IBOutlet var loaderView: DesignableView!
    @IBOutlet var loader: UIActivityIndicatorView!
    
    var inputText:String?
    var isInputStringPresent: Bool = false
    var outputText:String?
    var resultDetailsText:String? = ""
    
    var dictWordListArray: [String] = []
    
    var dictWordModelListArray: [WordModel] = []
    
    var resultOutput:[String] = []
    
    
    
    
    //MARK : - ViewController Life Cycle.
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        initialiseScreen()
        self.resultView.isHidden = true
        showLoader()
        fetchJsonDictionary()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.inputStringTextField.becomeFirstResponder()
    }
    
    func initialiseScreen(){
        // Set screen title.
        self.title  = AppTitleString.homeScreenTitle
    }
    
    func showLoader() {
        loader.startAnimating()
        loaderView.isHidden = false
    }
    
    func hideLoader() {
        loader.stopAnimating()
        loaderView.isHidden = true
    }
    
    func fetchJsonDictionary(){

        WordBreakAPI().getDictionaryJsonDataAPI(success: { jsonDict  in
                //                print(jsonDict)
                DispatchQueue.main.async {
                    self.dictWordModelListArray = ParserHelper.parseResponse(responseDict: jsonDict)
                    self.dictWordListArray = [String](jsonDict.keys)
                //For Testing:
                //                 self.dictWordListArray.removeAll()
                //                 self.dictWordListArray = ["Given", "an", "input", "find", "out", "whether", "the", "input", "can", "be", "segmented", "into", "a", "sequence", "of", "dictionary"]
                
                
                self.hideLoader()
            }
        }, failure: { message in
            DispatchQueue.main.async {
                print(message)
            }
        })
    }
    
    //MARK: - Submit Button Action.
    @IBAction func submitButtonAction(_ sender: Any) {
        inputText = inputStringTextField.text
        isInputStringPresent =  wordBreak(wordString: inputText ?? "")
        
        showResult()
    }
    
    //MARK: - Get Bool value of wordBreak.
    func wordBreak(wordString: String) -> Bool {
        
        resultOutput.removeAll()
        //        resultDetailsText = " "
        let size = wordString.count
        if size == 0 {
            return true
        }
        
        for i in 0..<size {
            if Utils.dictionaryContains(wordString: String(wordString[wordString.startIndex...wordString.index(wordString.startIndex, offsetBy: i)]), dict: self.dictWordListArray) && wordBreak(wordString: String(wordString[wordString.index(wordString.startIndex, offsetBy: i+1)..<wordString.endIndex])) {
                resultOutput.append(String(wordString[wordString.startIndex...wordString.index(wordString.startIndex, offsetBy: i)]))
                debugPrint("\(String(wordString[wordString.startIndex...wordString.index(wordString.startIndex, offsetBy: i)]))")
                return true
            }
        }
        
        return false
    }
    
    //MARK : - TextFieldDelegate.
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    func showResult()  {
        
        inputStringTextField.resignFirstResponder()
        inputLabel.text = "Input : \(inputText!)"
        outputLabel.text = "Output : \(isInputStringPresent)"
        
        if isInputStringPresent {
            
            let stringResult = resultOutput.reversed().joined(separator: " ")
            
            resultDetailsLabel.text = "\(AppResultString.reusltTrueDetails) \" \(stringResult) \""
        } else {
            resultDetailsLabel.text = AppResultString.reusltFalseDetails
        }
        resultView.isHidden = false
    }
    
}

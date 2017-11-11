//
//  ViewController.swift
//  iamtranslator
//
//  Created by Fares Alfowzan on 9/2/17.
//  Copyright © 2017 alfowzan.dev. All rights reserved.
//

import UIKit



class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource, UISearchBarDelegate {
    
    var rowSelected = 0;
    var fav : favorites = favorites()
    var rec : historyTableView = historyTableView()
    
    
    
    @IBOutlet var addFavoriteButton : UIButton!
    @IBOutlet var favorite: UIButton!
    @IBOutlet var TranslationLanguages: UIPickerView!
    @IBOutlet var translationLangTest: UILabel!
    @IBOutlet var SearchBar: UISearchBar!
    
    
    //pickerView languages list.
    let languages = ["Pick a language","English to Arabic" , "English to French" , "Arabic to English" , "Arabic to French" , "French to English" , "French to Arabic"]
    
    @IBAction func addFavoriteButton(_ sender: UIButton) {
        //if the search bar is empty, return nothing.
        if (SearchBar.text?.isEmpty)! {
            return
        //loop through favorites list, if the item is already in the favorites, return nothing.
        } else {
        for item in GlobalVariable.favoriteArray {
            if item == SearchBar.text {
                return
                }
            }
            
        }
        GlobalVariable.favoriteArray.append(SearchBar.text!)
        let newItem = GlobalVariable.favoriteArray.last
        if let index = GlobalVariable.favoriteArray.index(of: newItem!) {
            let indexPath = IndexPath(row: index, section: 0)
            fav.tableView.insertRows(at: [indexPath], with: .automatic)
            
        }
        
    }
    
    
    func insertRecent() {
        let newItem = GlobalVariable.recentWor.last
        if let index = GlobalVariable.recentWor.index(of: newItem!) {
            let indexPath = IndexPath(row: index, section: 0)
            rec.tableView.insertRows(at: [indexPath], with: .automatic)
            
        }
    }
    
    
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return languages[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return languages.count
    }
    

    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        rowSelected = row
        
        
    }
    func getSwiftArrayFromPlist(name: String) -> (Array<Dictionary<String,String>>) {
        let path = Bundle.main.path(forResource: name, ofType: "plist")
        var arr  : NSArray?
        arr = NSArray(contentsOfFile: path!)
        return (arr as? Array<Dictionary<String,String>>)!
    }
    func getDataForDate(from:String, to:String, file:String) -> (Array<[String:String]>)
    {
        
        let array = getSwiftArrayFromPlist(name: file)
        
        
        
        
        let namePredict = NSPredicate(format: "\(to) = %@" , from)
        return [array.filter {namePredict.evaluate(with: $0)}[0]]
        
        
    }
    func searchBarSearchButtonClicked(_ SearchBar: UISearchBar) {
        self.view.endEditing(true)
        
        
        pickerView(TranslationLanguages, didSelectRow: rowSelected, inComponent: 1)
        switch rowSelected{
        case 1:
            var word = SearchBar.text
            //loop through the dictionaries from the plist, and look for the word,
            //if found, append the word to recent words array, and display the translate.
            for dict in getDataForDate(from: "Arabic",to: "English", file: "EnglishToArabic") {
                for(key, value) in dict {
                    //remove spaces in the beginning of the word
                    let key1 = key.replacingOccurrences(of: "\\s+$", with: "", options: .regularExpression)
                    word = word?.lowercased()
                    if word == key1 {
                        GlobalVariable.recentWor.append(word!)
                        insertRecent()
                        translationLangTest.text = value
                        break;
                    }
                }
            }
                    case 2:
                        var word = SearchBar.text
                        
                        for dict in getDataForDate(from: "French",to: "English", file: "EnglishToFrench") {
                            for(key, value) in dict {
                                
                                var key1 = key.replacingOccurrences(of: "\\s+$", with: "", options: .regularExpression)
                                
                                word = word?.lowercased()
                                key1 = key1.lowercased()
                                
                                if word == key1 {
                                    GlobalVariable.recentWor.append(word!)
                                    insertRecent()
                                    translationLangTest.text = value
                                    break;
                                }
                                else {
                                    print("word not found")
                                }
                            }
            }
        case 3:
            for dict in getDataForDate(from: "English", to: "Arabic", file: "ArabicToEnglish") {
                for(key, value) in dict {
                    let key2 = key.replacingOccurrences(of: "\\s+$", with: "", options: .regularExpression)
                    
                if SearchBar.text == key2 {
                    
                    let word = SearchBar.text
                    GlobalVariable.recentWor.append(word!)
                    insertRecent()
                    
                    
                    translationLangTest.text = value
                    break;
                    }
                }
                
            }
        case 4:
            var word = SearchBar.text
            
            for dict in getDataForDate(from: "French",to: "Arabic", file: "ArabicToFrench") {
                for(key, value) in dict {
                    let key1 = key.replacingOccurrences(of: "\\s+$", with: "", options: .regularExpression)
                    word = word?.lowercased()
                    if word == key1 {
                        GlobalVariable.recentWor.append(word!)
                        insertRecent()
                        translationLangTest.text = value
                        break;
                    }
                }
            }
        case 5:
            for dict in getDataForDate(from: "English", to: "French", file: "FrenchToEnglish") {
                for(key, value) in dict {
                    let key2 = key.replacingOccurrences(of: "\\s+$", with: "", options: .regularExpression)
                    
                    if SearchBar.text == key2 {
                        
                        let word = SearchBar.text
                        GlobalVariable.recentWor.append(word!)
                        insertRecent()
                        
                        
                        translationLangTest.text = value
                        break;
                    }
                }
                
            }
        case 6:
            for dict in getDataForDate(from: "Arabic", to: "French", file: "FrenchToArabic") {
                for(key, value) in dict {
                    let key2 = key.replacingOccurrences(of: "\\s+$", with: "", options: .regularExpression)
                    
                    if SearchBar.text == key2 {
                        
                        let word = SearchBar.text
                        GlobalVariable.recentWor.append(word!)
                        insertRecent()
                        
                        
                        translationLangTest.text = value
                        break;
                    }
                }
                
            }        default:
            translationLangTest.text = "Please pick a language"
            
        }
    }
    func tableView(_ tableView: UITableView,
                   didSelectRowAt indexPath: IndexPath) {
        translationLangTest.text = ""
        
    }
    override func viewWillDisappear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(false, animated: animated);
        super.viewWillDisappear(animated)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        SearchBar.delegate = self
        SearchBar.placeholder = "Search"
        self.navigationController?.navigationBar.barTintColor = UIColor(red:0.96, green:0.84, blue:0.43, alpha:1.0)
        self.navigationController?.navigationBar.barStyle = UIBarStyle.black
        self.view.backgroundColor = UIColor(red:0.96, green:0.84, blue:0.43, alpha:1.0)
        self.navigationController?.navigationBar.tintColor = UIColor.white
        self.navigationController?.navigationBar.isTranslucent = false
        self.automaticallyAdjustsScrollViewInsets = false
        

        
       
        // Do any additional setup after loading the view, typically from a nib.
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
        // Dispose of any resources that can be recreated.
    }
    func removeItem(_ item: String) {
        if let index = GlobalVariable.favoriteArray.index(of: item) {
            GlobalVariable.favoriteArray.remove(at: index)
        }
    }
    func moveItem(from fromIndex: Int, to toIndex: Int) {
        if fromIndex == toIndex {
            return
        }
        // Get reference to object being moved so you can reinsert it
        let movedItem = GlobalVariable.favoriteArray[fromIndex]
        
        //remove item from array
        GlobalVariable.favoriteArray.remove(at: fromIndex)
        
        //insert item in array at new location
        GlobalVariable.favoriteArray.insert(movedItem, at: toIndex)
    }
    
   

}
//Favorite array and Recent words array. ( Global )
struct GlobalVariable {
    static var favoriteArray = [String]()
    static var recentWor = [String]()
}


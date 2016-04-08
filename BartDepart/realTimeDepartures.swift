//
//  realTimeDepartures.swift
//  BartDepart
//
//  Created by MIchelle Grover on 4/2/16.
//  Copyright © 2016 Norbert Grover. All rights reserved.
//

import Foundation

class realTimeDepartures : UIViewController, NSXMLParserDelegate {
    @IBOutlet weak var tbData: UITableView!
    
    
    var parser = NSXMLParser()
    var posts = NSMutableArray()
    var elements = NSMutableDictionary()
    var element = NSString()
    var name = NSMutableString()
    var abbr = NSMutableString()
    
    
    override func viewDidLoad() {
        
        self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        
        
        self.beginParsing()
    }
    /********* Parser functionality ****************/
    func parser(parser: NSXMLParser, didStartElement elementName: String, namespaceURI: String?, qualifiedName qName: String?, attributes attributeDict: [String : String]) {
        element = elementName
        if (elementName as NSString).isEqualToString("station")
        {
            elements = NSMutableDictionary()
            elements = [:]
            name = NSMutableString()
            name = ""
            abbr = NSMutableString()
            abbr = ""
        }
    }
   
    func parser(parser: NSXMLParser, foundCharacters string: String)
    {
        if element.isEqualToString("name") {
            name.appendString(string)
        } else if element.isEqualToString("abbr") {
            abbr.appendString(string)
        }
    }
    
    func parser(parser: NSXMLParser, didEndElement elementName: String, namespaceURI: String?, qualifiedName qName: String?) {
        if (elementName as NSString).isEqualToString("station") {
            if !name.isEqual(nil) {
                elements.setObject(name, forKey: "name")
            }
            if !abbr.isEqual(nil) {
                elements.setObject(abbr, forKey: "abbr")
            }
            posts.addObject(elements)
        }
    }
    /*************************/
    
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return posts.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        var cell : UITableViewCell = tableView.dequeueReusableCellWithIdentifier("Cell")!
        if(cell.isEqual(NSNull)) {
            cell = NSBundle.mainBundle().loadNibNamed("Cell", owner: self, options: nil)[0] as! UITableViewCell;
        }
        
        cell.textLabel?.text = posts.objectAtIndex(indexPath.row).valueForKey("name") as? String
        cell.detailTextLabel?.text = posts.objectAtIndex(indexPath.row).valueForKey("abbr") as? String
        
        return cell as UITableViewCell
    }
    
    func beginParsing()
    {
        posts = []
        parser = NSXMLParser(contentsOfURL:(NSURL(string:"http://api.bart.gov/api/etd.aspx?cmd=etd&orig=ftvl&key=MW9S-E7SL-26DU-VV8V"))!)!
        parser.delegate = self
        parser.parse()
        tbData!.reloadData()
        }
    }
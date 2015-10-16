// Playground - noun: a place where people can play

import UIKit

protocol APIHandler {
    func didFinishedWithData(data:AnyObject, error:NSError!)
}

class Model {
    var delegate:APIHandler?
    func getItemFromServer(){
        var str = "Respons" as NSString
        self.delegate?.didFinishedWithData(str, error: nil)
    }
}

class ViewControl:APIHandler{
    
    func getItems(){
        var m = Model()
        m.delegate = self
        m.getItemFromServer()
    }
    
    func didFinishedWithData(data:AnyObject, error:NSError!){
        println(data)
    }
}

var v = ViewControl()
v.getItems()

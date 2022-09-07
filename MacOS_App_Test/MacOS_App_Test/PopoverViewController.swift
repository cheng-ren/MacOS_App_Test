//
//  PopoverViewController.swift
//  MacOS_App_Test
//
//  Created by Peanut on 2022/9/5.
//

import Cocoa

class PopoverViewController: NSViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do view setup here.
    }
    
}

extension PopoverViewController {
    
    static func rootController() -> PopoverViewController {
        //获取对Main.storyboard的引用
        let storyboard = NSStoryboard(name: NSStoryboard.Name("Main"), bundle: nil)
        // 为PopoverViewController创建一个标识符
        let identifier = NSStoryboard.SceneIdentifier("PopoverViewController")
        // 实例化PopoverViewController并返回
        guard let viewcontroller = storyboard.instantiateController(withIdentifier: identifier) as? PopoverViewController else {
            fatalError("Something Wrong with Main.storyboard")
        }
        return viewcontroller
    }
    
}

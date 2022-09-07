//
//  MainMenuItem.swift
//  MacOS_App_Test
//
//  Created by Peanut on 2022/9/6.
//

import Cocoa

let mainStatusItem = MainMenuItem.mainItem()

class MainMenuItem: NSObject {
    
    let statusItem = NSStatusBar.system.statusItem(withLength: NSStatusItem.squareLength)
    
    let popover = NSPopover()
    
    var eventMonitor: EventMonitor?
    
    private override init() {
        super.init()
        if let button = statusItem.button {
            button.image = NSImage(named: "icon_menu_item")
            button.target = self
            button.action = #selector(showPopover(_:))
        }
        
        popover.contentViewController = PopoverViewController.rootController()
        popover.behavior = .transient
        
        eventMonitor = EventMonitor(mask: [.leftMouseDown, .rightMouseDown]) { [weak self] event in
            guard let `self` = self else { return }
            if self.popover.isShown {
                self.closePopover(event!)
            }
        }
    }
    
    func config() {

    }
    
    @objc func togglePopover(_ sender: AnyObject) {
        if popover.isShown {
            closePopover(sender)
        } else {
            showPopover(sender)
        }
    }
    
    @objc func showPopover(_ sender: AnyObject) {
        if let button = statusItem.button {
            popover.show(relativeTo: button.bounds, of: button, preferredEdge: NSRectEdge.minY)
            eventMonitor?.start()
        }
    }
    
    @objc func closePopover(_ sender: AnyObject) {
        popover.performClose(sender)
        eventMonitor?.stop()
    }
    
}

extension MainMenuItem {
    static func mainItem() -> MainMenuItem {
        return MainMenuItem()
    }
}

extension AppDelegate {
    
    func configStatusBar() {
        mainStatusItem.config()
    }
    
}

//
//  MessagesViewController.swift
//  FoodIMessage
//
//  Created by ShrawanKumar Sharma on 15/09/16.
//  Copyright © 2016 FoodApp. All rights reserved.
//

import UIKit
import Messages

class MessagesViewController: MSMessagesAppViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Conversation Handling
    
    override func willBecomeActive(with conversation: MSConversation) {
        // Called when the extension is about to move from the inactive to active state.
        // This will happen when the extension is about to present UI.
        presentViewController(for:conversation,in:presentationStyle)
        

        // Use this method to configure the extension and restore previously stored state.
    }
    
    override func didResignActive(with conversation: MSConversation) {
        // Called when the extension is about to move from the active to inactive state.
        // This will happen when the user dissmises the extension, changes to a different
        // conversation or quits Messages.
        
        // Use this method to release shared resources, save user data, invalidate timers,
        // and store enough state information to restore your extension to its current state
        // in case it is terminated later.
    }
   
    override func didReceive(_ message: MSMessage, conversation: MSConversation) {
        // Called when a message arrives that was generated by another instance of this
        // extension on a remote device.
        
        // Use this method to trigger UI updates in response to the message.
    }
    
    override func didStartSending(_ message: MSMessage, conversation: MSConversation) {
        // Called when the user taps the send button.
    }
    
    override func didCancelSending(_ message: MSMessage, conversation: MSConversation) {
        // Called when the user deletes the message without sending it.
    
        // Use this to clean up state related to the deleted message.
    }
    
    override func willTransition(to presentationStyle: MSMessagesAppPresentationStyle) {
        // Called before the extension transitions to a new presentation style.
    
        // Use this method to prepare for the change in presentation style.
    }
    
    override func didTransition(to presentationStyle: MSMessagesAppPresentationStyle) {
        // Called after the extension transitions to a new presentation style.
        
        guard let conversation = activeConversation else { fatalError("Expected an active converstation") }
        // Present the view controller appropriate for the conversation and presentation style.
        presentViewController(for: conversation, in: presentationStyle)
        // Use this method to finalize any behaviors associated with the change in presentation style.
    }

    
    // MARK: - PresentViewController
    
    func presentViewController(for:MSConversation, in:MSMessagesAppPresentationStyle ) {
        
        let controller : UIViewController
        
        if presentationStyle == .compact {
            controller = initateCompactVC()
        } else {
            controller = initateExpandVC()
            
        }
        
        
        //this is used to embeded the vc
        addChildViewController(controller)
        controller.view.frame = view.bounds
        controller.view.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(controller.view)
        
        controller.view.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        controller.view.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        controller.view.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        controller.view.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        
        controller.didMove(toParentViewController: self)

        
    }
    
    
    // MARK: - Initate VC
    
    func   initateCompactVC() -> UIViewController {
        
        // let vc = storyboard?.instantiateViewController(withIdentifier: "CompactVC") as! CompactVC
        
        
        guard let controller = storyboard?.instantiateViewController(withIdentifier: CompactVC.storyboardIdentifier) as? CompactVC else { fatalError("Unable to instantiate an IceCreamsViewController from the storyboard") }
        
        //to call the call back
        controller.delegate = self
        
        return controller
        
        
    }
    func   initateExpandVC() -> UIViewController {
        
     //   let vc = storyboard?.instantiateViewController(withIdentifier: "ExpandVC") as! ExpandVC
       
        
        
         guard let controller = storyboard?.instantiateViewController(withIdentifier: ExpandVC.storyboardIdentifier) as? ExpandVC else { fatalError("Unable to instantiate an IceCreamsViewController from the storyboard") }
        
        
        controller.delegate2 = self
        //Remember to extend the extension in this || if you will leave to implement it is error
       
        return controller
    }

    
    
    //We have to write to compose mail
    
    fileprivate func composeMessage( caption: String, session: MSSession? = nil) -> MSMessage {
        let components = URLComponents()
       
      //  components.queryItems = "hi"
        
        let layout = MSMessageTemplateLayout()
        layout.image =  UIImage.init(named:"photo.jpg")
        
        
        layout.caption = caption
        let message = MSMessage(session: session ?? MSSession())
        message.url = components.url!
        message.layout = layout
        
        return message
    }
    
    
        }

// MARK: - ExpandProtocol
extension MessagesViewController:ExpandVCDelegate {
    
    func expandVCDelagate() {
        requestPresentationStyle(.expanded)
    }

}



// MARK: - Send Message

extension MessagesViewController:SendMessageToCustomer {
    
    func sendFood() {
        
        // Compose the message to send to the endUser
        
        
        
        guard let conversation = activeConversation else { fatalError("Expected a conversation") }
        
        
        /*
         Update the ice cream with the selected body part and determine a caption
         and description of the change.
         */
        var messageCaption: String
        
        
        /*
 
 
         this will be used to say the user that you are going to deposit the message
         
        */
        
        
        
//        
//        if let base = iceCreamPart as? Base {
//            iceCream.base = base
//            messageCaption = NSLocalizedString("Let's build an ice cream", comment: "")
//        }
//        else if let scoops = iceCreamPart as? Scoops {
//            iceCream.scoops = scoops
//            messageCaption = NSLocalizedString("I added some scoops", comment: "")
//        }
//        else if let topping = iceCreamPart as? Topping {
//            iceCream.topping = topping
//            messageCaption = NSLocalizedString("Our finished ice cream", comment: "")
//        }
//        else {
//            fatalError("Unexpected type of ice cream part selected.")
//        }
        
        // Create a new message with the same session as any currently selected message.
        let message = composeMessage( caption: "Deposit Food", session: conversation.selectedMessage?.session)
        
        // Add the message to the conversation.
        conversation.insert(message) { error in
            if let error = error {
                print(error)
            }
        }
        
        // If the ice cream is complete, save it in the history.
//        if iceCream.isComplete {
//            var history = IceCreamHistory.load()
//            history.append(iceCream)
//            history.save()
//        }
        
        dismiss()
    }

    }
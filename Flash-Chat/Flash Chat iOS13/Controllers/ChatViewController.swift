//
//  ChatViewController.swift
//  Flash Chat iOS13
//
//  Created by Angela Yu on 21/10/2019.
//  Copyright © 2019 Angela Yu. All rights reserved.
//

import UIKit
import FirebaseAuth
import FirebaseFirestore

class ChatViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var messageTextfield: UITextField!
    
    private let db = Firestore.firestore()
    private var messages = [Message]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        title = K.appName
        navigationItem.hidesBackButton = true
        
        tableView.register(UINib(nibName: K.cellNibName, bundle: nil), forCellReuseIdentifier: K.cellIdentifier)
        
        loadMessages()
        
    }
    
    private func loadMessages() {
        db.collection(K.FStore.collectionName)
            .order(by: K.FStore.dateField)
            .addSnapshotListener {(querySnapshot, error) in
                self.messages = []
            if let error = error {
                print("Error retrieving data from Firestore: \(error)")
                return
            }
            
            guard let snapShotDocuments = querySnapshot?.documents else { return }
            
            for doc in snapShotDocuments {
                guard let messageSender = doc.data()[K.FStore.senderField] as? String,
                      let messageBody = doc.data()[K.FStore.bodyField] as? String else {
                    continue
                }
                
                let newMessage = Message(sender: messageSender, body: messageBody)
                self.messages.append(newMessage)
            }
            
            DispatchQueue.main.async {
                self.tableView.reloadData()
                let indexPath = IndexPath (row: self.messages.count - 1, section: 0)
                self.tableView.scrollToRow(at: indexPath, at: .top, animated: false)
            }
        }
    }
    
    @IBAction func sendPressed(_ sender: UIButton) {
        guard let messageBody = messageTextfield.text,
              let messageSender = Auth.auth().currentUser?.email else {
            return
        }
        
        let newMessage = Message(sender: messageSender, body: messageBody)
        messages.append(newMessage)
        tableView.reloadData()
        messageTextfield.text = ""
        
        saveMessage(sender: messageSender, body: messageBody)
    }
    
    private func saveMessage(sender: String, body: String) {
        db.collection(K.FStore.collectionName).addDocument(data: [
            K.FStore.senderField: sender,
            K.FStore.bodyField: body,
            K.FStore.dateField: Date().timeIntervalSince1970
        ]) { (error) in
            if let error = error {
                print("Error saving data to Firestore: \(error)")
                return
            }
            
            print("Data successfully saved.")
            DispatchQueue.main.async {
                self.messageTextfield.text = ""
            }
        }
    }
    
    @IBAction func LogOutPressed(_ sender: UIBarButtonItem) {
        do {
            try Auth.auth().signOut()
            navigationController?.popToRootViewController(animated: true)
            
        } catch let signOutError as NSError {
            print("Error signing out: %@", signOutError)
        }
        
    }
    
}

extension ChatViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return messages.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let message = messages[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: K.cellIdentifier, for: indexPath) as! MessageCell
        cell.label.text = message.body
        
        if message.sender == Auth.auth().currentUser?.email {
            cell.leftImageView.isHidden = true
            cell.rightImageView.isHidden = false
            cell.messageBubble.backgroundColor = UIColor(named: K.BrandColors.lightPurple)
            cell.label.textColor = UIColor(named: K.BrandColors.purple)
        } else {
            cell.leftImageView.isHidden = false
            cell.rightImageView.isHidden = true
            cell.messageBubble.backgroundColor = UIColor(named: K.BrandColors.purple)
            cell.label.textColor = UIColor(named: K.BrandColors.lightPurple)
        }
        
        return cell
    }
    
    
}

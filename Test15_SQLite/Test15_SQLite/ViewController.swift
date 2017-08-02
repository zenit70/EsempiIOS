//
//  ViewController.swift
//  Test15_SQLite
//
//  Created by Ospite on 16/05/17.
//  Copyright © 2017 zenit70. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    private var contacts = [Contact]()
    private var selectedContact:Int?

    @IBOutlet weak var txtSurname: UITextField!
    @IBOutlet weak var txtName: UITextField!
    @IBOutlet weak var txtPhone: UITextField!
    @IBOutlet weak var listContact: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        listContact.delegate = self
        listContact.dataSource = self
        
        contacts = ContactsDb.instance.getListContact()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func btnNew(_ sender: UIButton) {
        let surname = txtSurname.text ?? ""
        let name = txtName.text ?? ""
        let phone = txtPhone.text ?? ""
        
        if let id = ContactsDb.instance.addContact(csurname: surname, cname: name, cphone: phone) {
            let contact = Contact(id: 0, surname: surname, name: name, phone: phone)
            contacts.append(contact)
            listContact.insertRows(at: [IndexPath(row: contacts.count - 1, section: 0)], with: UITableViewRowAnimation.fade)
            txtSurname.text = ""
            txtName.text = ""
            txtPhone.text = ""
        }
    }
    
    @IBAction func btnUpdate(_ sender: UIButton) {
        if selectedContact != nil {
            let id = contacts[selectedContact!].id!
            let surname = txtSurname.text ?? ""
            let name = txtName.text ?? ""
            let phone = txtPhone.text ?? ""
            let contact = Contact(id: id, surname: surname, name: name, phone: phone)
            contacts.remove(at: selectedContact!)
            contacts.insert(contact, at: selectedContact!)
            ContactsDb.instance.updateContact(cid: id, newContact: contact)
            listContact.reloadData()
            txtSurname.text = ""
            txtName.text = ""
            txtPhone.text = ""
        } else {
            print("Nessun contatto selezionato")
        }
    }
    
    @IBAction func btnDelete(_ sender: UIButton) {
        if selectedContact != nil {
            ContactsDb.instance.deleteContact(cid: contacts[selectedContact!].id!)
            contacts.remove(at: selectedContact!)
            listContact.reloadData()
            txtSurname.text = ""
            txtName.text = ""
            txtPhone.text = ""
        } else {
            print("Nessun contatto selezionato")
        }
    }
    
    // metodi tableview
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return contacts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:UITableViewCell = UITableViewCell(style: UITableViewCellStyle.subtitle, reuseIdentifier: nil)
        cell.detailTextLabel?.text = contacts[indexPath.row].surname + " " + contacts[indexPath.row].name
        cell.textLabel?.text = contacts[indexPath.row].phone
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        txtSurname.text = contacts[indexPath.row].surname
        txtName.text = contacts[indexPath.row].name
        txtPhone.text = contacts[indexPath.row].phone
        selectedContact = indexPath.row
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            ContactsDb.instance.deleteContact(cid: contacts[selectedContact!].id!)
            contacts.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
            txtSurname.text = ""
            txtName.text = ""
            txtPhone.text = ""
        }
    }
}


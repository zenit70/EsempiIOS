//
//  ContactsDb.swift
//  Test15_SQLite
//
//  Created by Ospite on 16/05/17.
//  Copyright © 2017 zenit70. All rights reserved.
//

import SQLite

class ContactsDb {
    static let instance = ContactsDb()
    
    private let db: Connection?
    
    private let contacts = Table("contacts")
    private let id = Expression<Int64>("id")
    private let surname = Expression<String?>("surname")
    private let name = Expression<String?>("name")
    private let phone = Expression<String?>("phone")
    
    private init() {
        let path = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
        do {
            db = try Connection("\(path)/Contacts.db.sqlite3")
        } catch {
            db = nil
            print("Impossibile aprire il db")
        }
        
        createTable()
    }
    
    func createTable() {
        do {
            try db!.run(contacts.create(ifNotExists: true) {
                table in
                table.column(id, primaryKey: true)
                table.column(surname)
                table.column(name)
                table.column(phone)
            })
        } catch {
            print("Impossibile creare la tabella")
        }
    }
    
    func addContact(csurname:String, cname:String, cphone:String) -> Int64? {
        do {
            let insert = contacts.insert(surname <- csurname, name <- cname, phone <- cphone)
            let id = try db!.run(insert)
            return id
        } catch {
            print("Inserimento fallito")
            return -1
        }
    }
    
    func getListContact() -> [Contact] {
        var contacts = [Contact]()
        do {
            for contact in try db!.prepare(self.contacts) {
                contacts.append(Contact(id: contact[id], surname: contact[surname]!, name: contact[name]!, phone: contact[phone]!))
            }
        } catch {
            print("Query fallita")
        }
        return contacts
    }
    
    func deleteContact(cid:Int64) -> Bool {
        do {
            let contact = contacts.filter(id == cid)
            try db!.run(contact.delete())
            return true
        } catch {
            print("Cancellazione fallita")
            return false
        }
    }
    
    func updateContact(cid:Int64, newContact:Contact) -> Bool {
        let contact = contacts.filter(id == cid)
        do {
            let update = contact.update([surname <- newContact.surname, name <- newContact.name, phone <- newContact.phone])
            if try db!.run(update) > 0 {
                return true
            }
        } catch {
            print("Errore di aggiornamento")
        }
        return false
    }
}

//
//  CoreDataControler.swift
//  Emotiva
//
//  Created by Jonas Fernando Nascimento Melo on 04/12/25.
//

import CoreData
import Foundation

class CoreDataController {
    static let shared = CoreDataController()
    
    let persistentContainer: NSPersistentContainer
    var viewContext: NSManagedObjectContext {
        persistentContainer.viewContext
    }
    
    private init() {
        persistentContainer = NSPersistentContainer(name: "Model")
        
        persistentContainer.loadPersistentStores { _, error in
            if let error = error {
                fatalError("Could not load CoreData stack: \(error.localizedDescription)")
            }
            
        }
    }
    
    func saveContext() {
        if viewContext.hasChanges {
            do {
                try viewContext.save()
            } catch {
                print("Error saving context: \(error.localizedDescription)")
            }
        }
    }
    
    func creatDailyNote(text: String, date: Date, id: UUID, sentimentScore: Double, people: [Person]) -> DailyNotes {
        let dNote = DailyNotes(context: viewContext)
        
        dNote.text = text
        dNote.date = date
        dNote.id = id
        dNote.sentimentScore = sentimentScore
        dNote.people = NSSet(array: people)
        saveContext()
        return dNote
    }
    
    func updateDNoteText(dNote: DailyNotes, text: String){
        dNote.text = text
        saveContext()
    }
    
    func updateDNotePeople(dNote: DailyNotes, people: [Person]){
        dNote.people = NSSet(array: people)
        saveContext()
    }
    
    func creatPerson(name: String, photo: Data, relationship: Int16, content: String, dNotes: [DailyNotes]) -> Person {
        let p = Person(context: viewContext)
        
        p.name = name
        p.photo = photo
        p.relationship = relationship
        p.content = content
        p.dailyNotes = NSSet(array: dNotes)
        
        saveContext()
        return p
    }
    
    func updatePName(person: Person, name: String){
        person.name = name
        saveContext()
    }
    
    func updatePPhoto(person: Person, photo: Data){
        person.photo = photo
        saveContext()
    }
    
    func updatePRealtionship(person: Person, relationship: Int16){
        person.relationship = relationship
        saveContext()
    }
    
    func updatePContent(person: Person, content: String){
        person.content = content
        saveContext()
    }
    
    func updatePDNotes(person: Person, dNotes: [DailyNotes]){
        person.dailyNotes = NSSet(array: dNotes)
        saveContext()
    }
    
    func fetchAll() -> ([DailyNotes],[Person]) {
        let fetchRequestDNotes: NSFetchRequest<DailyNotes> = DailyNotes.fetchRequest()
        let fetchRequestPerson: NSFetchRequest<Person> = Person.fetchRequest()
        
        do {
            let resultDNotes = try viewContext.fetch(fetchRequestDNotes)
            let resultPerson = try viewContext.fetch(fetchRequestPerson)
            return (resultDNotes, resultPerson)
        } catch {
            print("Error fetching ToDos: \(error.localizedDescription)")
            return ([], [])
        }
    }
    
    func deleteDNote(_ dNote: DailyNotes) {
        viewContext.delete(dNote)
        
        saveContext()
    }
    
    func deletePerson(_ person: Person) {
        viewContext.delete(person)
        
        saveContext()
    }
}


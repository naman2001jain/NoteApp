//
//  AddNoteViewController.swift
//  NoteApp
//
//  Created by naman  jain on 27/03/22.
//

import UIKit

class AddNoteViewController: UIViewController {
    
    @IBOutlet weak var deleteButtonOutlet: UIBarButtonItem!
    var note: Note?
    var update: Bool = false
    @IBOutlet weak var titleTextField: UITextField!
    
    @IBOutlet weak var noteTextView: UITextView!
    override func viewDidLoad() {
        super.viewDidLoad()
        titleTextField.text = note?.title
        noteTextView.text = note?.note
    }
    
    override func viewWillAppear(_ animated: Bool) {
        if(!update){
            deleteButtonOutlet.isEnabled = false
            deleteButtonOutlet.title = ""
        }
    }
    
    @IBAction func deleteButtonPressed(_ sender: UIBarButtonItem) {
        ApiCallers.shared.deleteNote(id: note!._id)
        self.navigationController?.popViewController(animated: true)
        
    }
    @IBAction func saveButtonPressed(_ sender: UIBarButtonItem) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd-mm-yyyy"
        
        let date =  dateFormatter.string(from: Date())
        
        if(update){
            ApiCallers.shared.updateNotes(title: titleTextField.text!, note: noteTextView.text, date: date, id: note!._id)
            self.navigationController?.popViewController(animated: true)

        }
        else if (titleTextField.text != "" && noteTextView.text != ""){
            ApiCallers.shared.addNotes(title: titleTextField.text!, note: noteTextView.text, date: date)
            
            self.navigationController?.popViewController(animated: true)

        }
        
    }
    
}

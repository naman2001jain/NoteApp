//
//  AddNoteViewController.swift
//  NoteApp
//
//  Created by naman  jain on 27/03/22.
//

import UIKit

class AddNoteViewController: UIViewController {
    
    var note: Note?
    
    @IBOutlet weak var titleTextField: UITextField!
    
    @IBOutlet weak var noteTextView: UITextView!
    override func viewDidLoad() {
        super.viewDidLoad()
        titleTextField.text = note?.title
        noteTextView.text = note?.note
    }
    
    @IBAction func deleteButtonPressed(_ sender: UIBarButtonItem) {
        ApiCallers.shared.deleteNote(id: note!._id)
        self.navigationController?.popViewController(animated: true)
        
    }
    @IBAction func saveButtonPressed(_ sender: UIBarButtonItem) {
//        ApiCallers.shared.addNotes(title: titleTextField.text!, note: noteTextView.text, date: "placeholder")
        
        ApiCallers.shared.updateNotes(title: titleTextField.text!, note: noteTextView.text, date: "placeholder", id: note!._id)
        
        
        self.navigationController?.popViewController(animated: true)
    }
    
}

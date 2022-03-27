//
//  HomeViewController.swift
//  NoteApp
//
//  Created by naman  jain on 27/03/22.
//

import UIKit

protocol DataDelegate{
    func updateArray(newArray: String)
}

class HomeViewController: UIViewController {
    
    
    @IBOutlet weak var NotesTableView: UITableView!
    var notesArray = [Note]()
    override func viewDidLoad() {
        super.viewDidLoad()
        NotesTableView.dataSource = self
        NotesTableView.delegate = self
        NotesTableView.rowHeight = 100
        ApiCallers.shared.delegate = self
        ApiCallers.shared.fetchNotes()
        NotesTableView.reloadData()
    }
    
    
    @IBAction func addNoteButtonPressed(_ sender: UIBarButtonItem) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "AddNoteViewController") as! AddNoteViewController
        self.navigationController?.pushViewController(vc, animated: true)
    }
}

extension HomeViewController: DataDelegate{
    func updateArray(newArray: String) {
        do{
            notesArray = try JSONDecoder().decode([Note].self, from: newArray.data(using: .utf8)!)
        }catch{
            print("failed to decode", error)
        }
        NotesTableView.reloadData()

    }
}

extension HomeViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return notesArray.count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "AddNoteViewController") as! AddNoteViewController
        vc.note = notesArray[indexPath.row]
        navigationController?.pushViewController(vc, animated: true)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "NotesTableViewCell", for: indexPath)
        cell.textLabel?.text = notesArray[indexPath.row].title
        return cell
    }
}


extension HomeViewController: UITableViewDelegate{
    
}

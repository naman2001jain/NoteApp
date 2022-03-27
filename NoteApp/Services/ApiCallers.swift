import Alamofire
import Foundation

struct ApiCallers{
    var delegate: DataDelegate?
    
    static var shared = ApiCallers();
    func fetchNotes(){
        AF.request("http://localhost:8080/fetch").response{ res in
            print(res.data)
            let data = String(data: res.data ?? Data(count: 2) ,encoding: .utf8)
            self.delegate?.updateArray(newArray: data ?? "nothing")
        }
    }
    
    func addNotes(title: String, note: String, date: String){
        AF.request("http://localhost:8080/create", method: .post, encoding: URLEncoding.httpBody, headers: ["title": title, "note": note, "date": date])
            .responseDecodable(of: Note.self) { response in
                print("Note added to the database successfully!")
        }
    }
    
    func updateNotes(title: String, note: String, date: String, id: String){
        AF.request("http://localhost:8080/update", method: .patch, encoding: URLEncoding.httpBody, headers: ["title": title, "note": note, "date": date, "id": id])
            .responseDecodable(of: Note.self){ response in
                
                
            }
    }
    
}

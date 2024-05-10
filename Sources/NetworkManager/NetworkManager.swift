import Foundation

@available(iOS 13.0, *)
public class NetworkManager {

    public init(){}
    
    public func getData(link:String, completion: @escaping (Data)->Void){
        if let url = URL(string: link){
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url){
                (data, response, error) in
                if error != nil{
                    print("Something went wrong")
                    print("error: \(String(describing: error))")
                    return
                }
                if let safeData = data{
                    completion(safeData)
                }
            }
            task.resume()
        }
    }
    
}


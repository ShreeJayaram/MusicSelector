
import UIKit
import MediaPlayer

class Musicgen: UIViewController {
    
    var music = MPMusicPlayerController.applicationMusicPlayer()

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    
    @IBAction func Musicgentap(_ sender: UIButton) {
        MPMediaLibrary.requestAuthorization { (status) in
            if status == .authorized {
                self.GenreTunes(genre: sender.currentTitle!)
            }
        
        }
        
    }
    
    
    @IBAction func stopbuttontap(_ sender: UIButton) {
        music.stop()
    }
    
    @IBAction func nextbuttontap(_ sender: UIButton) {
        music.skipToNextItem()
    }
    
    func GenreTunes(genre : String) {
        
        music.stop()
        
        let query = MPMediaQuery()
        let predicate = MPMediaPropertyPredicate(value: genre, forProperty: MPMediaItemPropertyGenre)
        
        query.addFilterPredicate(predicate)
        music.setQueue(with: query)
        music.shuffleMode = .songs
        music.play()
        
        
    }
    
    
}

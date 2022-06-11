import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    var player: AVAudioPlayer!

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func keyPressed(_ sender: UIButton) {
        if let unwrapped = sender.currentTitle {
            playSound(soundName: unwrapped)
            sender.alpha = 0.5
            print("Start")
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
                sender.alpha = 1
                print("End")
            }
        } else {
            print("Missing name.")
        }
    }
    
    func playSound(soundName: String) {
        let url = Bundle.main.url(forResource: soundName, withExtension: "wav")
        player = try! AVAudioPlayer(contentsOf: url!)
        player.play()
                
    }
}

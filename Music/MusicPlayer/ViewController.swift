//
//  ViewController.swift
//  MusicPlayer
//
//  Created by YangMinUk on 27/01/2019.
//  Copyright © 2019 YangMinUk. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController,AVAudioPlayerDelegate {

    var player:AVAudioPlayer!
    var timer:Timer!
    
    //IBQutlet는 View를 control+클릭했을 때 변수가 보이게 (view 와 변수를 연결하는 방법)
    @IBOutlet var playPauseButton: UIButton!
    @IBOutlet var timeLabel:UILabel!
    @IBOutlet var progressSlider:UISlider!  //IBQutlet을 사용한 후 연결한 후 이름을 변경하면 오류!
    
    
    //화면 초기화
    func initializePlayer(){
        guard let soundAsset: NSDataAsset = NSDataAsset(name: "sound") else{ //name이라는 파일을 불러옴
            print("음원 파일에셋을 가져올수없습니다")
            return
        }
        do{
            try self.player=AVAudioPlayer(data: soundAsset.data) //AVAudioPlayer는 사운드 데이터를 재생하는 기능
            self.player.delegate = self
        } catch let error as NSError{
            print("플레이어 초기화 실패")
            print("코드:\(error.code),메세지:\(error.localizedDescription)")
        }
        
        self.progressSlider.maximumValue=Float(self.player.duration)
        self.progressSlider.minimumValue=0
        self.progressSlider.value=Float(self.player.currentTime)
    }
    
    func updateTimeLabelText(time:TimeInterval){
        let minute:Int=Int(time/60)
        let secound:Int=Int(time.truncatingRemainder(dividingBy: 60))
        let milisecond:Int=Int(time.truncatingRemainder(dividingBy: 1)*100)
        
        let timeText:String=String(format:"%02ld:%02ld:%02ld",minute,secound,milisecond)
        
        self.timeLabel.text=timeText
    }

    func makeAndFireTimer(){
        self.timer=Timer.scheduledTimer(withTimeInterval: 0.01, repeats: true, block:{[unowned self]
            (timer: Timer) in
            //TimeInterval는 다음 타이머가 실행될 시각
            if self.progressSlider.isTracking{return}
            
            
            //현재 재생되고 있는 사운드 파일의 시간을 기준으로 text와 slider를 맞춤
            self.updateTimeLabelText(time:self.player.currentTime)
            self.progressSlider.value=Float(self.player.currentTime)
        })
        
        self.timer.fire()
    }
    
    //타이머를 해제
    func invalidateTimer(){
        self.timer.invalidate()
        self.timer=nil
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.initializePlayer()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.playPauseButton.translatesAutoresizingMaskIntoConstraints=false
        self.progressSlider.translatesAutoresizingMaskIntoConstraints=false
        self.timeLabel.translatesAutoresizingMaskIntoConstraints=false
        
        //오토레이아웃을 사용하지 않을 경우, 마스크를 false로 해줘야 제약조건 충돌이 안생김
        
        var constrainX:NSLayoutConstraint
        constrainX=playPauseButton.centerXAnchor.constraint(equalTo: self.view.centerXAnchor)
        
        var constrainY:NSLayoutConstraint
        constrainY=playPauseButton.centerYAnchor.constraint(equalTo: self.view.centerYAnchor)
        
        //playButton의 위치를 화면의 x,y로 바꾸면서 그 값을 저장함
        
        var buttonconstrainX:NSLayoutConstraint
        buttonconstrainX = timeLabel.centerXAnchor.constraint(equalTo:playPauseButton.centerXAnchor)
        //timelabel x좌표를 button의 x좌표에 마춤
        
        var topconstrainY:NSLayoutConstraint
        topconstrainY = timeLabel.bottomAnchor.constraint(equalTo:playPauseButton.bottomAnchor,constant:+40)
        //+면 밑으로 내려감
       let buttonsliderX: NSLayoutConstraint = progressSlider.centerXAnchor.constraint(equalTo: playPauseButton.centerXAnchor)
        let widthslider:NSLayoutConstraint=progressSlider.widthAnchor.constraint(equalTo:
        playPauseButton.widthAnchor)
    
        let topsliderX: NSLayoutConstraint = progressSlider.bottomAnchor.constraint(equalTo: timeLabel.bottomAnchor,constant: +40)
        
        constrainX.isActive=true //isActive true해줘야 제약조건이 적용됨
        constrainY.isActive=true
        buttonconstrainX.isActive=true
        topconstrainY.isActive=true
        widthslider.isActive=true
        buttonsliderX.isActive=true
        topsliderX.isActive=true
    }

    @IBAction func touchUpPlayPauseButton(_ sender:UIButton){
       sender.isSelected = !sender.isSelected
        
        if sender.isSelected{
            self.player?.play()
        }else{
            self.player?.pause()
        }
        
        if sender.isSelected{
            self.makeAndFireTimer()
        }else{
            self.invalidateTimer()
        }
    }

    
    @IBAction func sliderValueChanged(_ sender: UISlider) {
        self.updateTimeLabelText(time: TimeInterval(sender.value))
        if sender.isTracking{return}
        self.player.currentTime=TimeInterval(sender.value) //슬라이드의 위치만큼 사운드 재생위치 이동
    }
    
    func audioPlayerDecodeErrorDidOccur(_ player: AVAudioPlayer, error: Error?) {
        guard let error:Error = error else{
            print("오디오 플레이어 디코드 오류발생")
            return
        }
        
        let message:String
        message = "오디오 플레이어 오류 발생 \(error.localizedDescription)"
        
        let alert:UIAlertController = UIAlertController(title:"알림",message:message,
            preferredStyle:UIAlertController.Style.alert)
        
        let okAction:UIAlertAction=UIAlertAction(title:"확인",style:
        UIAlertAction.Style.default){(action:UIAlertAction)-> Void in
            self.dismiss(animated: true, completion: nil)
        }
        alert.addAction(okAction)
        self.present(alert,animated: true,completion: nil)
    }
    
    func audioPlayerDidFinishPlaying(_ player: AVAudioPlayer, successfully flag: Bool) {
      self.playPauseButton.isSelected=false
        self.progressSlider.value=0
        self.updateTimeLabelText(time: 0)
        self.invalidateTimer()
    }
}


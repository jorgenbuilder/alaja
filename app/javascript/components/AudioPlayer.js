import React from "react"
import PropTypes from "prop-types"
import {Howl, Howler} from 'howler';

const AudioPlayer = (props) => {
  const [player, setPlayer] = React.useState();
  const [playing, setPlaying] = React.useState(false);
  const [loaded, setLoaded] = React.useState(false);
  const [trackProgress, setTrackProgress] = React.useState(0);
  const [volume, setVolume] = React.useState(33);
  Howler.volume(volume / 100);

  const requestAnimationFrameRef = React.useRef();
  
  if (!player) {
    const initPlayer = new Howl({
      src: [props.url],
      html5: true,
    })
    initPlayer.once('load', function(){
      setLoaded(true);
    });
    setPlayer(initPlayer);
  }

  const beginProgressAnimation = () => {
    // console.log("Begin Animation.")
    requestAnimationFrameRef.current = requestAnimationFrame(animateProgress);
  }
  
  const stopProgressAnimation = () => {
    // console.log("Stop Animation.")
    cancelAnimationFrame(requestAnimationFrame.current);
  }

  const animateProgress = () => {
    // console.log('Animate.');
    setTrackProgress(player.seek() / player.duration() * 100);
    requestAnimationFrameRef.current = requestAnimationFrame(animateProgress);
  }

  const play = () => {
    player.play();
    setPlaying(true);
    beginProgressAnimation();
  }
  
  const pause = () => {
    player.pause();
    setPlaying(false);
    stopProgressAnimation();
  }

  const stop = () => {
    player.stop();
    setPlaying(false);
    stopProgressAnimation();
  }
  
  const handleTrackClick = (event) => {
    const track = event.target.closest('.AudioPlayer__track');
    const pct = (event.screenX - track.offsetLeft) / track.offsetWidth * 100;
    setTrackProgress(pct);
    player.seek(player.duration() * (pct / 100));
  };

  const handleVolumeClick = (event) => {
    const track = event.target.closest('.AudioPlayer__controls__volume__slider');
    const pct = (event.screenX - track.offsetLeft) / track.offsetWidth * 100;
    setVolume(pct);
    Howler.volume(pct / 100);
  };

  const handlePlayClick = (event) => {
    if (playing) {
      pause();
    } else {
      play();
    }
  };
  
  const handleStopClick = (event) => {
    stop();
  };

  const trackStyle = {
    'transform': `translateX(${trackProgress}%)`,
  };

  const volStyle= {
    'transform': `translateX(${volume}%)`,
  }

  return <div className="AudioPlayer">
    <div className="AudioPlayer__track" onClick={handleTrackClick}>
      <div className="AudioPlayer__track__progress" style={trackStyle}>
        <div className="AudioPlayer__track__playhead"></div>
      </div>
    </div>
    <div className="AudioPlayer__monitors">
      <div className="AudioPlayer__monitors__frq"></div>
      <div className="AudioPlayer__monitors__vol"></div>
      <div className="AudioPlayer__monitors__bpm"></div>
    </div>
    <div className="AudioPlayer__controls">
      <div className="AudioPlayer__controls__button AudioPlayer__controls__playpause" onClick={handlePlayClick}>
        <i className="fas fa-play"></i>
      </div>
      <div className="AudioPlayer__controls__button AudioPlayer__controls__stop" onClick={handleStopClick}>
        <i className="fas fa-stop"></i>
      </div>
      <div className="AudioPlayer__controls__button AudioPlayer__controls__backward">
        <i className="fas fa-backward"></i>
      </div>
      <div className="AudioPlayer__controls__button AudioPlayer__controls__forward">
        <i className="fas fa-forward"></i>
      </div>
      <div className="AudioPlayer__controls__volume">
        <div className="AudioPlayer__controls__button">
          <i className="fas fa-volume-up"></i>
        </div>
        <div className="AudioPlayer__controls__volume__slider" onClick={handleVolumeClick}>
          <div className="AudioPlayer__controls__volume__slider__track"></div>
          <div className="AudioPlayer__controls__volume__slider__bar" style={volStyle}>
            <div className="AudioPlayer__controls__volume__slider__scrubber"></div>
          </div>
        </div>
      </div>
    </div>
    {/* <pre>{props.filename}</pre>
    <pre>{props.url}</pre> */}
  </div>;
}

AudioPlayer.propTypes = {
  filename: PropTypes.string,
  url: PropTypes.string
};

export default AudioPlayer;

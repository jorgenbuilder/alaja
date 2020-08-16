import React from "react";
import PropTypes from "prop-types"
import WaveformPlaylist from "waveform-playlist";
import EventEmitter from "event-emitter";
import { v4 as uuid } from 'uuid';

const PlayerConfig = {
    samplesPerPixel: 1000,
    // mono: true,
    waveHeight: 100,
    // container: document.getElementById("playlist"),
    state: "cursor",
    // timescale: true,
    colors: {
        waveOutlineColor: "#E0EFF1",
        timeColor: "grey",
        fadeColor: "black"
    },
    controls: {
        show: true,
        width: 200
    },
    zoomLevels: [500, 1000, 3000, 5000]
};

const DefaultGain = 0.3;

const AudioPlayerV3 = (props) => {
    let Player = React.useRef();
    let UUID = React.useRef(uuid());
    let PlayerID = `player-${UUID.current}`;

    let [time, setTime] = React.useState('00:00:00.0');

    const updateTime = setTime;

    React.useEffect(() => {
        let config = Object.assign({}, PlayerConfig, {
            mono: props.tracks.length === 1,
            container: document.getElementById(PlayerID),
        });
        Player.current = WaveformPlaylist(config, EventEmitter());
        Player.current.load(props.tracks.map(x => ({
            src: x.url,
            name: x.name,
            gain: DefaultGain,
        })))
        Player.current.ee.on("timeupdate", updateTime);
    }, []);

    const handlePlay = () => Player.current.ee.emit('play')
    const handlePause = () => Player.current.ee.emit('pause')
    const handleStop = () => Player.current.ee.emit('stop')

    return <div>
        <h3>{props.name}</h3>
        <div id="top-bar" className="playlist-top-bar">
            <div className="playlist-toolbar">
                <div className="btn-group">
                <span className="btn-pause btn btn-warning" onClick={handlePause}><i className="fa fa-pause"></i></span>
                <span className="btn-play btn btn-success" onClick={handlePlay}><i className="fa fa-play"></i></span>
                <span className="btn-stop btn btn-danger" onClick={handleStop}><i className="fa fa-stop"></i></span>
                <span className="btn-rewind btn btn-success"><i className="fa fa-fast-backward"></i></span>
                <span className="btn-fast-forward btn btn-success"><i className="fa fa-fast-forward"></i></span>
                </div>
                <span className="audio-pos">{time}</span>
            </div>
        </div>
        <div className="AudioPlayer v3" key={PlayerID} id={PlayerID}>
            {/* <!-- --> */}
        </div>
    </div>
}

AudioPlayerV3.propTypes = {
    name: PropTypes.string,
    tracks: PropTypes.arrayOf(
        PropTypes.shape({
            name: PropTypes.string,
            url: PropTypes.string,
        })
    ),
    annotation: PropTypes.string,
};

export default AudioPlayerV3;

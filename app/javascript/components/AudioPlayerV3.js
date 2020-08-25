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
    const Player = React.useRef();
    const UUID = React.useRef(uuid());
    const PlayerID = `player-${UUID.current}`;

    const [time, setTime] = React.useState('00:00:00.0');
    const [loaded, setLoaded] = React.useState(false);

    const load = () => {
        Player.current.load(props.tracks.map(x => ({
            src: x.url,
            name: x.name,
            gain: DefaultGain,
        }))).then(() => {
            Player.current.ee.emit('play');
        });
        setLoaded(true);
    }

    const clockFormat = (seconds, decimals=1) => {
        var hours,
            minutes,
            secs,
            result;
    
        hours = parseInt(seconds / 3600, 10) % 24;
        minutes = parseInt(seconds / 60, 10) % 60;
        secs = seconds % 60;
        secs = secs.toFixed(decimals);
    
        result = (hours < 10 ? "0" + hours : hours) + ":" + (minutes < 10 ? "0" + minutes : minutes) + ":" + (secs < 10 ? "0" + secs : secs);
    
        return result;
    }

    const updateTime = (time) => {
        setTime(clockFormat(time));
    };

    const seekAnnotation = (annotation) => {
        Player.current.ee.emit('play', annotation.start, annotation.end);
    };

    React.useEffect(() => {
        let annotation;
        try {
            annotation = JSON.parse(props.annotation);
        } catch (e) {
            annotation = false;
        }
        const annotationConfig = annotation ? {
            annotationList: {
                annotations: annotation,
                editable: false,
                linkEndpoints: false,
                isContinuousPlay: false,
                controls: [{
                    class: 'annotation-play',
                    title: '',
                    action: seekAnnotation,
                }],
            }
        } : {};
        const config = Object.assign({}, PlayerConfig, {
            mono: props.tracks.length === 1,
            container: document.getElementById(PlayerID),
        }, annotationConfig);
        Player.current = WaveformPlaylist(config, EventEmitter());
        Player.current.ee.on("timeupdate", updateTime);
    }, []);

    const handlePlay = () => {
        if (!loaded) {
            load();
        } else {
            Player.current.ee.emit('play');
        }
    }
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
                <span className="audio-pos">{time}</span> / {Player?.current ? clockFormat(Player.current.duration) : '00:00:00.0'}
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

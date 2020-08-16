class AudioRecordingTracksController < ApplicationController
  before_action :set_audio_recording_track, only: [:show, :edit, :update, :destroy]

  # GET /audio_recording_tracks
  # GET /audio_recording_tracks.json
  def index
    @audio_recording_tracks = AudioRecordingTrack.all
  end

  # GET /audio_recording_tracks/1
  # GET /audio_recording_tracks/1.json
  def show
  end

  # GET /audio_recording_tracks/new
  def new
    @audio_recording_track = AudioRecordingTrack.new
  end

  # GET /audio_recording_tracks/1/edit
  def edit
  end

  # POST /audio_recording_tracks
  # POST /audio_recording_tracks.json
  def create
    @audio_recording_track = AudioRecordingTrack.new(audio_recording_track_params)

    respond_to do |format|
      if @audio_recording_track.save
        format.html { redirect_to @audio_recording_track, notice: 'Audio recording track was successfully created.' }
        format.json { render :show, status: :created, location: @audio_recording_track }
      else
        format.html { render :new }
        format.json { render json: @audio_recording_track.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /audio_recording_tracks/1
  # PATCH/PUT /audio_recording_tracks/1.json
  def update
    respond_to do |format|
      if @audio_recording_track.update(audio_recording_track_params)
        format.html { redirect_to @audio_recording_track, notice: 'Audio recording track was successfully updated.' }
        format.json { render :show, status: :ok, location: @audio_recording_track }
      else
        format.html { render :edit }
        format.json { render json: @audio_recording_track.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /audio_recording_tracks/1
  # DELETE /audio_recording_tracks/1.json
  def destroy
    @audio_recording_track.destroy
    respond_to do |format|
      format.html { redirect_to audio_recording_tracks_url, notice: 'Audio recording track was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_audio_recording_track
      @audio_recording_track = AudioRecordingTrack.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def audio_recording_track_params
      params.require(:audio_recording_track).permit(:name, :audio_file, :audio_recording_id)
    end
end

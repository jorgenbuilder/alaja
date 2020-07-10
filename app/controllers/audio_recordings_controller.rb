class AudioRecordingsController < ApplicationController
  before_action :set_audio_recording, only: [:show, :edit, :update, :destroy]

  # GET /audio_recordings
  # GET /audio_recordings.json
  def index
    @audio_recordings = AudioRecording.all
  end

  # GET /audio_recordings/1
  # GET /audio_recordings/1.json
  def show
  end

  # GET /audio_recordings/new
  def new
    @audio_recording = AudioRecording.new
  end

  # GET /audio_recordings/1/edit
  def edit
  end

  # POST /audio_recordings
  # POST /audio_recordings.json
  def create
    @audio_recording = AudioRecording.new(audio_recording_params)

    respond_to do |format|
      if @audio_recording.save
        format.html { redirect_to @audio_recording, notice: 'Audio recording was successfully created.' }
        format.json { render :show, status: :created, location: @audio_recording }
      else
        format.html { render :new }
        format.json { render json: @audio_recording.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /audio_recordings/1
  # PATCH/PUT /audio_recordings/1.json
  def update
    respond_to do |format|
      if @audio_recording.update(audio_recording_params)
        format.html { redirect_to @audio_recording, notice: 'Audio recording was successfully updated.' }
        format.json { render :show, status: :ok, location: @audio_recording }
      else
        format.html { render :edit }
        format.json { render json: @audio_recording.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /audio_recordings/1
  # DELETE /audio_recordings/1.json
  def destroy
    @audio_recording.destroy
    respond_to do |format|
      format.html { redirect_to audio_recordings_url, notice: 'Audio recording was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_audio_recording
      @audio_recording = AudioRecording.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def audio_recording_params
      params.require(:audio_recording).permit(:date, :name, :text_log, :file_url)
    end
end

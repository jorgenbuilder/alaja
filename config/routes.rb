Rails.application.routes.draw do
  resources :audio_recording_tracks
  resources :audio_recordings
  resources :band_names
  resources :songs
  resources :sessions
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'pages#home'
end

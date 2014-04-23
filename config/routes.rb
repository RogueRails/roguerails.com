Roguerails::Application.routes.draw do
  root to: 'pages#stay_tuned'
  # get "/:id", to: "pages#show"
  match '2013' => 'pages#2013'
  match 'dev_survey' => 'pages#dev_survey'
  match 'attendee_info' => 'pages#attendee_info'
  match 'schedule' => 'pages#schedule'
  match 'eventapp' => 'pages#eventapp'
  match 'playbook' => 'pages#playbook'
  match 'agile_process' => 'pages#agile_process'
  match 'tdd' => 'pages#tdd'
end

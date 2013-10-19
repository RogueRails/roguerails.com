Roguerails::Application.routes.draw do
  root to: 'pages#show'
  # get "/:id", to: "pages#show"
  match 'dev_survey' => 'pages#dev_survey'
  match 'attendee_info' => 'pages#attendee_info'
  match 'schedule' => 'pages#schedule'
end

# frozen_string_literal: true

# Below are the routes for madmin
namespace :madmin do
  resources :course_categories
  namespace :active_storage do
    resources :attachments
  end
  namespace :active_storage do
    resources :variant_records
  end
  namespace :active_storage do
    resources :blobs
  end
  namespace :action_mailbox do
    resources :inbound_emails
  end
  resources :posts
  resources :users
  namespace :action_text do
    resources :encrypted_rich_texts
  end
  namespace :action_text do
    resources :rich_texts
  end
  root to: 'dashboard#show'
end

# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Pages', type: :request do
  describe 'GET /welcome' do
    it 'returns http success' do
      get '/pages/welcome'
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET /privacy' do
    it 'returns http success' do
      get '/pages/privacy'
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET /terms' do
    it 'returns http success' do
      get '/pages/terms'
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET /about' do
    it 'returns http success' do
      get '/pages/about'
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET /sitemap' do
    it 'returns http success' do
      get '/pages/sitemap'
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET /remote' do
    it 'returns http success' do
      get '/pages/remote'
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET /prevent_email' do
    it 'returns http success' do
      get '/pages/prevent_email'
      expect(response).to have_http_status(:success)
    end
  end
end

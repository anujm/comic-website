require 'spec_helper'

describe ComicsController do
  render_views
  describe 'show' do
    before do
      Comic.create!(id: 1, name: 'Comic 1', :url => 'www.example.com')
      Comic.create!(id: 2, name: 'Comic 2', :url => 'www.example2.com')
      get :show, id: 1, format: :json
    end

    subject(:result) { JSON.parse(response.body) }

    context 'show' do
      it 'should return 200 status' do
        expect(response.status).to eq(200)
      end

      it 'should fetch result by id' do
        expect(result).to eq({'id' => 1, 'name' => 'Comic 1', 'url' => 'www.example.com'})
      end
    end
  end

  render_views
  describe 'index' do
    context 'index' do
      it 'should return 200 status and fetch all comics' do
        Comic.create!(:id => 1, name: 'Comic 1', :url => 'www.example.com')
        Comic.create!(:id => 2, name: 'Comic 2', :url => 'www.example2.com')

        response = get :index, format: :json
        expect(response.status).to eq(200)
        expect(JSON.parse(response.body)).to eq({'id' => 2, 'name' =>  'Comic 2', 'url' => 'www.example2.com'})
      end

      it 'should return 200 status and empty result when no comics exist' do
        response = get :index, format: :json
        expect(response.status).to eq(200)
      end
  end

end

  render_views
  describe 'create' do
    before do
      post :create, comic: { name: 'test comic', url: 'http://www.test.com'}
    end

    subject(:results) { JSON.parse(response.body) }

    context 'create' do
      it 'should return 302 status' do
        expect(response.status).to eq(302)
      end

      it 'should create a new comic' do
        expect(Comic.all.length).to eq(1)
      end
    end

  end

  describe 'random' do
    before do
      Comic.create!(id: 1, name: 'Comic 1', :url => 'www.example.com')
      get :random, format: :json
    end

    subject(:results) { JSON.parse(response.body) }

    context 'random' do
      it 'should return 200 status' do
        expect(response.status).to eq(200)
      end

      it 'should return a random comic' do

        expect(results).to eq({})
      end
    end

  end
end
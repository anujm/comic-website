require 'spec_helper'

describe ComicsController do
  render_views
  describe 'show' do
    before do
      Comic.create!(id: 1, name: 'Comic 1')
      Comic.create!(id: 2, name: 'Comic 2')
      xhr :get, :show, id: 1, format: :json
    end

    subject(:result) { JSON.parse(response.body) }

    context 'show' do
      it 'should return 200 status' do
        expect(response.status).to eq(200)
      end

      it 'should fetch result by id' do
        expect(result).to eq({'name' => 'Comic 1'})
      end
    end

  end

  render_views
  describe 'index' do
    before do
      Comic.create!(name: 'Comic 1')
      Comic.create!(name: 'Comic 2')

      xhr :get, :index, format: :json
   end

    subject(:results) { JSON.parse(response.body) }

    context 'index' do
      it 'should return 200 status' do
        expect(response.status).to eq(200)
      end

      it 'should fetch all comics' do
        expect(results.size).to eq(2)
        expect(results).to eq([{'name' =>  'Comic 1'}, {'name' => 'Comic 2'}])
      end
    end

  end
end
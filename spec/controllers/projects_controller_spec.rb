require 'rails_helper'

describe ProjectsController do
  describe 'GET #new' do
    it "renders the :new template" do
      get :new
      expect(response).to render_template :new
    end
  end

  describe 'GET #edit' do
    it "assigns the requested project to @project" do
      project = create(:project)
      get :edit, params: { id: project }
      expect(assigns(:project)).to eq project
    end

    it "renders the :edit template" do
      project = create(:project)
      get :edit, params: { id: project }
      expect(response).to render_template :edit
    end
  end

  describe 'GET #index' do
    it "populates an array of projects ordered by created_at DESC" do
      projects = create_list(:project, 3) 
      get :index
      expect(assigns(:projects)).to match(projects)
    end

    it "renders the :index template" do
    end
  end

end
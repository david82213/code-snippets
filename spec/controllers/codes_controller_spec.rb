require 'rails_helper'

RSpec.describe CodesController, type: :controller do
  let(:user) {create(:user)}
  
  # .............  Index .............................
  describe '#index' do
    it 'renders the code index page' do
      get :index
      expect(response).to render_template(:index)
    end
  end
  
  # ..............End of Index .................
  
  
  #................Create ......................
  describe '#create' do
    context 'with valid params' do
      def valid_request
        post :create, params:{code: attributes_for(:code)}
      end
      
      it 'saves a record to the database' do
        count_before = Code.count
        valid_request
        count_after = Code.count
        expect(count_after).to eq(count_before+1)
      end

      it 'redirects to the campaign show page' do
        valid_request
        expect(response).to redirect_to(code_path(Code.last))
      end
      
    end
    
    context 'with invalid params' do
      def invalid_request
        post :create, params:{code: attributes_for(:code, title: nil)}
      end
      
      it 'doesn\'t save a new record to the database' do
        count_before = Code.count
        invalid_request
        count_after = Code.count
        
        expect(count_after).to eq(count_before)
      end
      
      it 'renders the new page' do
        invalid_request
        expect(response).to render_template(:index)
      end
    end
  end
  # ............. Enf of Create ................
  
  # .............. Show .........................
  describe '#show' do
    
    context 'user logged in ' do
      
      before { request.session[:user_id] = user.id }
      
      it 'renders the show code page' do
        c = create :code
        get :show, params: {id: c.id}
        expect(response).to render_template(:show)
      end
      
    end
    
    context 'user not logged in' do
      it 'redirect user to log in page' do
        c = create :code
        get :show, params:{id: c.id}
        expect(response).to redirect_to(new_session_path)
      end
    end
  end
  
  # ............End of Show ...................
  
  # ............. Edit ........................
  describe '#edit' do
    context 'user logged in' do
      before { request.session[:user_id] = user.id }
      it 'redirect to the edit code page' do
        c = create :code
        get :edit, params: {id: c.id}
        expect(response).to render_template(:edit)
      end
      
      it 'displays code info and enable editing' do
        c = create :code
        get :edit, params:{id: c.id}
        expect(assigns(:code)).to eq(c)
      end
      
      it 'requires current user to be the code creater'
    end
    
    
    context 'user not logged in' do
      it 'redirect user to login page' do
        c = create :code
        get :edit, params:{id: c.id}
        expect(response).to redirect_to(new_session_path)
      end
    end
  end
  
  # ...............End of Edit ................
  
  # ..............  Update ...................
  describe '#update' do
    context 'update with valid params'do
      it 'saves the updats to the database' do
        c = create :code
        patch :update, params:{id: c.id, code:{title:'A new title'}}
        expect(Code.last.title).to eq('A new title')
      end
      
      it 'redirect to the product page' do
        c = create :code
        patch :update, params:{id: c.id, code:{title:'A new title'}}
        expect(response).to redirect_to(code_path(Code.last))
      end
    end
    
    context 'update with invalid params' do
      it 'doesn\'t save changes to the database' do
        c = create :code
        patch :update, params:{id: c.id, code:{title: nil}}
        expect(Code.last.title).to eq(c.title)
      end
      
      it 'renders the edit page' do
        c = create :code
        patch :update, params:{id: c.id, code:{title: nil}}
        expect(response).to render_template(:edit, id: c.id)
      end
    end
  end
  #.............. End of Update ..............
  
  #............... Destroy ...................
  describe '#destroy' do
    it 'deletes the selected code' do
      c = create :code 
      delete :destroy, params: {id: c.id}
      expect(Code.count).to eq(0)
    end
  end
  
  # .............. End of Destroy ............
end

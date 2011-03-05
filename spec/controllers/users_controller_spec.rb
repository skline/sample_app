require 'spec_helper' 
  describe UsersController do
    render_views
     
    describe "GET 'show'" do
      before( :each) do
        @attr = { 
                  :name => "Example User", 
                  :email => "user@example.com",
                  :password => "foobar",
                  :password_confirmation => "foobar"
                   }  
        @user = User.create!(@attr)
      end
      
      
      it "should be succesful" do
        get :show, :id => @user.id
        response.should be_success
      end
      
       it "should find the right users" do
         get :show, :id => @user
         assigns(:user).should === @user
     end   
   
    
    it "should have the right title" do
      get :show, :id => @user
      response.should have_selector('h1', :content =>  @user.name )
    end
    
    it "should have a profile image" do
      get :show, :id => @user
      response.should have_selector('h1>img', :class => "gravatar")
    end
   end 
    
    describe "GET 'new'" do
      
      it "should be successful" do
        get 'new'
        response.should be_success 
      end
      
      it "should have the right title" do 
        get 'new' 
        response.should have_selector("title", :content => "Sign up")
      end 
    end
  end





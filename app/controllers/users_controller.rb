class UsersController < ApplicationController
  def new
     @user = User.new
   end

   def create
     @user = User.new
     @user.name =                  params[:user][:name]
     @user.email =                 params[:user][:email]
     @user.password =              params[:user][:password]
     @user.password_confirmation = params[:user][:password_confirmation]

     if @user.save
       flash[:notice] = "Welcome to Blocipedia, #{@user.name}!"
       redirect_to root_path
     else
       flash[:error] = "There was an error creating your account. Please try again."
       render :new
     end
   end

   def update
     @user = User.find(params[:id])
     @user.role = 'standard'

     if @user.save
       flash[:notice] = "You've been downgraded to standard. Your private wikis are now public."
       publicize_wikis
       redirect_to :back
     else
       flash[:error] = "There was an error creating your account. Please try again."
       redirect_to :back
     end
   end



   def index
     @users = User.all
   end

   def show
   end


 private

 def publicize_wikis
     current_user.wikis.each do |wiki|
      wiki.update_attribute(:private, false)
     end
   end

end

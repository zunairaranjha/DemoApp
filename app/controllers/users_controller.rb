class UsersController < ApplicationController
def index
  puts "#{client_ip}"
end

def client_ip
         
  client_params = user_params
  client_params['ip'] = request.remote_ip
  user=User.new(client_params)
  render json: user
  puts "#{params}"

      if user.save 
            session[:user_id]= user.id
            redirect_to '/posts'
        else 
            flash[:register_errors] = user.errors.full_messages
            redirect_to '/'
        end


end
private 
def user_params
   params.require(:user).permit(:id, :email,:encypted_password)
end     
end

class PasswordController < ApplicationController
    def check

        cookies[:username] = params[:username] unless params[:username].nil?
        @userID = cookies[:username]

        @password = params[:password] unless params[:password].nil?


        if @password.length < 6
            flash.now[:notice] = "Password must be greater than six characters."
        else
            cookies[:password] = @password


        end
    end

end

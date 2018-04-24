class PasswordController < ApplicationController
    def check

        cookies[:username] = params[:username] unless params[:username].nil?
        @userID = cookies[:username]

        @password = params[:password] unless params[:password].nil?


        if @password.length < 6
            flash.now[:notice] = "Password must be greater than six characters."

        elsif !@password.match(/^(?=.*[A-Z])./)
            flash.now[:notice] = "Password must include at least one capital case character."
        # elsif !@password.include? "A..Z"
        #     flash.now[:notice] = "Password must include at least one capital case character."
        elsif !@password.match(/^(?=.*[a-z])./)
            flash.now[:notice] = "Password must include at least one lower case character."
        # elsif !@password.include? "a..z"
        #     flash.now[:notice] = "Password must include at least one lower case character."
        elsif !@password.match(/^(?=.*[0-9])./)
            flash.now[:notice] = "Password must include at least one numeric character."
        # elsif !@password.include? "0..9"
        #     flash.now[:notice] = "Password must include at least one numeric character."
        else
            cookies[:password] = @password

        end
    end

end

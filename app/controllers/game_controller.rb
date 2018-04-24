class GameController < ApplicationController
    def try
    cookies[:secret_num] = rand(100) unless cookies[:secret_num]
    cookies[:tries] = 6 unless cookies[:tries]
    @secret_num = cookies[:secret_num].to_i
    @guess_num = params[:guess].to_i
    @tries = cookies[:tries].to_i

        if @tries > 0
          if @guess_num < @secret_num
              flash.now[:notice] = "Your guess is too low"
              cookies[:tries] = @tries - 1
          elsif @guess_num > @secret_num
              flash.now[:notice] = "Your guess is too high"
              cookies[:tries] = @tries - 1
          else
              flash.now[:notice] = "You got it!"
              cookies[:tries] = @tries - 1
              cookies.clear
          end
        else
          flash.now[:notice] = "You lose! Loser!"
          cookies.clear
        end
    end

    def restart
    cookies.clear
    end
end

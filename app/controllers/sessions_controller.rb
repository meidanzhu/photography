class SessionsController < ApplicationController
#login user, logout user, omniauth
def omniauth
    #log users in from omniauth
    #binding.pry
    User.finder_or_create_by(uid: auth['uid'], provider: auth['provider']) do |user|
        user.username = auth['info']['first_name']
        user.email = auth['info']['email']
    end
end
end
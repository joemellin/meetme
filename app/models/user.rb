class User < ActiveRecord::Base

  def self.create_with_omniauth(auth)
    create! do |user|
      user.provider = auth['provider']
      user.uid = auth['uid']
      if auth['info']
         user.name = auth['info']['name'] || ""
         user.email = auth['info']['email'] || ""
         user.image = auth['info']['image'] || ""
         user.location = auth['info']['location'] || ""
         user.fburl = auth['info']['urls']['Facebook'] || ""
      end
    end
  end

end

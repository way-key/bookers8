class Users::RegistrationsController < Devise::RegistrationsController #deviseの該当クラスを継承させる
  def create
    super do
      resource.update(confirmed_at: Time .now.utc)       # Welcomeメールを送信した上で、skip_confirmation!と同一処理を行い自動で認証クローズさせる
      #↓と同じ意味になる。
      # resource.skip_confirmation!
      # resource.save
    end
  end
end
class User < ApplicationRecord
    has_many :created_requests, foreign_key: "creator_id", class_name: "Request", dependent: :destroy

    has_many :request_applications
    has_many :applied_requests, through: :request_applications, dependent: :destroy

    attr_accessor :remember_token
    before_save { self.email = email.downcase }
    validates(:username, presence: true, length: {:maximum => 50})
    validates(:name, presence: true, length: {:maximum => 50})
    validates(:birthdate, presence: true)
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
    validates(:email, presence: true, length: {:maximum => 255}, 
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false })
    has_secure_password
    validates(:password, presence: true, length: { minimum: 6 }, allow_nil: true)

    # 渡された文字列のハッシュ値を返す
    def self.digest(string)
        cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                                    BCrypt::Engine.cost
        BCrypt::Password.create(string, cost: cost)
    end

    # ランダムなトークンを返す
    def self.new_token
        SecureRandom.urlsafe_base64
    end

    #永続セッションのためにユーザーをデータベースに記憶する
    def remember
      self.remember_token = User.new_token
      update_attribute(:remember_digest, User.digest(remember_token))
    end

    # 渡されたトークンがダイジェストと一致したらtrueを返す
    def authenticated?(remember_token)
        return false if remember_digest.nil?
        BCrypt::Password.new(self.remember_digest).is_password?(remember_token)
    end

    # ユーザーのログイン情報を破棄する
    def forget
        update_attribute(:remember_digest, nil)
    end

    # 履歴書の登録状況を確認する
    def resume_registered?
        true

        #self.resume,nil?
    end

    # このリクエストへの応募情報を確認する
    def applied?(request)
        
    end
end

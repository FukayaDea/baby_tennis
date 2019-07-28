class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable, :omniauthable, omniauth_providers: %i[facebook twitter google_oauth2]

  # omniauthのコールバック時に呼ばれるメソッド
  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email
      user.nickname = auth.info.name
      user.password = Devise.friendly_token[0,20]
      user.over20 = 1
    end
  end

  has_many :events, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :commented_events, through: :comments, source: :event, dependent: :destroy
  
  # グループテーブル　リレーション
  has_many :event_groups, through: :events, source: :group, dependent: :destroy
  has_many :event_comments, dependent: :destroy
  has_many :like_events, dependent: :destroy
  has_many :liked_events, through: :like_events, source: :event
  has_many :chats, dependent: :destroy
  has_many :tennis_infos, dependent: :destroy
  has_many :diaries, dependent: :destroy
  has_many :like_chats, dependent: :destroy
  has_many :liked_chats, through: :like_chats, source: :chat
  def already_liked_c?(chat)
    self.like_chats.exists?(chat_id: chat.id)
  end

  has_many :like_diaries, dependent: :destroy
  has_many :liked_diaries, through: :like_diaries, source: :diary
  def already_liked_d?(diary)
    self.like_diaries.exists?(diary_id: diary.id)
  end

  has_many :like_infos, dependent: :destroy
  has_many :liked_infos, through: :like_infos, source: :tennis_info
  def already_liked?(info)
    self.like_infos.exists?(tennis_info_id: info.id)
  end

  has_one_attached :image, dependent: :destroy

  validates :nickname, :over20, presence: true
  
  validates :nickname, uniqueness: true

  validate :password_complexity
  def password_complexity
    return if password.blank? || password =~ /^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9]).{8,70}$/
    errors.add :password, "パスワードの強度が不足しています。パスワードの長さは8〜70文字とし、大文字と小文字と数字をそれぞれ1文字以上含める必要があります。"
  end
end

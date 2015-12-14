class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  

has_many :orders, dependent: :destroy
has_many :my_follows, dependent: :destroy
has_many :item_follows, through: :my_follows, source: :product
# has_one :myfollow, dependent: :destroy
# has_many :products, through: :myfollows
  def admin?
    is_admin
  end

  def to_normal
    self.update_columns(is_admin: false)
  end

  def to_admin
    self.update_columns(is_admin: true)
  end

  def add_product_to_follow(product)
    item_follows << product
  end

end

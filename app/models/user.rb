class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable



  def role_enum
	[ [ 'NO Definido', '1' ], [ 'USER', '2' ], [ 'ADMIN', '3' ] ]
  end

  after_initialize :set_default_role, :if => :new_record?
  def set_default_role
    self.role ||= 2
    
  end

  def title
    username.try(:[], 0..20)
  end
  def name
    username.try(:[], 0..20)#(:split, '@').try(:first).try(:humanize)
  end
end

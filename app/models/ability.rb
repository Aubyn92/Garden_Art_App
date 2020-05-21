class Ability
  include CanCan::Ability 

  def initialize(user)
    user ||= User.new 
    can [:index, :show, :new, :create], Listing 
    can [:edit, :update, :destroy], Listing, user_id: user.id
    if user.try(:admin) && user.admin #admin rights of access as opposed to user rights of access as outlayed above
      can [:index, :show, :new, :create, :destroy, :edit, :update], Listing
    end
  end
end
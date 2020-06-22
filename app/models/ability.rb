# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    can :read, Post

    if user.present?
        can :show, User, id: user.id
        if user.has_role? :admin
            can :access, :rails_admin
            can :read, :dashboard
            can :manage,[User, Post, Comment]
        end

    end
  end
end

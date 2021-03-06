RailsAdmin.config do |config|

  ### Popular gems integration

  ## == Devise ==
  config.authenticate_with do
    warden.authenticate! scope: :user
  end
  config.current_user_method(&:current_user)

  ## == CancanCan ==
  config.authorize_with :cancancan

  ## == Pundit ==
  # config.authorize_with :pundit

  ## == PaperTrail ==
  # config.audit_with :paper_trail, 'User', 'PaperTrail::Version' # PaperTrail >= 3.0.0

  ### More at https://github.com/sferik/rails_admin/wiki/Base-configuration

  ## == Gravatar integration ==
  ## To disable Gravatar integration in Navigation Bar set to false
  # config.show_gravatar = true

  config.actions do
    dashboard                     # mandatory
    index                         # mandatory
    new
    export
    bulk_delete
    show
    edit
    delete
    show_in_app

    ## With an audit adapter, you can add:
    # history_index
    # history_show
  end

  config.default_items_per_page = Settings.RAILS_ADMIN_PAGINATION

  config.model 'User' do
    list do
      field :id do
        sort_reverse false
      end
      field :id
      field :name
      field :email
      field :created_at
    end

    edit do
      configure :schedule do
        hide
      end
    end

    show do
      configure :schedule do
        hide
      end
    end
  end

  config.model 'Post' do
    list do
      field :id do
        sort_reverse false
      end
      field :title
      field :book_name
      field :content
      # field :user_name
      field :created_at
    end

    edit do
      configure :service do
        hide
      end
    end

    show do
      configure :service do
        hide
      end
    end
  end

  config.model 'Comment' do
    list do
      field :id do
        sort_reverse false
      end
      #field :user_name
      field :post_id
      field :content
      field :created_at
    end

    edit do
      configure :service do
        hide
      end
    end

    show do
      configure :service do
        hide
      end
    end
  end
end

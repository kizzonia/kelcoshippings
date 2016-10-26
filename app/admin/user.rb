ActiveAdmin.register User do

    form do |f|
      f.inputs "User Details" do
        f.input :email
        f.input :password
        f.input :password_confirmation
        f.input :superadmin, :label => "Super Administrator"
      end
      f.actions
    end

    create_or_edit = Proc.new {
      @user            = User.new(params[:id])
      @user.superadmin = params[:user][:superadmin]

      if @user.save
        redirect_to @user
      else
        render 'new'
      end
    }
    member_action :create, :method => :post, &create_or_edit

    def update
        @user = User.find(params[:id])
        if @post.update(params[:user].permit(:email, :password, :password_confirmation, :superadmin))
          redirect_to @user
        end
      end

    def user_params
    	params.require(:user).permit(:email, :password, :password_confirmation, :superadmin)
    end
  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
   permit_params :list, :of, :attributes, :on, :model
  #
  # or
  #
  # permit_params do
  #   permitted = [:permitted, :attributes]
  #   permitted << :other if resource.something?
  #   permitted
  # end


end

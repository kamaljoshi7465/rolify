module Api 
    module V1 

        class AccountsController < ApplicationController
            # before_action only: %i[ show edit update destroy ]
        
            def index
                render json: Account.all 
            end
        
            def show
                render json: Account.find(params[:id])
            end
        
            def new
                render json: Account.new
            end
        
            def edit
            end
        
            def create
                @account = Account.new(params[:id])

                if @account.save
                    render json: @account, status: :created
                else
                    render json: @account.errors, status: :unprocessable_entity
                end
            end
        
            def update
                @account = Account.find(params[:id])
                if @account.update(account_params)
                    render json: "Succesfully updated"
                else
                  render json: @account.errors, status: :unprocessable_entity
                end
            end

            def destroy
                @account = Account.find(params[:id])
                @account.destroy
                render json: "Succesfully deleted"
            end
        
            private

            def account_params
                params.permit(:name, :branch)
            end
        end
    end 
end
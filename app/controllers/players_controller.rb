class PlayersController < ApplicationController
    before_action :find_match, only:[:show, :edit, :update, :destroy]

    # belongs_to :team_a, class_name: "Team"
    # belongs_to :team_b, class_name: "Team"

    #show /show all page
    def index
        @player = Player.all
    end
    
    #Get /create action
    def create 
        @player = Player.new(name: params[:player][:name], player_number: params[:player][:player_number])
        if @player.valid?
            @player.save
            redirect_to player_path(@player.id)
        else
            @errors = @player.errors.full_messages
            render :new    
        end    
    end
    
    #Get /render new form
    def new
        @player = Player.new
    end
    
    #Get /edit form 
    def edit
    end
    
    #Get /read action for a single object
    def show 
    end 
    
    #Get /update action
    def update
    end 
    
    #Get /destroy action
    def destroy 
        @player.destroy
        redirect_to players_path
    end

    private
    def find_match
        @player = Player.find(params[:id])
    end
end

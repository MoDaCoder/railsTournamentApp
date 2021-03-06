class MatchesController < ApplicationController
    before_action :find_match, only:[:show, :edit, :update, :destroy]
    #show /show all page
    def index
        @match = Match.all
    end

    #Get /read action for a single object
    def show 
    end         

    #Get /create action
    def create 
        @match = Match.new(match_params)
        # @match = Match.new(match_number: params[:match][:match_number], match_date: params[:match][:match_date] )
        if @match.valid?
            @match.save
            redirect_to match_path(@match.id)
        else
            @errors = @match.errors.full_messages
            render :new
        end
    end

    #Get /render new form
    def new
        @match = Match.new
        4.times{@match.players.build}
    end

    #Get /edit form 
    def edit
    end

    #Get /update action
    def update
        @match.update(params.require(:match).permit(:match_number, :match_date))
        redirect_to match_path(@match.id)    
    end 

    #Get /destroy action
    def destroy 
        # byebug
        @match.destroy
        redirect_to matches_path
    end

    private
    def match_params
        params.require(:match).permit(:match_number, :match_date, players_attributes:[:id, :name, :player_number])
    end

    def find_match
        @match = Match.find(params[:id])
    end
    
end

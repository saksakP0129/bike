class DiariesController < ApplicationController
    before_action :set_diary, only: [:edit, :show]
    before_action :move_to_index, except: [:index, :show, :search]

    def index
        @diaries= Diary
        .includes(:user).order("created_at DESC").page(params[:page]).per(5)  
    end

    def new
        @diary = Diary.new
    end
  
    def create
        Diary.create(diary_params)
        redirect_to diaries_path
    end

    def show
        @diaries = Diary.page(params[:page]).per(5) .order("created_at DESC")
    end

    def edit
        @diary = Diary.find(params[:id])
      end
    
      def update
        diary = Diary.find(params[:id])
        diary.update(diary_params)
        redirect_to diary_path(diary.id)
      end
    
      def destroy
        diary = Diary.find(params[:id])
        diary.destroy
        redirect_to diaries_path
      end

    def search
        @diaries = Diary.search(params[:keyword])
        redirect_to search_diaries_path
    end
    
    private
    def diary_params
          params.require(:diary).permit(:image, :text, :title).merge(user_id: current_user.id)
    end

    def set_diary
        @diary = Diary.find(params[:id])
    end
    
    def move_to_index
        redirect_to action: :index unless user_signed_in?
      end
    end


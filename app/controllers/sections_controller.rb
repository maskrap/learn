class SectionsController < ApplicationController

  def index
    @section = Section.all
  end

  def new
    @section = Section.new
  end

  def show
    @section = Section.find(params[:id])
  end

  def create
    @section = Section.new(section_params)
    if @section.save
      redirect_to section_path(@section.id)
    else
      render :new
    end
  end

  def edit
    @section = Section.find(params[:id])
  end

  def update
    @section = Section.find(params[:id])
    if @section.update(section_params)
      redirect_to section_path
    else
      render :edit
    end
  end

  def destroy
    @section = Section.find(params[:id])
    @section.destroy
    redirect_to section_index_path
  end

  private
    def section_params
      params.require(:section).permit(:name, :chapter_id, :lesson_id)
    end
end

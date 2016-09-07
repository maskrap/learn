class SectionsController < ApplicationController
  def new
    @chapter = Chapter.find(params[:chapter_id])
    @section = @chapter.sections.new
    @lessons = Lesson.all
  end

  def create
    @chapter = Chapter.find(params[:chapter_id])
    @section = @chapter.sections.new(section_params)
    if @section.save
      redirect_to chapter_path(@section.chapter)
    else
      render :new
    end
  end

  def edit
    @chapter = Chapter.find(params[:chapter_id])
    @section = Section.find(params[:id])
  end

  def update
    @chapter = Chapter.find(params[:id])
    @section = Section.find(params[:id])
    if @section.update(section)
      flash[:notice] = "Section updated!"
      redirect_to chapters_path(@section.chapter)
    else
      render :edit
    end
  end

  def destroy
    @section = Section.find(params[:id])
    @section.destroy
    flash[:notice] = "Section deleted"
    redirect_to chapters_path
  end

  private
    def section_params
      params.require(:section).permit(:name)
    end
end

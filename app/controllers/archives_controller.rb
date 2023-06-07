class ArchivesController < ApplicationController
  load_and_authorize_resource

  add_breadcrumb 'Archives', :archives_path

  def index
  end

  def show
    add_breadcrumb @archive
  end

  def secret
    redirect_to @archive unless can? :secret, @archive
    add_breadcrumb @archive, @archive
    add_breadcrumb 'Secret'
  end
  
  def new
    add_breadcrumb 'Créer une archive'
  end

  def edit
    add_breadcrumb @archive, @archive
    add_breadcrumb 'Modifier'
  end

  def create
    @archive = Archive.new(archive_params)

    respond_to do |format|
      if @archive.save
        format.html { redirect_to archive_url(@archive), notice: "Archive was successfully created." }
        format.json { render :show, status: :created, location: @archive }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @archive.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @archive.update(archive_params)
        format.html { redirect_to archive_url(@archive), notice: "Archive was successfully updated." }
        format.json { render :show, status: :ok, location: @archive }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @archive.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @archive.destroy

    respond_to do |format|
      format.html { redirect_to archives_url, notice: "Archive was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_archive
      @archive = Archive.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def archive_params
      params.require(:archive).permit(:name, :organisation_id, :url, :description)
    end
end

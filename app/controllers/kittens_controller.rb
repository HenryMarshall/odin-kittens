class KittensController < ApplicationController

  def index
    @kittens = Kitten.all
  end

  def show
    @kitten = Kitten.find(params[:id])
  end

  def new
    @kitten = Kitten.new
  end

  def create
    kitten = Kitten.new kitten_params
    if kitten.save
      redirect_to kitten
    else
      flash.now[:error] = "Could not create kitten"
      render 'new'
    end
  end

  def edit
    @kitten = Kitten.find(params[:id])
  end

  def update
    kitten = Kitten.find(params[:id])
    kitten.update! kitten_params
    redirect_to kitten
  end

  def destroy
    kitten = Kitten.find(params[:id]).destroy
    redirect_to kittens_path, "#{kitten.name} has been deleted"
  end

  private

    def kitten_params
      params.require(:kitten).permit(:name, :age, :cuteness, :softness)
    end

end
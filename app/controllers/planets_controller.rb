class PlanetsController < ApplicationController
  before_action :set_planet, only: [:show, :edit, :update, :destroy]

  # GET /planets
  # GET /planets.json
  def index
    @planets = Planet.all
  end

  # GET /planets/1
  # GET /planets/1.json
  def show
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_planet
      @planet = Planet.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def planet_params
      params.require(:planet).permit(:loc_rowid, :pl_hostname, :pl_letter, :pl_name, :pl_controvflag, :pl_pnum, :pl_orbper, :pl_orbsmax, :pl_orbeccen, :pl_orbincl, :pl_bmassj, :pl_radj, :pl_dens, :pl_nnotes, :st_dist, :gaia_dist, :st_optmag, :st_optband, :gaia_gmag, :st_teff, :st_mass, :st_rad, :rowupdate, :pl_eqt, :pl_masse, :pl_ratdor, :pl_ratror, :pl_status, :pl_mnum, :pl_publ_date)
    end
end

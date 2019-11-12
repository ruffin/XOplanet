require 'test_helper'

class PlanetsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @planet = planets(:one)
  end

  test "should get index" do
    get planets_url
    assert_response :success
  end

  test "should get new" do
    get new_planet_url
    assert_response :success
  end

  test "should create planet" do
    assert_difference('Planet.count') do
      post planets_url, params: { planet: { gaia_dist: @planet.gaia_dist, gaia_gmag: @planet.gaia_gmag, loc_rowid: @planet.loc_rowid, pl_bmassj: @planet.pl_bmassj, pl_controvflag: @planet.pl_controvflag, pl_dens: @planet.pl_dens, pl_eqt: @planet.pl_eqt, pl_hostname: @planet.pl_hostname, pl_letter: @planet.pl_letter, pl_masse: @planet.pl_masse, pl_mnum: @planet.pl_mnum, pl_name: @planet.pl_name, pl_nnotes: @planet.pl_nnotes, pl_orbeccen: @planet.pl_orbeccen, pl_orbincl: @planet.pl_orbincl, pl_orbper: @planet.pl_orbper, pl_orbsmax: @planet.pl_orbsmax, pl_pnum: @planet.pl_pnum, pl_publ_date: @planet.pl_publ_date, pl_radj: @planet.pl_radj, pl_ratdor: @planet.pl_ratdor, pl_ratror: @planet.pl_ratror, pl_status: @planet.pl_status, rowupdate: @planet.rowupdate, st_dist: @planet.st_dist, st_mass: @planet.st_mass, st_optband: @planet.st_optband, st_optmag: @planet.st_optmag, st_rad: @planet.st_rad, st_teff: @planet.st_teff } }
    end

    assert_redirected_to planet_url(Planet.last)
  end

  test "should show planet" do
    get planet_url(@planet)
    assert_response :success
  end

  test "should get edit" do
    get edit_planet_url(@planet)
    assert_response :success
  end

  test "should update planet" do
    patch planet_url(@planet), params: { planet: { gaia_dist: @planet.gaia_dist, gaia_gmag: @planet.gaia_gmag, loc_rowid: @planet.loc_rowid, pl_bmassj: @planet.pl_bmassj, pl_controvflag: @planet.pl_controvflag, pl_dens: @planet.pl_dens, pl_eqt: @planet.pl_eqt, pl_hostname: @planet.pl_hostname, pl_letter: @planet.pl_letter, pl_masse: @planet.pl_masse, pl_mnum: @planet.pl_mnum, pl_name: @planet.pl_name, pl_nnotes: @planet.pl_nnotes, pl_orbeccen: @planet.pl_orbeccen, pl_orbincl: @planet.pl_orbincl, pl_orbper: @planet.pl_orbper, pl_orbsmax: @planet.pl_orbsmax, pl_pnum: @planet.pl_pnum, pl_publ_date: @planet.pl_publ_date, pl_radj: @planet.pl_radj, pl_ratdor: @planet.pl_ratdor, pl_ratror: @planet.pl_ratror, pl_status: @planet.pl_status, rowupdate: @planet.rowupdate, st_dist: @planet.st_dist, st_mass: @planet.st_mass, st_optband: @planet.st_optband, st_optmag: @planet.st_optmag, st_rad: @planet.st_rad, st_teff: @planet.st_teff } }
    assert_redirected_to planet_url(@planet)
  end

  test "should destroy planet" do
    assert_difference('Planet.count', -1) do
      delete planet_url(@planet)
    end

    assert_redirected_to planets_url
  end
end

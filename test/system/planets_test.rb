require "application_system_test_case"

class PlanetsTest < ApplicationSystemTestCase
  setup do
    @planet = planets(:one)
  end

  test "visiting the index" do
    visit planets_url
    assert_selector "h1", text: "Planets"
  end

  test "creating a Planet" do
    visit planets_url
    click_on "New Planet"

    fill_in "Gaia dist", with: @planet.gaia_dist
    fill_in "Gaia gmag", with: @planet.gaia_gmag
    fill_in "Loc rowid", with: @planet.loc_rowid
    fill_in "Pl bmassj", with: @planet.pl_bmassj
    check "Pl controvflag" if @planet.pl_controvflag
    fill_in "Pl dens", with: @planet.pl_dens
    fill_in "Pl eqt", with: @planet.pl_eqt
    fill_in "Pl hostname", with: @planet.pl_hostname
    fill_in "Pl letter", with: @planet.pl_letter
    fill_in "Pl masse", with: @planet.pl_masse
    fill_in "Pl mnum", with: @planet.pl_mnum
    fill_in "Pl name", with: @planet.pl_name
    fill_in "Pl nnotes", with: @planet.pl_nnotes
    fill_in "Pl orbeccen", with: @planet.pl_orbeccen
    fill_in "Pl orbincl", with: @planet.pl_orbincl
    fill_in "Pl orbper", with: @planet.pl_orbper
    fill_in "Pl orbsmax", with: @planet.pl_orbsmax
    fill_in "Pl pnum", with: @planet.pl_pnum
    fill_in "Pl publ date", with: @planet.pl_publ_date
    fill_in "Pl radj", with: @planet.pl_radj
    fill_in "Pl ratdor", with: @planet.pl_ratdor
    fill_in "Pl ratror", with: @planet.pl_ratror
    fill_in "Pl status", with: @planet.pl_status
    fill_in "Rowupdate", with: @planet.rowupdate
    fill_in "St dist", with: @planet.st_dist
    fill_in "St mass", with: @planet.st_mass
    fill_in "St optband", with: @planet.st_optband
    fill_in "St optmag", with: @planet.st_optmag
    fill_in "St rad", with: @planet.st_rad
    fill_in "St teff", with: @planet.st_teff
    click_on "Create Planet"

    assert_text "Planet was successfully created"
    click_on "Back"
  end

  test "updating a Planet" do
    visit planets_url
    click_on "Edit", match: :first

    fill_in "Gaia dist", with: @planet.gaia_dist
    fill_in "Gaia gmag", with: @planet.gaia_gmag
    fill_in "Loc rowid", with: @planet.loc_rowid
    fill_in "Pl bmassj", with: @planet.pl_bmassj
    check "Pl controvflag" if @planet.pl_controvflag
    fill_in "Pl dens", with: @planet.pl_dens
    fill_in "Pl eqt", with: @planet.pl_eqt
    fill_in "Pl hostname", with: @planet.pl_hostname
    fill_in "Pl letter", with: @planet.pl_letter
    fill_in "Pl masse", with: @planet.pl_masse
    fill_in "Pl mnum", with: @planet.pl_mnum
    fill_in "Pl name", with: @planet.pl_name
    fill_in "Pl nnotes", with: @planet.pl_nnotes
    fill_in "Pl orbeccen", with: @planet.pl_orbeccen
    fill_in "Pl orbincl", with: @planet.pl_orbincl
    fill_in "Pl orbper", with: @planet.pl_orbper
    fill_in "Pl orbsmax", with: @planet.pl_orbsmax
    fill_in "Pl pnum", with: @planet.pl_pnum
    fill_in "Pl publ date", with: @planet.pl_publ_date
    fill_in "Pl radj", with: @planet.pl_radj
    fill_in "Pl ratdor", with: @planet.pl_ratdor
    fill_in "Pl ratror", with: @planet.pl_ratror
    fill_in "Pl status", with: @planet.pl_status
    fill_in "Rowupdate", with: @planet.rowupdate
    fill_in "St dist", with: @planet.st_dist
    fill_in "St mass", with: @planet.st_mass
    fill_in "St optband", with: @planet.st_optband
    fill_in "St optmag", with: @planet.st_optmag
    fill_in "St rad", with: @planet.st_rad
    fill_in "St teff", with: @planet.st_teff
    click_on "Update Planet"

    assert_text "Planet was successfully updated"
    click_on "Back"
  end

  test "destroying a Planet" do
    visit planets_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Planet was successfully destroyed"
  end
end
